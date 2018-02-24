package com.ecjtu.bbm.common.constants;

/**
 * @description: 操作记录（类型、内容）枚举
 * @author: xu_pf@suixingpay.com
 * @date: 2018/1/12
 */
public enum OperateRecordEnum {
    /**
     * 操作类型
     */
    INSERT("00", "新增"), DELETE("01", "删除"), QUERY("02", "查询"), UPDATE("03", "更新"),
    /**
     * 操作内容
     */
    USER("用户")

    ;

    private String code;
    private String value;
    private String contentValue;

    OperateRecordEnum(String contentValue) {
        this.contentValue = contentValue;
    }

    OperateRecordEnum(String code, String value) {
        this.code = code;
        this.value = value;
    }

    public String getCode() {
        return code;
    }

    public String getValue() {
        return value;
    }

    public String getContentValue() {
        return contentValue;
    }
}
