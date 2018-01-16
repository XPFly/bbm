package com.ecjtu.bbm.orm.po;

import java.io.Serializable;
import java.util.Date;

/**
 * @description: 操作记录表Po
 * @author: xu_pf@suixingpay.com
 * @date: 2018/1/12
 */
public class OperateRecordPo implements Serializable {

    private static final long serialVersionUID = 1L;
    /**
     * UUID
     */
    private String uuid;
    /**
     * 外键
     */
    private String foreignKey;
    /**
     * 操作人
     */
    private String operator;
    /**
     * 操作类型
     */
    private String operateType;
    /**
     * 内容编号
     */
    private String contentNo;
    /**
     * 操作时间
     */
    private Date operateTime;
    /**
     * 备注
     */
    private String remark;

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getForeignKey() {
        return foreignKey;
    }

    public void setForeignKey(String foreignKey) {
        this.foreignKey = foreignKey;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    public String getOperateType() {
        return operateType;
    }

    public void setOperateType(String operateType) {
        this.operateType = operateType;
    }

    public String getContentNo() {
        return contentNo;
    }

    public void setContentNo(String contentNo) {
        this.contentNo = contentNo;
    }

    public Date getOperateTime() {
        return operateTime;
    }

    public void setOperateTime(Date operateTime) {
        this.operateTime = operateTime;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    @Override
    public String toString() {
        return "OperateRecordPo{" +
                "uuid='" + uuid + '\'' +
                ", foreignKey='" + foreignKey + '\'' +
                ", operator='" + operator + '\'' +
                ", operateType='" + operateType + '\'' +
                ", contentNo='" + contentNo + '\'' +
                ", operateTime='" + operateTime + '\'' +
                ", remark='" + remark + '\'' +
                '}';
    }
}
