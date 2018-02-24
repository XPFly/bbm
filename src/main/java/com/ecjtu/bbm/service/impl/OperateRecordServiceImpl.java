package com.ecjtu.bbm.service.impl;

import com.ecjtu.bbm.common.constants.OperateRecordEnum;
import com.ecjtu.bbm.orm.domain.OperateRecord;
import com.ecjtu.bbm.orm.domain.User;
import com.ecjtu.bbm.orm.mapper.OperateRecordMapper;
import com.ecjtu.bbm.service.OperateRecordService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * @description:
 * @author: xu_pf@suixingpay.com
 * @date: 2018/1/13
 */
@Service
public class OperateRecordServiceImpl implements OperateRecordService {

    private static final Logger LOGGER = LoggerFactory.getLogger(OperateRecordServiceImpl.class);

    @Autowired
    private OperateRecordMapper operateRecordMapper;

    @Override
    public List<OperateRecord> findList(String foreignKey) {
        return operateRecordMapper.findList(foreignKey);
    }

    @Override
    public void insertRecord(User user, String foreignKey, OperateRecordEnum type, OperateRecordEnum contentValue) {
        OperateRecord operateRecord = new OperateRecord();
        operateRecord.setUuid(UUID.randomUUID().toString().replace("-",""));
        operateRecord.setForeignKey(foreignKey);
        operateRecord.setOperateTime(new Date());
        operateRecord.setOperateType(type.getCode());
        operateRecord.setContentNo(contentValue.getContentValue());
        try {
            operateRecord.setOperator(user.getNickName());
            operateRecordMapper.insert(operateRecord);
            LOGGER.info("保存操作记录：[]",operateRecord.toString());
        }catch (Exception e){
            LOGGER.error("保存操作记录异常",e);
        }
    }
}
