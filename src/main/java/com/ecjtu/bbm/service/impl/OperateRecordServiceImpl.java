package com.ecjtu.bbm.service.impl;

import com.ecjtu.bbm.orm.domain.OperateRecord;
import com.ecjtu.bbm.orm.mapper.OperateRecordMapper;
import com.ecjtu.bbm.service.OperateRecordService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * @description:
 * @author: xu_pf@suixingpay.com
 * @date: 2018/1/13
 */
@Service
public class OperateRecordServiceImpl implements OperateRecordService {

    @Autowired
    private OperateRecordMapper operateRecordMapper;

    @Override
    public List<OperateRecord> findList(String contentNo) {
        return operateRecordMapper.findList(contentNo);
    }
}
