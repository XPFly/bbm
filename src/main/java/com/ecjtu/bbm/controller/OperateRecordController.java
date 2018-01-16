package com.ecjtu.bbm.controller;

import com.ecjtu.bbm.orm.domain.OperateRecord;
import com.ecjtu.bbm.service.impl.OperateRecordServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

/**
 * @description:
 * @author: xu_pf@suixingpay.com
 * @date: 2018/1/13
 */
@Controller
@RequestMapping("/bbm/operate")
public class OperateRecordController {

    @Autowired
    private OperateRecordServiceImpl operateRecordServiceImpl;

    @RequestMapping("/list")
    public String findList(Model model){
        List<OperateRecord> operateRecordList = operateRecordServiceImpl.findList("01");
        model.addAttribute("operateRecordList",operateRecordList);
        return "/bbm/operateRecord/operateRecordList";
    }
}
