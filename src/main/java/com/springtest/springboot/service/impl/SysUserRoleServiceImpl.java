package com.springtest.springboot.service.impl;

import com.springtest.springboot.dao.SysUserRoleMapper;
import com.springtest.springboot.po.SysUserRole;
import com.springtest.springboot.service.SysUserRoleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import java.util.Date;
import java.util.List;

@Service(value = "sysUserRoleService")
public class SysUserRoleServiceImpl implements SysUserRoleService {

    @Autowired
    private SysUserRoleMapper sysUserRoleMapper;

    //新增
    @Override
    public int add(SysUserRole s){
        return sysUserRoleMapper.insert(s);
    }

    //修改
    @Override
    public int update(SysUserRole s){
        return  sysUserRoleMapper.updateByPrimaryKeySelective(s);
    }

    //删除
    @Override
    public int delete(Integer id){
        return sysUserRoleMapper.deleteByPrimaryKey(id);
    }

    //根据角色id查询已分配的所有用户
    @Override
    public List<SysUserRole> findByRoleId(Integer roleId){
        return sysUserRoleMapper.findByRoleId(roleId);
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void removeUserFromRole(Integer roleId,Integer[] userIdsL){
        if (userIdsL != null) {
            for (Integer userId : userIdsL) {
                System.out.println("删除 -- roleId: "+roleId+"   userId:"+userId);
                sysUserRoleMapper.deleteByRoleIdAndUserId(roleId, userId);
            }
        }
    }

    @Override
    @Transactional(propagation = Propagation.REQUIRED)
    public void addUserFromRole(Integer nowId,Integer roleId,Integer[] userIdsL){
        if (userIdsL != null) {
            for (Integer userId : userIdsL) {
                System.out.println("添加 -- roleId: "+roleId+"   userId:"+userId);
                SysUserRole sysUserRole = new SysUserRole();
                sysUserRole.setRoleId(roleId);
                sysUserRole.setUserId(userId);
                sysUserRole.setCreateTime(new Date());
                sysUserRole.setCreateUserId(nowId);
                sysUserRoleMapper.insert(sysUserRole);
            }
        }
    }
}
