package com.springtest.springboot.controller;

import com.springtest.springboot.service.FileService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * 一些特殊访问控制层
 * CaiRonggui 2019.03.03 21:22
 */
@Controller
@RequestMapping(value = "/admin")
public class AdminController {

    @Autowired
    private FileService fileService;

    //显示图片用
    @RequestMapping("/imgView")
    public void image(HttpServletRequest request, HttpServletResponse response, String path) throws Exception {
        fileService.image(path, request, response);
    }

}
