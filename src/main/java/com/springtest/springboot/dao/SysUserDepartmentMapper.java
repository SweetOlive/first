package com.springtest.springboot.dao;

import com.springtest.springboot.po.SysUserDepartment;

public interface SysUserDepartmentMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SysUserDepartment record);

    int insertSelective(SysUserDepartment record);

    SysUserDepartment selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SysUserDepartment record);

    int updateByPrimaryKey(SysUserDepartment record);
}