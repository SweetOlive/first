package com.springtest.springboot.controller;

import com.springtest.springboot.po.SysUser;
import com.springtest.springboot.service.SysUserService;
import com.springtest.springboot.util.page.PageList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
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
    public String load(){
        return "/sysUser/sysUserLoad";
    }

    //保存用户
    @RequestMapping(value = "save")
    public String save(Integer id,String accountNumber,String name,String password,String repassword){
        SysUser sysUser = new SysUser();
        sysUser.setName(name);
        sysUser.setAccountNumber(accountNumber);
        sysUser.setPassword(password);
        int a = sysUserService.add(sysUser);
        System.out.println("a:"+a+",id"+sysUser.getId());
        return "";
    }


}
