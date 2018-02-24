package com.ecjtu.bbm.service;

import com.ecjtu.bbm.common.constants.OperateRecordEnum;
import com.ecjtu.bbm.orm.domain.OperateRecord;
import com.ecjtu.bbm.orm.domain.User;

import java.util.List;

/**
 * @description:
 * @author: xu_pf@suixingpay.com
 * @date: 2018/1/13
 */
public interface OperateRecordService {
    /**
     * 操作记录
     *
     * @param foreignKey 外键
     * @return          OperateRecord
     */
    List<OperateRecord> findList(String foreignKey);

    void insertRecord(User user, String foreignKey, OperateRecordEnum type, OperateRecordEnum contentValue);
}
