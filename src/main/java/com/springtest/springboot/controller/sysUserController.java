package com.springtest.springboot.controller;

import com.springtest.springboot.po.SysUser;
import com.springtest.springboot.service.SysUserService;
import com.springtest.springboot.util.EncryptionUtils;
import com.springtest.springboot.util.NUIResponseUtils;
import com.springtest.springboot.util.page.PageList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;
import java.util.List;

/**
 * 用户管理 2019.02.11
 */

@Controller
@RequestMapping(value = "/sysUser")
public class sysUserController {

    @Autowired
    private SysUserService sysUserService;

    //用户列表
    @RequestMapping(value = "list")
    public String list(@ModelAttribute(value = "sysUser") SysUser sysUser,
                       @RequestParam(value = "pageNum",defaultValue = "1")Integer pageNum,
                       @RequestParam(value = "pageSize",defaultValue = "10")Integer pageSize,
                       HttpServletRequest request){
        PageList<SysUser> pageList = sysUserService.findAll(sysUser,pageNum,pageSize);
        request.setAttribute("pageList",pageList);
        return "/sysUser/sysUserList";
    }
    //新增入口
    @RequestMapping(value = "load")
    public String load(Integer id,HttpServletRequest request){
        if (id != null){
            SysUser sysUser = sysUserService.findById(id);
            request.setAttribute("sysUser",sysUser);
        }
        return "/sysUser/sysUserLoad";
    }

    //保存用户
    @RequestMapping(value = "save")
    public String save(Integer nowId,Integer id,String accountNumber,String name,
                       String password,String repassword,
                       HttpServletRequest request){
        if (id==null){
            SysUser sysUser = new SysUser();
            sysUser.setName(name);
            sysUser.setAccountNumber(accountNumber);
            //新建用户默认密码都为123456
            sysUser.setPassword(EncryptionUtils.encryption("123456","Utf-8","MD5"));
            sysUser.setCount(0);
            sysUser.setCreateTime(new Date());
            sysUser.setUpdateTime(new Date());
            sysUser.setCreateUserId(nowId);
            sysUser.setUpdateUserId(nowId);
            int a = sysUserService.add(sysUser);
            if (a == 1){
                System.out.println("新增成功！ "+sysUser.getName());
            }else{
                System.out.println("新增失败！ "+sysUser.getName());
            }
        }else{
            SysUser sysUser = sysUserService.findById(id);
            sysUser.setName(name);
            sysUser.setAccountNumber(accountNumber);
            sysUser.setUpdateUserId(nowId);
            sysUser.setUpdateTime(new Date());
            sysUserService.update(sysUser);
        }
        request.setAttribute("message","操作成功");
        NUIResponseUtils.setDefaultValues(request);
        return "/common/nui.response";
    }

    //删除用户
    @RequestMapping(value = "/delete")
    public String delete(Integer id,HttpServletRequest request){
        if (id != null){
            int i = sysUserService.delete(id);
            if (i == 1){
                System.out.println("删除成功！"+id);
            }else{
                System.out.println("删除失败！"+id);
            }
        }
        request.setAttribute("message","操作成功");
        NUIResponseUtils.setDefaultValues(request);
        return "/common/nui.response";
    }


}
