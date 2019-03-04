package com.springtest.springboot.dao;

import com.springtest.springboot.po.SysRolePermission;
import org.apache.ibatis.annotations.Param;

public interface SysRolePermissionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SysRolePermission record);

    int insertSelective(SysRolePermission record);

    SysRolePermission selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SysRolePermission record);

    int updateByPrimaryKey(SysRolePermission record);

    void deleteByRoleIdAndPermissionId(@Param("roleId") Integer roleId,@Param("permissionId") Integer permissionId);
}