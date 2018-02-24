package com.ecjtu.bbm.common.utils;

import org.springframework.util.StringUtils;

import javax.servlet.http.HttpServletRequest;

/**
 * @description:
 * @author: xu_pf@suixingpay.com
 * @date: 2018/2/6
 */
public final class RequestHelper {

    private static final ThreadLocal<HttpServletRequest> REQUEST = new ThreadLocal();

    public static int getParamValueOfInt(String key,int defaultValue,HttpServletRequest request){
        String paramValue = request.getParameter(key);
        return StringUtils.isEmpty(paramValue) ? defaultValue : Integer.parseInt(paramValue);
    }

    public static String getParamValueOfString(String key,HttpServletRequest request){
        getParamValueOfString(key,"",request);
        return null;
    }

    public static String getParamValueOfString(String key,String defaultValue,HttpServletRequest request){
        String paramValue = request.getParameter(key);
        return StringUtils.isEmpty(paramValue) ? defaultValue : paramValue.trim();
    }
}
