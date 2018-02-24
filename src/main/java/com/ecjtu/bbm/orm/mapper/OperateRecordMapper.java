package com.ecjtu.bbm.orm.mapper;

import com.ecjtu.bbm.orm.domain.OperateRecord;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @description:
 * @author: xu_pf@suixingpay.com
 * @date: 2018/1/13
 */
@Repository
public interface OperateRecordMapper {
    /**
     * 操作记录
     *
     * @param foreignKey 外键
     * @return          OperateRecord
     */
    List<OperateRecord> findList(String foreignKey);

    /**
     * 插入操作记录
     *
     * @param record    OperateRecord
     */
    void insert(OperateRecord record);
}
