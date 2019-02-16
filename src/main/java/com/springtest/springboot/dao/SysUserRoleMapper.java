package com.springtest.springboot.dao;

import com.springtest.springboot.po.SysUserRole;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysUserRoleMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SysUserRole record);

    int insertSelective(SysUserRole record);

    SysUserRole selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SysUserRole record);

    int updateByPrimaryKey(SysUserRole record);

    List<SysUserRole> findByRoleId(@Param("roleId") Integer roleId);

    //根据用户id，角色id删除关联关系
    void deleteByRoleIdAndUserId(@Param("roleId") Integer roleId,@Param("userId") Integer userId);
}