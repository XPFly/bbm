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

    public static int getInt(String key, int defaultValue) {
        String str = ((HttpServletRequest)REQUEST.get()).getParameter(key);
        return StringUtils.isEmpty(str) ? defaultValue : Integer.parseInt(str);
    }

    public static int getParamValue(String key,int defaultValue,HttpServletRequest request){
        String paramValue = request.getParameter(key);
        return StringUtils.isEmpty(paramValue) ? defaultValue : Integer.parseInt(paramValue);
    }
}
