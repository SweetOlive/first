package com.springtest.springboot.controller;

import com.springtest.springboot.BaseException;
import com.springtest.springboot.po.SysRole;
import com.springtest.springboot.po.SysUser;
import com.springtest.springboot.po.SysUserRole;
import com.springtest.springboot.service.SysRoleService;
import com.springtest.springboot.service.SysUserRoleService;
import com.springtest.springboot.service.SysUserService;
import com.springtest.springboot.util.NUIResponseUtils;
import com.springtest.springboot.util.page.PageList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 角色控制器
 * Cai Ronggui
 * 2019.02.16
 */

@Controller
@RequestMapping(value = "/sysRole")
public class SysRoleController {

    @Autowired
    private SysRoleService sysRoleService;

    @Autowired
    private SysUserRoleService sysUserRoleService;

    @Autowired
    private SysUserService sysUserService;

    //角色列表
    @RequestMapping(value = "list")
    public String list(@ModelAttribute(value = "sysRole")SysRole sysRole,
                       @RequestParam(value = "pageNum",defaultValue = "1")Integer pageNum,
                       @RequestParam(value = "pageSize",defaultValue = "10")Integer pageSize,
                       HttpServletRequest request){
        PageList<SysRole> pageList = sysRoleService.findAllPage(sysRole,pageNum,pageSize);
        request.setAttribute("pageList",pageList);
        return "/sysRole/sysRoleList";
    }

    //用户新增修改入口
    @RequestMapping(value = "/load")
    public String load(Integer id,HttpServletRequest request){
        if (id!=null){
            SysRole sysRole = sysRoleService.findById(id);
            request.setAttribute("sysRole",sysRole);
        }
        return "/sysRole/sysRoleLoad";
    }

    //保存/修改用户信息
    @RequestMapping(value = "/save")
    public  String save(Integer nowId,Integer id,String name, String introduce,HttpServletRequest request){
        if (id==null){
            if (sysRoleService.findByName(name)!=null){
                throw new BaseException("0004");
            }
            SysRole sysRole = new SysRole();
            sysRole.setName(name);
            sysRole.setIntroduce(introduce);
            sysRole.setCreateTime(new Date());
            sysRole.setUpdateTime(new Date());
            sysRole.setCreateUserId(nowId);
            sysRole.setUpdateUserId(nowId);
            int cnt = sysRoleService.add(sysRole);
            if (cnt == 1){ System.out.println("新增成功！ "+sysRole.getName()); }
            else{ System.out.println("新增失败！ "+sysRole.getName()); }
        }else {
            SysRole sysRole = sysRoleService.findById(id);
            if (sysRole.getName().equals(name)){
                sysRole.setName(name);
            }else{
                if (sysRoleService.findByName(name)!=null){
                    throw new BaseException("0004");
                }else{
                    sysRole.setName(name);
                }
            }
            sysRole.setIntroduce(introduce);
            sysRole.setUpdateUserId(nowId);
            sysRole.setUpdateTime(new Date());
            int cnt = sysRoleService.update(sysRole);
            if (cnt == 1){ System.out.println("修改成功！ "+sysRole.getName()); }
            else{ System.out.println("修改失败！ "+sysRole.getName()); }
        }
        NUIResponseUtils.setDefaultValues(request);
        return "/common/nui.response";
    }

    //删除角色
    @RequestMapping(value = "/delete")
    public  String delete(Integer id,HttpServletRequest request){
        int cnt =  sysRoleService.delete(id);
        if (cnt == 1){ System.out.println("删除成功！ "); }
        else{ System.out.println("删除失败！ "); }
        NUIResponseUtils.setDefaultValues(request);
        return "/common/nui.response";
    }

    //分配角色入口
    @RequestMapping(value = "/loadSysRole")
    public  String loadSysRole(Integer id,HttpServletRequest request,
                               @ModelAttribute(value = "sysUser") SysUser sysUser,
                               @RequestParam(value = "rightPageNum",defaultValue = "1")Integer rightPageNum,
                               @RequestParam(value = "rightPageSize",defaultValue = "10")Integer rightPageSize){
        SysRole sysRole = sysRoleService.findById(id);
        request.setAttribute("roleId",id);
        request.setAttribute("sysRole",sysRole);
        List<SysUserRole> listLeft = sysUserRoleService.findByRoleId(id);
        request.setAttribute("listLeft",listLeft);

        PageList<SysUser> pageList = sysUserService.findAll(sysUser, rightPageNum, rightPageSize);
        request.setAttribute("pageList", pageList);
        Map<Integer, Boolean> roleUserMap = new HashMap<Integer, Boolean>();
        for (SysUserRole roleUser : listLeft) {
            System.out.println("");
            roleUserMap.put(roleUser.getUserId(), true);
        }
        request.setAttribute("roleUserMap", roleUserMap);
        return "/sysRole/userRole";
    }
    //添加用户角色关联
    @RequestMapping(value = "/addUserRole")
    public String addUserRole(Integer nowId,Integer roleId, @RequestParam(value = "userIds") String[] userIds,
                              HttpServletRequest request){
        System.out.println(userIds);
        if (userIds != null && userIds.length > 0) {
            SysRole sysRole = sysRoleService.findById(roleId);
            if (sysRole != null) {
                Integer[] userIdsL = new Integer[userIds.length];
                for (int i = 0; i < userIds.length; i++) {
                    userIdsL[i] = Integer.parseInt(userIds[i]);
                }
                sysUserRoleService.addUserFromRole(nowId,roleId, userIdsL);
            }
        }
        NUIResponseUtils.setDefaultValues(request);
        return "/common/nui.response";
    }

    //删除用户角色关联
    @RequestMapping(value = "deleteUserRole")
    public String deleteUserRole(Integer roleId, @RequestParam(value = "userIds") String[] userIds,
                                 HttpServletRequest request){
        System.out.println("删除用户关联！");
        System.out.println("roleId: " + roleId);
        System.out.println("userIds: " +userIds.length);
        if (userIds != null && userIds.length > 0) {
            SysRole sysRole = sysRoleService.findById(roleId);
            if (sysRole != null) {
                Integer[] userIdsL = new Integer[userIds.length];
                for (int i = 0; i < userIds.length; i++) {
                    userIdsL[i] = Integer.parseInt(userIds[i]);
                }
                sysUserRoleService.removeUserFromRole(roleId, userIdsL);
            }
        }
        NUIResponseUtils.setDefaultValues(request);
        return "/common/nui.response";
    }
}
