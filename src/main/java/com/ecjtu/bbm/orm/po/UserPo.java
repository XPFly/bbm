package com.ecjtu.bbm.orm.po;

import java.io.Serializable;
import java.util.Date;

/**
 * @description: 用户PO
 * @author: xu_pf@suixingpay.com
 * @date: 2018/1/13
 */
public class UserPo implements Serializable {
    private static final long serialVersionUID = 1L;
    /**
     * UUID
     */
    private String uuid;
    /**
     * ACCOUNT：账号（登录时使用）
     */
    private String account;
    /**
     * NICKNAME：昵称
     */
    private String nickName;
    /**
     * ICON：头像
     */
    private String icon;
    /**
     * GENDER：性别
     */
    private String gender;
    /**
     * MAIL：邮箱
     */
    private String mail;
    /**
     * AUTHORITY：权限
     */
    private String authority;
    /**
     * CREATE_TIME：创建时间
     */
    private Date createTime;
    /**
     * UPDATE_TIME：更新时间
     */
    private Date updateTime;
    /**
     * LAST_LOGIN_TIME：最近一次登录的时间
     */
    private Date lastLoginTime;
    /**
     * OPERATOR：操作人
     */
    private String operator;

    public String getUuid() {
        return uuid;
    }

    public void setUuid(String uuid) {
        this.uuid = uuid;
    }

    public String getAccount() {
        return account;
    }

    public void setAccount(String account) {
        this.account = account;
    }

    public String getNickName() {
        return nickName;
    }

    public void setNickName(String nickName) {
        this.nickName = nickName;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getMail() {
        return mail;
    }

    public void setMail(String mail) {
        this.mail = mail;
    }

    public String getAuthority() {
        return authority;
    }

    public void setAuthority(String authority) {
        this.authority = authority;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public Date getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(Date lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public String getOperator() {
        return operator;
    }

    public void setOperator(String operator) {
        this.operator = operator;
    }

    @Override
    public String toString() {
        return "UserPo{" +
                "uuid='" + uuid + '\'' +
                ", account='" + account + '\'' +
                ", nickName='" + nickName + '\'' +
                ", icon='" + icon + '\'' +
                ", gender='" + gender + '\'' +
                ", mail='" + mail + '\'' +
                ", authority='" + authority + '\'' +
                ", createTime=" + createTime +
                ", updateTime=" + updateTime +
                ", lastLoginTime=" + lastLoginTime +
                ", operator='" + operator + '\'' +
                '}';
    }
}
