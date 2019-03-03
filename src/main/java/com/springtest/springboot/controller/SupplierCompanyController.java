package com.springtest.springboot.controller;

import com.springtest.springboot.BaseException;
import com.springtest.springboot.po.SupplierCompany;
import com.springtest.springboot.service.CodeGeneratorService;
import com.springtest.springboot.service.SupplierCompanyService;
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
 * 供应商控制器
 * Cai Ronggui 2019.02.22
 */
@Controller
@RequestMapping(value = "/supplierCompany")
public class SupplierCompanyController {

    @Autowired
    private SupplierCompanyService supplierCompanyService;

    @Autowired
    private CodeGeneratorService codeGeneratorService;

    //供应商准入列表
    @RequestMapping(value = "/list")
    public String list(@ModelAttribute(value = "supplierCompany") SupplierCompany supplierCompany,
                       @RequestParam(value = "pageNum",defaultValue = "1")Integer pageNum,
                       @RequestParam(value = "pageSize",defaultValue = "10")Integer pageSize,
                       HttpServletRequest request){
        PageList<SupplierCompany> pageList = supplierCompanyService.findPageWithSA(supplierCompany,pageNum,pageSize);
        request.setAttribute("pageList",pageList);
        return "/supplierCompany/supplierCompanyList";
    }

    //供应商列表
    @RequestMapping(value = "/passAndFailList")
    public String passAndFailList(@ModelAttribute(value = "supplierCompany") SupplierCompany supplierCompany,
                       @RequestParam(value = "pageNum",defaultValue = "1")Integer pageNum,
                       @RequestParam(value = "pageSize",defaultValue = "10")Integer pageSize,
                       HttpServletRequest request){
        PageList<SupplierCompany> pageList = supplierCompanyService.findPageWithOutSA(supplierCompany,pageNum,pageSize);
        request.setAttribute("pageList",pageList);
        return "/supplierCompany/passAndFailList";
    }

    @RequestMapping(value = "/load")
    public String load(Integer id,HttpServletRequest request){
        if (id != null){
            SupplierCompany supplierCompany = supplierCompanyService.findById(id);
            request.setAttribute("supplierCompany",supplierCompany);
        }
        return "/supplierCompany/supplierCompanyLoad";
    }

    @RequestMapping(value = "/save")
    public  String save(Integer nowId,Integer id,String name, String mail,String tel,String address,
                        String creditRating ,String remark,HttpServletRequest request){
        if(id == null){
            if (supplierCompanyService.findByName(name)!=null){
                throw new BaseException("0007");
            }
            SupplierCompany supplierCompany = new SupplierCompany();
            supplierCompany.setName(name);supplierCompany.setMail(mail);
            supplierCompany.setTel(tel);supplierCompany.setAddress(address);
            supplierCompany.setCreditRating(creditRating);supplierCompany.setRemark(remark);
            supplierCompany.setCreateUserId(nowId);supplierCompany.setUpdateUserId(nowId);
            supplierCompany.setCreateTime(new Date());supplierCompany.setUpdateTime(new Date());
            supplierCompany.setStatus("A");
            supplierCompany.setCode(codeGeneratorService.gen());
            int cnt = supplierCompanyService.add(supplierCompany);
            if (cnt == 1){ System.out.println("新增成功！ "+supplierCompany.getName()); }
            else{ System.out.println("新增失败！ "+supplierCompany.getName()); }
        }else {
            SupplierCompany supplierCompany = supplierCompanyService.findById(id);
            if(supplierCompany.getName().equals(name)){
                supplierCompany.setName(name);
            }else{
                if (supplierCompanyService.findByName(name)!=null){
                    throw new BaseException("0007");
                }else {
                    supplierCompany.setName(name);
                }
            }
            supplierCompany.setMail(mail);
            supplierCompany.setTel(tel);supplierCompany.setAddress(address);
            supplierCompany.setCreditRating(creditRating);supplierCompany.setRemark(remark);
            supplierCompany.setUpdateUserId(nowId);supplierCompany.setUpdateTime(new Date());
            int cnt = supplierCompanyService.update(supplierCompany);
            if (cnt == 1){ System.out.println("修改成功！ "+supplierCompany.getName()); }
            else{ System.out.println("修改失败！ "+supplierCompany.getName()); }
        }
        request.setAttribute("message","操作成功");
        NUIResponseUtils.setDefaultValues(request);
        return "/common/nui.response";
    }

    @RequestMapping(value = "/delete")
    public  String delete(Integer id,HttpServletRequest request){
        int cnt = supplierCompanyService.delete(id);
        if (cnt == 1){
            System.out.println("删除成功！ ");
        } else{
            System.out.println("删除失败！ ");
        }
        request.setAttribute("message","操作成功");
        NUIResponseUtils.setDefaultValues(request);
        return "/common/nui.response";
    }

    @RequestMapping(value = "/loadSupplierCompany")
    public  String loadSupplierCompany(Integer id,String s,HttpServletRequest request)throws Exception{
        if (id != null){
            SupplierCompany supplierCompany = supplierCompanyService.findById(id);
            request.setAttribute("supplierCompany",supplierCompany);
        }
        System.out.println("s : " + s);
        //通过详情
        if (s.equals("1")){
            return "/supplierCompany/detailPass";
        }
        //作废详情
        else if (s.equals("2")){
            return "/supplierCompany/detailFail";
        }else{
            return "";
        }
    }

    @RequestMapping(value = "/saveDetail")
    public String saveDetail(Integer id,Integer nowId,String status ,HttpServletRequest request){
        if (status.equals("P")){
            SupplierCompany supplierCompany = supplierCompanyService.findById(id);
            supplierCompany.setStatus(status);
            supplierCompany.setUpdateUserId(nowId);supplierCompany.setUpdateTime(new Date());
            int cnt = supplierCompanyService.update(supplierCompany);
            if (cnt == 1){
                System.out.println("审核通过成功！ "+supplierCompany.getName());
            } else{
                System.out.println("审核通过失败！ "+supplierCompany.getName());
            }
        }else if(status.equals("F")){
            SupplierCompany supplierCompany = supplierCompanyService.findById(id);
            supplierCompany.setStatus(status);
            supplierCompany.setUpdateUserId(nowId);supplierCompany.setUpdateTime(new Date());
            int cnt = supplierCompanyService.update(supplierCompany);
            if (cnt == 1){
                System.out.println("作废成功！ "+supplierCompany.getName());
            } else{
                System.out.println("作废失败！ "+supplierCompany.getName());
            }
        }

        request.setAttribute("message","操作成功");
        NUIResponseUtils.setDefaultValues(request);
        return "/common/nui.response";
    }


}
