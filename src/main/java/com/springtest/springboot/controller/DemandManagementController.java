package com.springtest.springboot.controller;

import com.springtest.springboot.BaseException;
import com.springtest.springboot.po.DemandManagement;
import com.springtest.springboot.service.CodeGeneratorService;
import com.springtest.springboot.service.DemandManagementService;
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
 * 需求控制器
 * CaiRonggui 2019.02.22
 */
@Controller
@RequestMapping(value = "/demandManagement")
public class DemandManagementController {

    @Autowired
    private DemandManagementService demandManagementService;

    @Autowired
    private CodeGeneratorService codeGeneratorService;

    @RequestMapping(value = "/list")
    public String list(@ModelAttribute(value = "demandManagement") DemandManagement demandManagement,
                       @RequestParam(value = "pageNum",defaultValue = "1")Integer pageNum,
                       @RequestParam(value = "pageSize",defaultValue = "10")Integer pageSize,
                       HttpServletRequest request){
        PageList<DemandManagement> pageList = demandManagementService.findPage(demandManagement,pageNum,pageSize);
        request.setAttribute("pageList",pageList);
        return "/demandManagement/demandManagementList";
    }

    @RequestMapping(value = "/load")
    public String load(Integer id,HttpServletRequest request){
        if (id != null){
            DemandManagement demandManagement = demandManagementService.findById(id);
            request.setAttribute("demandManagement",demandManagement);
        }
        return "/demandManagement/demandManagementLoad";
    }

    @RequestMapping(value = "/save")
    public  String save(Integer nowId,Integer id,Integer budgetId,Integer departmentId,
                        String name,Integer usedCapital,
                        String introduce ,String remark,HttpServletRequest request){
        if(id == null){
            if (demandManagementService.findByName(name)!=null){
                throw new BaseException("0009");
            }
            DemandManagement demandManagement = new DemandManagement();
            demandManagement.setBudgetId(budgetId);
            demandManagement.setDepartmentId(departmentId);
            demandManagement.setName(name);demandManagement.setIntroduce(introduce);
            demandManagement.setUsedCapital(usedCapital);
            demandManagement.setRemark(remark);
            demandManagement.setCreateUserId(nowId);demandManagement.setUpdateUserId(nowId);
            demandManagement.setCreateTime(new Date());demandManagement.setUpdateTime(new Date());
            demandManagement.setStatus("S");
            demandManagement.setCode(codeGeneratorService.gen());
            int cnt = demandManagementService.add(demandManagement);
            if (cnt == 1){ System.out.println("新增成功！ "+demandManagement.getName()); }
            else{ System.out.println("新增失败！ "+demandManagement.getName()); }
        }else {
            DemandManagement demandManagement = demandManagementService.findById(id);
            if (demandManagement.getName().equals(name)){
                demandManagement.setName(name);
            }else{
                if (demandManagementService.findByName(name)!=null){
                    throw new BaseException("0009");
                }else {
                    demandManagement.setName(name);
                }
            }
            demandManagement.setBudgetId(budgetId);
            demandManagement.setDepartmentId(departmentId);
            demandManagement.setUsedCapital(usedCapital);
            demandManagement.setIntroduce(introduce);
            demandManagement.setRemark(remark);
            demandManagement.setUpdateUserId(nowId);demandManagement.setUpdateTime(new Date());
            int cnt = demandManagementService.update(demandManagement);
            if (cnt == 1){ System.out.println("修改成功！ "+demandManagement.getName()); }
            else{ System.out.println("修改失败！ "+demandManagement.getName()); }
        }
        request.setAttribute("message","操作成功");
        NUIResponseUtils.setDefaultValues(request);
        return "/common/nui.response";
    }

    @RequestMapping(value = "/delete")
    public  String delete(Integer id,HttpServletRequest request){
        int cnt = demandManagementService.delete(id);
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
