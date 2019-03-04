package com.springtest.springboot.service;

import com.springtest.springboot.po.SysPermission;
import com.springtest.springboot.util.page.PageList;
import net.sf.json.JSONArray;

import javax.servlet.http.HttpSession;
import java.util.List;
import java.util.Set;

public interface SysPermissionService {

    public JSONArray findAllByTree(Integer parentId);

    public PageList<SysPermission> findPage(SysPermission sysPermission, Integer pageNum, Integer pageSize);

    public SysPermission findById(Integer id);

    public int add(SysPermission sysPermission);

    public  int update(SysPermission  sysPermission);

    public  int  delete(Integer id);

    public SysPermission findByNameParentId(String name,Integer parentId);

    public SysPermission findByCode(String code);

    public List<SysPermission> findByRoleId(Integer roleId);

    public Set<String> getCurrentUserPermissions(HttpSession session) throws Exception;
}
