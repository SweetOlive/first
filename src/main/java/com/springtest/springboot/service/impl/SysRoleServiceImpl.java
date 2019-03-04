package com.springtest.springboot.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.springtest.springboot.dao.SysRoleMapper;
import com.springtest.springboot.po.SysRole;
import com.springtest.springboot.service.SysRoleService;
import com.springtest.springboot.util.page.PageList;
import com.springtest.springboot.util.page.Paginator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service(value = "sysRoleService")
public class SysRoleServiceImpl  implements SysRoleService {

    @Autowired
    private SysRoleMapper sysRoleMapper;

    //角色分页列表
    @Override
    public PageList<SysRole> findAllPage(SysRole sysRole , Integer pageNum, Integer pageSize){
        Page<Object> result = PageHelper.startPage(pageNum,pageSize);
        List<SysRole> list = sysRoleMapper.findAll(sysRole);
        Paginator paginator = new Paginator(pageNum, pageSize, (int)result.getTotal());
        PageList<SysRole> pageList = new PageList<SysRole>(paginator);
        pageList.setData(list);
        return pageList;
    }

    //新增角色
    @Override
    public int add(SysRole sysRole){
        return  sysRoleMapper.insert(sysRole);
    }

    //修改角色
    @Override
    public  int update (SysRole sysRole){
        return  sysRoleMapper.updateByPrimaryKeySelective(sysRole);
    }

    //删除角色
    @Override
    public int   delete(Integer id){
        return sysRoleMapper.deleteByPrimaryKey(id);
    }

    //根据id查询角色信息
    @Override
    public  SysRole findById(Integer id){
        return sysRoleMapper.selectByPrimaryKey(id);
    }

    @Override
    public SysRole findByName(String name){
        return sysRoleMapper.findByName(name);
    }

    @Override
    public List<SysRole> findByUserId(Integer userId){
        return sysRoleMapper.findByUserId(userId);
    }

}
