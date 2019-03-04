package com.springtest.springboot.service.impl;

import com.springtest.springboot.dao.SysRolePermissionMapper;
import com.springtest.springboot.po.SysRolePermission;
import com.springtest.springboot.service.SysRolePermissionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "sysRolePermissionService")
public class SysRolePermissionServiceImpl implements SysRolePermissionService {

    @Autowired
    private SysRolePermissionMapper sysRolePermissionMapper;

    @Override
    public SysRolePermission findById(Integer id){
        return sysRolePermissionMapper.selectByPrimaryKey(id);
    }

    @Override
    public int add(SysRolePermission sysRolePermission){
        return sysRolePermissionMapper.insert(sysRolePermission);
    }

    @Override
    public  int update(SysRolePermission  sysRolePermission){
        return sysRolePermissionMapper.updateByPrimaryKeySelective(sysRolePermission);
    }

    @Override
    public  int  delete(Integer id){
        return sysRolePermissionMapper.deleteByPrimaryKey(id);
    }

    @Override
    public void deleteByRoleIdAndPermissionId(Integer roleId,Integer permissionId){
        sysRolePermissionMapper.deleteByRoleIdAndPermissionId( roleId, permissionId);
    }

}
