package com.springtest.springboot.service;

import com.springtest.springboot.po.SysRole;
import com.springtest.springboot.util.page.PageList;

import java.util.List;

public interface SysRoleService {

    //角色分页列表
    public PageList<SysRole> findAllPage(SysRole sysRole , Integer pageNum, Integer pageSize);

    //新增角色
    public int add(SysRole sysRole);

    //修改角色
    public  int update (SysRole sysRole);

    //删除角色
    public int   delete(Integer id);

    //根据id查询角色信息
    public  SysRole findById(Integer id);

    public SysRole findByName(String name);

    public List<SysRole> findByUserId(Integer userId);
}
