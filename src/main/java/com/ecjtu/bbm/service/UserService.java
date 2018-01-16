package com.ecjtu.bbm.service;

import com.ecjtu.bbm.orm.domain.User;

import java.util.List;

/**
 * @description: 用户Service接口
 * @author: xu_pf@suixingpay.com
 * @date: 2018/1/13
 */
public interface UserService {
    /**
     * 查询：根据相应条件查询
     *
     * @param user  User
     * @return      List<User>
     */
    List<User> findList(User user);

    /**
     * 查询：根据UUID查询
     *
     * @param uuid  UUID
     * @return      User
     */
    User findOne(String uuid);

    /**
     * 插入
     *
     * @param user  User
     */
    void save(User user);
}
