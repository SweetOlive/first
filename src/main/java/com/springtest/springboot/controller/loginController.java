package com.springtest.springboot.controller;

import com.springtest.springboot.po.SysUser;
import com.springtest.springboot.service.SysUserService;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

/**
 * CaiRonggui 2019.2.10
 * 登录控制
 */
@Controller
@RequestMapping(value = "/login")
public class loginController {

    @Autowired
    private SysUserService sysUserService;

    //登录页面
    @RequestMapping(value = "login")
    public String login(HttpServletRequest request){
        return "/login";
    }

    //登录跳转，判断
    @RequestMapping(value = "check")
    public String check( String username,String password, HttpServletRequest request){
        System.out.println("登录!!!"+username+" "+password);
        SysUser sysUser = sysUserService.findByAccountNumber(username);
        //System.out.println(sysUser.getName());
        //判断账号是否存在
        if(sysUser != null){
            //判断密码是否正确
            if (sysUser.getPassword().equals(password)){
                System.out.println("账号存在，密码正确，登录成功！");
                return  "/index";
            }else{
                System.out.println("账号存在，密码错误，登录失败！");
                return  "/login";
            }
        }else{
            System.out.println("账号不存在，登录失败");
            return  "/login";
        }
    }
}
