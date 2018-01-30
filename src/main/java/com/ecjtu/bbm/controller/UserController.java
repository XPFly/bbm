package com.ecjtu.bbm.controller;

import com.ecjtu.bbm.orm.domain.User;
import com.ecjtu.bbm.service.impl.UserServiceImpl;
import com.github.pagehelper.PageHelper;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.List;

/**
 * @description:
 * @author: xu_pf@suixingpay.com
 * @date: 2018/1/13
 */
@Controller
@RequestMapping("/bbm/user")
public class UserController {

    private static final Logger LOGGER = LoggerFactory.getLogger(UserController.class);
    private static final String REQUEST_METHOD = "GET";

    @Autowired
    private UserServiceImpl userServiceImpl;

    /**
     * 用户信息展示页面
     *
     * @param user  User
     * @param model Model
     * @return      String
     */
    @RequestMapping("/list")
    public String findList(User user, Model model,HttpServletRequest request){
        // 判断是否是第一次进入，若为GET请求则是第一次进入则不进行查询，直接返回，是POST请求则进行查询
        if (REQUEST_METHOD.equals(request.getMethod())){
            model.addAttribute("userList","").addAttribute("user",user);
        }else {
            PageHelper.startPage(1,5);
            List<User> userList = userServiceImpl.findList(user);
            model.addAttribute("userList", userList).addAttribute("user", user);
        }
        return "/bbm/user/userList";
    }

    /**
     * 跳转到添加页面
     *
     * @return  String
     */
    @RequestMapping(value = "/add")
    public String add(Model model,User user){
        model.addAttribute("user",user);
        return "bbm/user/userAdd";
    }

    /**
     * 保存用户信息
     *
     * @param user  User
     */
    @RequestMapping(value = "/save")
    public void save (User user){
        LOGGER.info("==保存用户信息==>");
        userServiceImpl.save(user);
    }

    /**
     * 用户信息详情页面
     *
     * @param request   HttpServletRequest
     * @param model     Model
     * @return          String
     */
    @RequestMapping(value = "detail")
    public String detail(HttpServletRequest request, Model model){
        String uuid = request.getParameter("uuid");
        User user = userServiceImpl.findOne(uuid);
        model.addAttribute("user",user);
        return "bbm/user/userDetail";
    }

    /**
     * 跳转编辑页面
     *
     * @param request   HttpServletRequest
     * @param model     Model
     * @return          String
     */
    @RequestMapping("edit")
    public String edit(HttpServletRequest request, Model model){
        User user = userServiceImpl.findOne(request.getParameter("uuid"));
        model.addAttribute("user",user);
        return "bbm/user/userEdit";
    }

    @RequestMapping("update")
    public void update(){

    }

    /**
     * 删除单个用户
     *
     * @param uuid  UUID
     */
    @RequestMapping(value = "/delete")
    public void delete(@RequestParam("uuid") String uuid){
        userServiceImpl.delete(uuid);
    }

    /**
     * 将查询出的数据导入到Excel
     *
     * @param user      User
     * @param response  HttpServletResponse
     */
    @RequestMapping("/excelExport")
    public void createUserExcelToDisk(User user, HttpServletResponse response){
        // 数据库中查询数据
        List<User> userList = userServiceImpl.findList(user);

        // 第一步：创建一个webbook(工作簿)，对应一个Excel文件
        SXSSFWorkbook sxssfWorkbook = new SXSSFWorkbook(1000);
        // 第二步：在webbook中添加一个sheet(表格)，对应Excel文件的sheet，表格名：用户表
        Sheet sheet = sxssfWorkbook.createSheet("用户信息表");
        // 第三步：在sheet中添加表头第0行（注意老版本poi对Excel的行数列数有限制）
        Row row = sheet.createRow(0);
        sheet.createFreezePane(0,1,0,1);
        // 第四步：创建单元格，并设置值表头以及表头居中
        CellStyle cellStyle = sxssfWorkbook.createCellStyle();
        cellStyle.setAlignment(CellStyle.ALIGN_CENTER);

        // 表头内容
        String[] headers = {"账号","昵称","性别","邮箱","权限","创建时间","更新时间","最近登录的时间"};
        for (int i = 0; i < headers.length; i++) {
            Cell cell = row.createCell(i);
            cell.setCellValue(headers[i]);
            cell.setCellStyle(cellStyle);
            sheet.setColumnWidth(i,10*2*256);
        }

        // 第五步：写入实体数据（实际应用中这些数据从数据库中得到）
        for (int i = 0; i < userList.size(); i++) {
            row = sheet.createRow(i+1);

            User userRow = userList.get(i);
            // 第六步：创建单元格，并设置值
            // 账号
            row.createCell(0).setCellValue(userRow.getAccount());
            // 昵称
            row.createCell(1).setCellValue(userRow.getNickName());
            // 性别
            if (!StringUtils.isEmpty(userRow.getGender())){
                switch (userRow.getGender()){
                    case "0":
                        row.createCell(2).setCellValue("男");
                        break;
                    case "1":
                        row.createCell(2).setCellValue("女");
                        break;
                    default:
                        row.createCell(2).setCellValue("");
                        break;
                }
            }
            // 邮箱
            row.createCell(3).setCellValue(userRow.getMail());
            // 权限
            if (!StringUtils.isEmpty(userRow.getAuthority())){
                switch (userRow.getAuthority()){
                    case "0":
                        row.createCell(4).setCellValue("管理员");
                        break;
                    case "1":
                        row.createCell(4).setCellValue("普通用户");
                        break;
                    default:
                        row.createCell(4).setCellValue("");
                        break;
                }
            }

            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            // 创建时间
            row.createCell(5).setCellValue(simpleDateFormat.format(userRow.getCreateTime()));
            // 更新时间
            if (userRow.getUpdateTime() != null){
                row.createCell(6).setCellValue(simpleDateFormat.format(userRow.getUpdateTime()));
            }else {
                row.createCell(6).setCellValue("");
            }
            // 最近登录的时间
            if (userRow.getLastLoginTime() != null){
                row.createCell(7).setCellValue(simpleDateFormat.format(userRow.getLastLoginTime()));
            }else {
                row.createCell(7).setCellValue("");
            }
        }

        // 第七步：将文件存在指定位置
        OutputStream outputStream = null;
        try {
            response.addHeader("Content-Disposition","attachment;filename="+new String("用户信息表".getBytes(),"iso8859-1")+".xlsx");
            outputStream = new BufferedOutputStream(response.getOutputStream());
            response.setContentType("application/octet-stream");
            sxssfWorkbook.write(outputStream);
        }catch (Exception e){
            LOGGER.error("=====导出Excel异常=====",e);
        }finally {
            if (outputStream != null){
                try {
                    outputStream.flush();
                    outputStream.close();
                }catch (IOException e){
                    LOGGER.error(e.getMessage(),e);
                }
            }
        }
    }
}
