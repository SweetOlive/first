package com.springtest.springboot.controller;

import com.springtest.springboot.po.SysUser;
import com.springtest.springboot.service.SysUserService;
import com.springtest.springboot.util.EncryptionUtils;
import com.springtest.springboot.util.NUIResponseUtils;
import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;

/**
 * CaiRonggui 2019.2.10
 * 登录控制 退出控制
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
    public String check(String username, String password, Model model, HttpServletRequest request){
        System.out.println("登录： "+username+" "+password);
        SysUser sysUser = sysUserService.findByAccountNumber(username);
        //System.out.println(sysUser.getName());
        //判断账号是否存在
        if(sysUser != null){
            //判断密码是否正确
            String s = EncryptionUtils.encryption(password,"Utf-8","MD5");
            System.out.println("输入密码："+s);
            System.out.println("正确密码："+sysUser.getPassword());
            if (sysUser.getPassword().equals(s)){
                System.out.println("账号存在，密码正确，登录成功！");
                //保存当前登录用户信息实体
                request.getSession(true).setAttribute("nowUser",sysUser);
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

    //退出登录
    @RequestMapping(value = "/logout")
    public String logout( HttpServletRequest request){
        //清除session缓存的用户信息
        request.getSession().removeAttribute("nowUser");
        return "/login";
    }

    //修改密码入口
    @RequestMapping(value = "/changePasswordLoad")
    public String changePasswordLoad( HttpServletRequest request){
        return "sysUser/changePassword";
    }

    //修改密码
    @RequestMapping(value = "/changePassword")
    public String changePasswoed(Integer id , String oldPassword, String password, String repassword,
                                 HttpServletRequest request){
        if (id!=null){
            SysUser sysUser = sysUserService.findById(id);
            String s = EncryptionUtils.encryption(oldPassword,"Utf-8","MD5");
            if (s.equals(sysUser.getPassword())){
                String n = EncryptionUtils.encryption(password,"Utf-8","MD5");
                sysUser.setPassword(n);
                sysUserService.update(sysUser);
                request.setAttribute("message","操作成功");
            }else{
                request.setAttribute("message","操作失败");
            }
        }
        NUIResponseUtils.setDefaultValues(request);
        return "/common/nui.response";
    }
}
