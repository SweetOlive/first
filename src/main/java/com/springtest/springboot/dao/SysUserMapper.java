package com.springtest.springboot.dao;

import com.springtest.springboot.po.SysUser;
import org.apache.ibatis.annotations.Param;

public interface SysUserMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SysUser record);

    int insertSelective(SysUser record);

    SysUser selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SysUser record);

    int updateByPrimaryKey(SysUser record);

    //根据账号查找是否存在这个用户
    public SysUser findByAccountNumber(@Param("number")String number);
}