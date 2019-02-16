package com.springtest.springboot.service;

import com.springtest.springboot.po.SysUserRole;

import java.util.List;

public interface SysUserRoleService {

    //新增
    public int add(SysUserRole s);

    //修改
    public int update(SysUserRole s);

    //删除
    public int delete(Integer id);

    //根据角色id查询已分配的所有用户
    public List<SysUserRole> findByRoleId(Integer roleId);

    //根据用户userId集合删除关联关系
    public void removeUserFromRole(Integer roleId,Integer[] userIdsL);

    //根据用户userId集合新增关联关系
    public  void addUserFromRole(Integer nowId,Integer roleId,Integer[] userIdsL);

}
