package com.springtest.springboot.service;

import com.springtest.springboot.po.SysUser;
import com.springtest.springboot.util.page.PageList;

import java.util.List;

public interface SysUserService {

    //根据用户账号查询用户信息
    public SysUser findByAccountNumber(String number);

    //所有用户信息
    public PageList<SysUser> findAll(SysUser sysUser,Integer pageNum, Integer pageSize);

    //新增用户
    public int add(SysUser sysUser);

    //根据用户id查找用户实体
    public SysUser findById(Integer id);

    //修改更新用户信息
    public int update(SysUser sysUser);

    //根据id删除用户
    public int delete(Integer id);
}
