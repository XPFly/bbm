package com.ecjtu.bbm;

import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

/**
 * @description:
 * @author: xu_pf@suixingpay.com
 * @date: 2018/1/12
 */
@SpringBootApplication
@MapperScan(basePackages = "com.ecjtu.bbm.orm.mapper")
public class StartApp {
    public static void main(String[] args) {
        SpringApplication.run(StartApp.class, args);
    }
}
