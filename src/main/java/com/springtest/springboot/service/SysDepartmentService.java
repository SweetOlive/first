package com.springtest.springboot.service;

import com.springtest.springboot.po.SysDepartment;
import net.sf.json.JSONArray;

public interface SysDepartmentService {

    //部门树数据
    public JSONArray findAllByTree(Integer parentId);

    //根据部门id查询部门实体信息
    public SysDepartment findById(Integer id);

    //新增部门
    public int add(SysDepartment sysDepartment);

    //更新部门信息
    public int update(SysDepartment sysDepartment);

    //删除部门
    public int delete(Integer id);

}
