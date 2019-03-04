package com.springtest.springboot.service;

import com.springtest.springboot.po.SysRolePermission;

public interface SysRolePermissionService {

    public SysRolePermission findById(Integer id);

    public int add(SysRolePermission sysRolePermission);

    public  int update(SysRolePermission  sysRolePermission);

    public  int  delete(Integer id);

    public void deleteByRoleIdAndPermissionId(Integer roleId,Integer permissionId);
}
