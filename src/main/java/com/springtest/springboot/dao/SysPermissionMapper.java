package com.springtest.springboot.dao;

import com.springtest.springboot.po.SysPermission;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysPermissionMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SysPermission record);

    int insertSelective(SysPermission record);

    SysPermission selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SysPermission record);

    int updateByPrimaryKey(SysPermission record);

    List<SysPermission> findAll(@Param("param")SysPermission sysPermission);

    List<SysPermission> findByParentId(@Param("parentId") Integer parentId);

    SysPermission findByNameParentId(@Param("name") String name,@Param("parentId") Integer parentId);

    SysPermission findByCode(@Param("code") String code);

    List<SysPermission> findByRoleId(@Param("roleId") Integer roleId);
}