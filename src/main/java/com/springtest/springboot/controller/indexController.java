package com.springtest.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @Author Lings 603656949@qq.com
 * @Date 2019/9/3 9:45
 * @Version 1.0
 * @Desc 设置首页
 **/
@Controller
public class indexController {

    @RequestMapping("/")
    public String index(){
        return "/login";
    }
}
