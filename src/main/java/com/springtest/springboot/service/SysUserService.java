package com.springtest.springboot.service;

import com.springtest.springboot.po.SysUser;

public interface SysUserService {

    //根据用户账号查询用户信息
    public SysUser findByAccountNumber(String number);
}
