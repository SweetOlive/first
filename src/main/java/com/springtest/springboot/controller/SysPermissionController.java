package com.springtest.springboot.controller;

import com.springtest.springboot.BaseException;
import com.springtest.springboot.po.SysPermission;
import com.springtest.springboot.po.SysRole;
import com.springtest.springboot.po.SysRolePermission;
import com.springtest.springboot.service.CodeGeneratorService;
import com.springtest.springboot.service.SysPermissionService;
import com.springtest.springboot.service.SysRolePermissionService;
import com.springtest.springboot.service.SysRoleService;
import com.springtest.springboot.util.NUIResponseUtils;
import net.sf.json.JSONArray;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.Date;
import java.util.List;

/**
 * 权限管理
 * CaiRonggui 2019.03.04 21:28
 */
@Controller
@RequestMapping(value = "/sysPermission")
public class SysPermissionController {

    @Autowired
    private SysPermissionService sysPermissionService;

    @Autowired
    private CodeGeneratorService codeGeneratorService;

    @Autowired
    private SysRoleService sysRoleService;

    @Autowired
    private SysRolePermissionService sysRolePermissionService;

    //入口
    @RequestMapping(value = "/list")
    public String list(HttpServletRequest request){
        return "/sysPermission/sysPermissionList";
    }

    @RequestMapping(value = "/jsonList")
    public void listByJson(HttpServletRequest request, HttpServletResponse response) throws Exception {
        JSONArray permissionJsonArray = sysPermissionService.findAllByTree(-1);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        response.getWriter().println(permissionJsonArray.toString());
    }

    @RequestMapping(value = "/load")
    public  String load(Integer id,Integer parentId,HttpServletRequest request){
        System.out.println("id : " +id);
        System.out.println("parentId : " +parentId);
        if (id != null ) {
            SysPermission sysPermission = sysPermissionService.findById(id);
            request.setAttribute("sysPermission",sysPermission);
            SysPermission parentSysPermission = sysPermissionService.findById(sysPermission.getParentId());
            request.setAttribute("parentSysPermission",parentSysPermission);
        }
        if (parentId != null){
            SysPermission parentSysPermission = sysPermissionService.findById(parentId);
            request.setAttribute("parentSysPermission",parentSysPermission);
        }
        return "/sysPermission/sysPermissionLoad";
    }

    @RequestMapping(value = "/save")
    public String save(Integer nowId,Integer id,Integer parentId,
                       String name,String remark,String code,
                       HttpServletRequest request){
        System.out.println("当前登录用户nowId : "+ nowId);
        System.out.println("权限id : "+ id);
        System.out.println("父权限parentId : "+parentId);
        //新增权限
        if (id==null && parentId !=null){
            if (sysPermissionService.findByNameParentId(name,parentId)!=null){
                throw new BaseException("0018");
            }else if (!code.startsWith("P_")){
                throw new BaseException("0019");
            }else if(sysPermissionService.findByCode(code)!=null){
                throw new BaseException("0020");
            }
            SysPermission sysPermission = new SysPermission();
            sysPermission.setParentId(parentId);sysPermission.setCode(code);
            sysPermission.setName(name);
            sysPermission.setRemark(remark);
            sysPermission.setCreateUserId(nowId);
            sysPermission.setUpdateUserId(nowId);
            sysPermission.setUpdateTime(new Date());
            sysPermission.setCreateTime(new Date());
            int a = sysPermissionService.add(sysPermission);
        }
        //修改部门信息
        if (id != null && parentId != null){
            SysPermission sysPermission = sysPermissionService.findById(id);
            if (sysPermission.getName().equals(name)){
                sysPermission.setName(name);
            }else{
                if (sysPermissionService.findByNameParentId(name,parentId)!=null){
                    throw new BaseException("0018");
                }else{
                    sysPermission.setName(name);
                }
            }
            //判断修改的权限code是否以P_开头
            if (!code.startsWith("P_")){
                throw new BaseException("0019");
            }
            //判断修改的权限code是否已存在
            if (sysPermission.getCode().equals(code)){
                sysPermission.setCode(code);
            }else{
                if(sysPermissionService.findByCode(code)!=null){
                    throw new BaseException("0020");
                }else {
                    sysPermission.setCode(code);
                }
            }
            sysPermission.setRemark(remark);
            sysPermission.setUpdateTime(new Date());
            sysPermission.setUpdateUserId(nowId);
            int a = sysPermissionService.update(sysPermission);
        }
        NUIResponseUtils.setDefaultValues(request);
        return "/common/nui.response";
    }

    @RequestMapping(value = "delete")
    public String delete(Integer id,HttpServletRequest request){
        System.out.println("删除权限，id : " + id);
        if (id != null){
            int a = sysPermissionService.delete(id);
        }
        NUIResponseUtils.setDefaultValues(request);
        return "/common/nui.response";
    }

    //角色赋予权限入口
    @RequestMapping(value = "/loadRolePermission")
    public String loadRolePermission(Integer id, HttpServletRequest request) throws Exception {
        SysRole sysRole = sysRoleService.findById(id);
        if (sysRole != null) {
            List<SysPermission> sysPermissionList = sysPermissionService.findByRoleId(id);
            request.setAttribute("sysRole", sysRole);
            request.setAttribute("sysPermissionList", sysPermissionList);
        }
        return "/sysRole/rolePermission";
    }

    //角色赋予权限保存
    @RequestMapping(value = "/editRolePermission")
    public String editRolePermission(Integer nowId,String permissionIds, Integer roleId, HttpServletRequest request) throws Exception {
        System.out.println("permissionIds :"+permissionIds);
        SysRole sysRole = sysRoleService.findById(roleId);
        if (sysRole != null) {
            //1、删除之前的权限
            List<SysPermission> sysPermissionList = sysPermissionService.findByRoleId(roleId);
            if (sysPermissionList.size()>0){
                for (SysPermission sysPermission : sysPermissionList){
                    System.out.println("删除"+sysPermissionList.size()+"个权限："+"roleId-"+roleId+",permissionId-"+sysPermission.getId());
                    sysRolePermissionService.deleteByRoleIdAndPermissionId(roleId,sysPermission.getId());
                }
            }
            //2、重新导入权限
            if (StringUtils.isNotEmpty(permissionIds)) {
                String[] arr = permissionIds.split(",");
                for (int i = 0; i < arr.length; i++) {
                    SysRolePermission sysRolePermission = new SysRolePermission();
                    sysRolePermission.setPermissionId(Integer.parseInt(arr[i]));
                    sysRolePermission.setRoleId(roleId);
                    sysRolePermission.setCreateTime(new Date());
                    sysRolePermission.setCreateUserId(nowId);
                    sysRolePermissionService.add(sysRolePermission);
                }
            }
        } else {
            throw new BaseException("0021");
        }
        NUIResponseUtils.setDefaultValues(request);
        return "/common/nui.response";
    }
}
