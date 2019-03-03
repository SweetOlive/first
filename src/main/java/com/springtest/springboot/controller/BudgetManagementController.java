package com.springtest.springboot.controller;

import com.springtest.springboot.BaseException;
import com.springtest.springboot.po.BudgetManagement;
import com.springtest.springboot.service.BudgetManagementService;
import com.springtest.springboot.service.CodeGeneratorService;
import com.springtest.springboot.util.NUIResponseUtils;
import com.springtest.springboot.util.page.PageList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.util.Date;

/**
 * 预算控制器
 * CaiRonggui 2019.02.22
 */
@Controller
@RequestMapping(value = "/budgetManagement")
public class BudgetManagementController {

    @Autowired
    private BudgetManagementService budgetManagementService;

    @Autowired
    private CodeGeneratorService codeGeneratorService;

    @RequestMapping(value = "/list")
    public String list(@ModelAttribute(value = "budgetManagement") BudgetManagement budgetManagement,
                       @RequestParam(value = "pageNum",defaultValue = "1")Integer pageNum,
                       @RequestParam(value = "pageSize",defaultValue = "10")Integer pageSize,
                       HttpServletRequest request){
        PageList<BudgetManagement> pageList = budgetManagementService.findPage(budgetManagement,pageNum,pageSize);
        request.setAttribute("pageList",pageList);
        return "/budgetManagement/budgetManagementList";
    }

    @RequestMapping(value = "/load")
    public String load(Integer id,HttpServletRequest request){
        if (id != null){
            BudgetManagement budgetManagement = budgetManagementService.findById(id);
            request.setAttribute("budgetManagement",budgetManagement);
        }
        return "/budgetManagement/budgetManagementLoad";
    }

    @RequestMapping(value = "/save")
    public  String save(Integer nowId,Integer id,String name,Integer budgetCapital,
                        String introduce ,String remark,HttpServletRequest request){
        if(id == null){
            if (budgetManagementService.findByName(name)!=null){
                throw new BaseException("0008");
            }
            BudgetManagement budgetManagement = new BudgetManagement();
            budgetManagement.setName(name);
            budgetManagement.setIntroduce(introduce);
            budgetManagement.setBudgetCapital(budgetCapital);
            budgetManagement.setRemark(remark);
            budgetManagement.setCreateUserId(nowId);budgetManagement.setUpdateUserId(nowId);
            budgetManagement.setCreateTime(new Date());budgetManagement.setUpdateTime(new Date());
            budgetManagement.setStatus("S");
            budgetManagement.setCode(codeGeneratorService.gen());
            int cnt = budgetManagementService.add(budgetManagement);
            if (cnt == 1){ System.out.println("新增成功！ "+budgetManagement.getName()); }
            else{ System.out.println("新增失败！ "+budgetManagement.getName()); }
        }else {
            BudgetManagement budgetManagement = budgetManagementService.findById(id);
            if (budgetManagement.getName().equals(name)){
                budgetManagement.setName(name);
            }else {
                if (budgetManagementService.findByName(name)!=null){
                    throw new BaseException("0008");
                }else {
                    budgetManagement.setName(name);
                }
            }
            budgetManagement.setIntroduce(introduce);
            budgetManagement.setBudgetCapital(budgetCapital);
            budgetManagement.setRemark(remark);
            budgetManagement.setUpdateUserId(nowId);budgetManagement.setUpdateTime(new Date());
            int cnt = budgetManagementService.update(budgetManagement);
            if (cnt == 1){ System.out.println("修改成功！ "+budgetManagement.getName()); }
            else{ System.out.println("修改失败！ "+budgetManagement.getName()); }
        }
        request.setAttribute("message","操作成功");
        NUIResponseUtils.setDefaultValues(request);
        return "/common/nui.response";
    }

    @RequestMapping(value = "/delete")
    public  String delete(Integer id,HttpServletRequest request){
        int cnt = budgetManagementService.delete(id);
        if (cnt == 1){
            System.out.println("删除成功！ ");
        } else{
            System.out.println("删除失败！ ");
        }
        request.setAttribute("message","操作成功");
        NUIResponseUtils.setDefaultValues(request);
        return "/common/nui.response";
    }

}
