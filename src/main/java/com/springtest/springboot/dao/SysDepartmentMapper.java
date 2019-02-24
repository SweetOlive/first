package com.springtest.springboot.dao;

import com.springtest.springboot.po.SysDepartment;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SysDepartmentMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SysDepartment record);

    int insertSelective(SysDepartment record);

    SysDepartment selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SysDepartment record);

    int updateByPrimaryKey(SysDepartment record);

    //根据父部门id查询所有部门
    public List<SysDepartment> findByParentId(@Param("parentId") Integer id);

    public List<SysDepartment> findAll();
}