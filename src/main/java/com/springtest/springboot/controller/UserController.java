package com.springtest.springboot.controller;

import com.springtest.springboot.po.UserDomain;
import com.springtest.springboot.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpServletRequest;

import java.util.List;

/**
 * 测试1233334222
 */
@Controller
@RequestMapping(value = "/user")
public class UserController {

    @Autowired
    private UserService userService;

    @ResponseBody
    @PostMapping("/add")
    public int addUser(UserDomain user){
        return userService.addUser(user);
    }

    @ResponseBody
    @GetMapping("/all")
    public Object findAllUser(@RequestParam(name = "pageNum", required = false, defaultValue = "1") int pageNum, @RequestParam(name = "pageSize", required = false, defaultValue = "10") int pageSize){
        return userService.findAllUser(pageNum,pageSize);
    }

    @RequestMapping(value = "/findAll")
    @ResponseBody
    public List<UserDomain> findAll(){
        return  userService.findAll();
    }

    @RequestMapping(value = "index")
    public String index(HttpServletRequest request){
        List<UserDomain> userDomainList = userService.findAll();
        request.setAttribute("userDomainList",userDomainList);
        return "/index";
    }

}

