package com.ecjtu.bbm.controller;

import com.ecjtu.bbm.orm.domain.User;
import com.ecjtu.bbm.service.impl.UserServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
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
}
