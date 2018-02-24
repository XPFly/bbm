package com.ecjtu.bbm.controller;

import com.ecjtu.bbm.orm.domain.OperateRecord;
import com.ecjtu.bbm.service.impl.OperateRecordServiceImpl;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.websocket.server.PathParam;
import java.util.List;

/**
 * @description:
 * @author: xu_pf@suixingpay.com
 * @date: 2018/1/13
 */
@Controller
@RequestMapping("/bbm/operateRecord")
public class OperateRecordController {

    private static final Logger LOGGER = LoggerFactory.getLogger(OperateRecordController.class);

    @Autowired
    private OperateRecordServiceImpl operateRecordServiceImpl;

    @RequestMapping("/list")
    public String findList(@PathParam("foreignKey")String foreignKey, Model model){
        LOGGER.info("对[{}]的操作记录",foreignKey);
        List<OperateRecord> operateRecordList = operateRecordServiceImpl.findList(foreignKey);
        model.addAttribute("operateRecordList",operateRecordList);
        return "/bbm/operateRecord/operateRecordList";
    }
}
