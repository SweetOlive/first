package com.springtest.springboot.controller;

import com.springtest.springboot.po.SysDepartment;
import com.springtest.springboot.service.SysDepartmentService;
import com.springtest.springboot.util.NUIResponseUtils;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.RequestWrapper;
import java.io.IOException;
import java.util.Date;

/**
 * 部门控制器
 * Cai Ronggui
 * 2019.02.13
 */

@Controller
@RequestMapping(value = "/sysDepartment")
public class SysDepartmentController {

    @Autowired
    private SysDepartmentService sysDepartmentService;

    //部门树首页
    @RequestMapping(value = "/list")
    public String list(HttpServletRequest request){
        return "/sysDepartment/sysDepartmentList";
    }

    //获取全部部门接口（json格式数据）
    @RequestMapping(value = "/jsonList")
    public void jsonList(HttpServletRequest request, HttpServletResponse response) throws IOException {
        JSONArray permissionJsonArray = sysDepartmentService.findAllByTree( -1);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        response.getWriter().println(permissionJsonArray.toString());
    }

    //部门新增修改入口
    @RequestMapping(value = "/load")
    public  String load(Integer id,Integer parentId,HttpServletRequest request){
        System.out.println("id : " +id);
        System.out.println("parentId : " +parentId);
        if (id != null ) {
            SysDepartment sysDepartment = sysDepartmentService.findById(id);
            request.setAttribute("sysDepartment",sysDepartment);
            SysDepartment parentSysDepartment = sysDepartmentService.findById(sysDepartment.getParentId());
            request.setAttribute("parentSysDepartment",parentSysDepartment);
        }
        if (parentId != null){
            SysDepartment parentSysDepartment = sysDepartmentService.findById(parentId);
            request.setAttribute("parentSysDepartment",parentSysDepartment);
        }
        return "/sysDepartment/sysDepartmentLoad";
    }
    //部门新增修改保存
    @RequestMapping(value = "/save")
    public String save(Integer nowId,Integer id,Integer parentId,
                       String name,String introduce,
                       HttpServletRequest request){
        System.out.println("当前登录用户nowId : "+ nowId);
        System.out.println("部门id : "+ id);
        System.out.println("父部门parentId : "+parentId);
        //新增部门
        if (id==null && parentId !=null){
            SysDepartment sysDepartment = new SysDepartment();
            sysDepartment.setParentId(parentId);
            sysDepartment.setName(name);
            sysDepartment.setIntroduce(introduce);
            sysDepartment.setCreateUserId(nowId);
            sysDepartment.setUpdateUserId(nowId);
            sysDepartment.setUpadteTime(new Date());
            sysDepartment.setCreateTime(new Date());
            int a = sysDepartmentService.add(sysDepartment);
        }
        //修改部门信息
        if (id != null && parentId != null){
            SysDepartment sysDepartment = sysDepartmentService.findById(id);
            sysDepartment.setName(name);
            sysDepartment.setIntroduce(introduce);
            sysDepartment.setUpadteTime(new Date());
            sysDepartment.setUpdateUserId(nowId);
            int a = sysDepartmentService.update(sysDepartment);
        }
        request.setAttribute("message","操作成功");
        NUIResponseUtils.setDefaultValues(request);
        return "/common/nui.response";
    }

    //删除部门
    @RequestMapping(value = "delete")
    public String delete(Integer id,HttpServletRequest request){
        System.out.println("删除部门，id : " + id);
        if (id != null){
            int a = sysDepartmentService.delete(id);
        }
        request.setAttribute("message","操作成功");
        NUIResponseUtils.setDefaultValues(request);
        return "/common/nui.response";
    }


}