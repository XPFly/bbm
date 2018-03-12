package com.ecjtu.bbm.controller;

import com.ecjtu.bbm.common.AbstractController;
import com.ecjtu.bbm.common.ResultMessage;
import com.ecjtu.bbm.common.constants.OperateRecordEnum;
import com.ecjtu.bbm.common.orm.domain.MailInfo;
import com.ecjtu.bbm.common.orm.po.MailInfoPo;
import com.ecjtu.bbm.common.utils.ExcelUtils;
import com.ecjtu.bbm.common.utils.MailUtils;
import com.ecjtu.bbm.common.utils.RequestHelper;
import com.ecjtu.bbm.orm.domain.User;
import com.ecjtu.bbm.service.impl.OperateRecordServiceImpl;
import com.ecjtu.bbm.service.impl.UserServiceImpl;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 * @description:
 * @author: xu_pf@suixingpay.com
 * @date: 2018/1/13
 */
@Controller
@RequestMapping("/bbm/user")
public class UserController extends AbstractController {

    private static final Logger LOGGER = LoggerFactory.getLogger(UserController.class);
    private static final String REQUEST_METHOD = "GET";

    @Autowired
    private UserServiceImpl userServiceImpl;

    @Autowired
    private OperateRecordServiceImpl operateRecordServiceImpl;

    @RequestMapping("/test")
    public String test(){

        return "/bbm/article/articleAdd";
    }

    @RequestMapping(value = "/demo",method = RequestMethod.POST)
    @ResponseBody
    public String demo(HttpServletRequest request){
        LOGGER.info("开始：获取内容====");
        String content = request.getParameter("content");
        LOGGER.info("获取内容【{}】",content);
        return content;
    }

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
            Integer count = userServiceImpl.count(user);
            PageHelper.startPage(RequestHelper.getParamValueOfInt("pageNum",PAGE_NUM,request),RequestHelper.getParamValueOfInt("pageSize",PAGE_SIZE,request));
            List<User> userList = userServiceImpl.findList(user);
            PageInfo<User> pageInfo = new PageInfo<>(userList,5);
            model.addAttribute("userList", userList).addAttribute("pageInfo", pageInfo).addAttribute("user", user).addAttribute("count", count);
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
        LOGGER.info("跳转到添加页面");
        model.addAttribute("user",user);
        return "bbm/user/userAdd";
    }

    /**
     * 保存用户信息
     *
     * @param user  User
     */
    @RequestMapping(value = "/save",method = RequestMethod.POST)
    @ResponseBody
    public ResultMessage save (User user){
        LOGGER.info("保存用户信息：[{}]",user.toString());
        userServiceImpl.save(user);
        // 保存操作记录
        //operateRecordServiceImpl.insertRecord(user,user.getUuid(), OperateRecordEnum.INSERT,OperateRecordEnum.USER);
        return ResultMessage.success();
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
    @RequestMapping("/edit")
    public String edit(HttpServletRequest request, Model model){
        User user = userServiceImpl.findOne(request.getParameter("uuid"));
        model.addAttribute("user",user);
        return "bbm/user/userEdit";
    }

    @RequestMapping("/update")
    @ResponseBody
    public ResultMessage update(User user){
        userServiceImpl.updateByPrimaryKeySelective(user);
        return ResultMessage.success();
    }

    /**
     * 删除用户
     *
     * @param ids   UUID（集合）
     */
    @RequestMapping(value = "/delete/{ids}")
    @ResponseBody
    public ResultMessage delete(@PathVariable("ids") String ids){
        if (!StringUtils.isEmpty(ids)){
            LOGGER.info("删除用户的uuid：[{}]",ids);
            if (ids.contains("-")){
                ArrayList<String> idList = new ArrayList<>();
                String[] idArr = ids.split("-");
                for (String uuid : idArr){
                    idList.add(uuid);
                }
                userServiceImpl.deleteByBatch(idList);
            }else {
                userServiceImpl.delete(ids);
            }
            return ResultMessage.success();
        }
        return ResultMessage.fail().add("error","操作方式有误");
    }

    /**
     * 将查询出的数据导入到Excel
     *
     * @param user      User
     * @param response  HttpServletResponse
     */
    @RequestMapping(value = "/excelExport")
    public void excel(User user,HttpServletResponse response){
        // 设置表名
        String fileName = "用户信息表";
        // 设置表格表头
        ArrayList<String> fieldNameList = new ArrayList<>();
        fieldNameList.add("账号");
        fieldNameList.add("昵称");
        fieldNameList.add("性别");
        fieldNameList.add("邮箱");
        fieldNameList.add("权限");
        fieldNameList.add("创建时间");
        fieldNameList.add("更新时间");
        fieldNameList.add("最近登录的时间");

        ExcelUtils excelUtils = new ExcelUtils(fileName, fieldNameList);

        // 赋值
        ArrayList<ArrayList<String>> dataList = new ArrayList<>();
        List<User> userList = userServiceImpl.findList(user);
        for (User userRow : userList) {
            ArrayList<String> temp = new ArrayList<>();
            temp.add(userRow.getAccount());
            temp.add(userRow.getNickName());
            switch (userRow.getGender()){
                case "0":
                    temp.add("男");
                    break;
                case "1":
                    temp.add("女");
                    break;
                default:
                    temp.add("");
                    break;
            }
            temp.add(userRow.getMail());
            switch (userRow.getAuthority()){
                case "0":
                    temp.add("管理员");
                    break;
                case "1":
                    temp.add("普通用户");
                    break;
                default:
                    temp.add("");
                    break;
            }
            temp.add(ExcelUtils.formatDate(userRow.getCreateTime()));
            if (userRow.getUpdateTime() != null){
                temp.add(ExcelUtils.formatDate(userRow.getUpdateTime()));
            }else {
                temp.add("");
            }
            if (userRow.getLastLoginTime() != null){
                temp.add(ExcelUtils.formatDate(userRow.getLastLoginTime()));
            }else {
                temp.add("");
            }
            dataList.add(temp);
        }
        excelUtils.insertDataToExcel(1,dataList);
        excelUtils.downloadExcel(excelUtils,fileName,response);
    }
}
