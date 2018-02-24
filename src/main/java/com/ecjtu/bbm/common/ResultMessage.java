package com.ecjtu.bbm.common;

import java.util.HashMap;
import java.util.Map;

/**
 * @description:
 * @author: xu_pf@suixingpay.com
 * @date: 2018/2/8
 */
public class ResultMessage {

    private static final String DEAL_SUCCESS = "200";
    private static final String DEAL_FAIL = "100";

    /**
     * 状态码：100-失败 200-成功
     */
    private String code;
    /**
     * 描述信息：对状态码的描述
     */
    private String description;
    /**
     * 响应数据：返回给客户端的数据
     */
    private Map<String,Object> responseData = new HashMap<>();

    public static ResultMessage success(){
        ResultMessage result = new ResultMessage();
        result.setCode(DEAL_SUCCESS);
        result.setDescription("处理成功!");
        return result;
    }

    public static ResultMessage fail(){
        ResultMessage result = new ResultMessage();
        result.setCode(DEAL_FAIL);
        result.setDescription("处理失败!");
        return result;
    }

    public ResultMessage add(String key,Object value){
        this.getResponseData().put(key,value);
        return this;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public Map<String, Object> getResponseData() {
        return responseData;
    }

    public void setResponseData(Map<String, Object> responseData) {
        this.responseData = responseData;
    }
}
