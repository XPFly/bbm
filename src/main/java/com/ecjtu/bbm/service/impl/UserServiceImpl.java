package com.ecjtu.bbm.service.impl;

import com.ecjtu.bbm.orm.domain.User;
import com.ecjtu.bbm.orm.mapper.UserMapper;
import com.ecjtu.bbm.service.UserService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.Date;
import java.util.List;
import java.util.UUID;

/**
 * @description: 用户Service实现类
 * @author: xu_pf@suixingpay.com
 * @date: 2018/1/13
 */
@Service
public class UserServiceImpl implements UserService{

    private static final Logger LOGGER = LoggerFactory.getLogger(UserServiceImpl.class);

    @Autowired
    private UserMapper userMapper;

    @Override
    public List<User> findList(User user) {
        return userMapper.findList(user);
    }

    @Override
    public User findOne(String uuid) {
        return userMapper.findOne(uuid);
    }

    @Override
    public void save(User user) {
        user.setUuid(UUID.randomUUID().toString().replace("-",""));
        LOGGER.info("UUID:[{}]",UUID.randomUUID().toString());
        user.setCreateTime(new Date());
        userMapper.save(user);
    }
}
