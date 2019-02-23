package com.springtest.springboot.controller;

import com.springtest.springboot.po.PurchaseInquiry;
import com.springtest.springboot.po.PurchaseOrder;
import com.springtest.springboot.po.SupplierCompany;
import com.springtest.springboot.service.CodeGeneratorService;
import com.springtest.springboot.service.PurchaseInquiryService;
import com.springtest.springboot.service.PurchaseOrderService;
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
 * 订单控制器
 * CaiRonggui 2019.02.23 23:56
 */
@Controller
@RequestMapping(value = "/purchaseOrder")
public class PurchaseOrderController {

    @Autowired
    private PurchaseOrderService purchaseOrderService;

    @Autowired
    private PurchaseInquiryService purchaseInquiryService;

    @Autowired
    private SupplierCompanyService supplierCompanyService;

    @Autowired
    private CodeGeneratorService codeGeneratorService;



    @RequestMapping(value = "/list")
    public String list(@ModelAttribute(value = "purchaseOrder") PurchaseOrder purchaseOrder,
                       @RequestParam(value = "pageNum",defaultValue = "1")Integer pageNum,
                       @RequestParam(value = "pageSize",defaultValue = "10")Integer pageSize,
                       HttpServletRequest request){
        PageList<PurchaseOrder> pageList = purchaseOrderService.findPage(purchaseOrder,pageNum,pageSize);
        request.setAttribute("pageList",pageList);
        return "/purchaseOrder/purchaseOrderList";
    }

    @RequestMapping(value = "/load")
    public String load(Integer id,HttpServletRequest request){
        //找到所有状态为通过的供应商
        List<SupplierCompany> supplierCompanyList = supplierCompanyService.findAllWithP();
        System.out.println("supplierCompanyList : " + supplierCompanyList.toString()+"  Size: "+supplierCompanyList.size());
        request.setAttribute("supplierCompanyList",supplierCompanyList);
        if (id != null){
            PurchaseOrder purchaseOrder = purchaseOrderService.findById(id);
            request.setAttribute("purchaseOrder",purchaseOrder);
            PurchaseInquiry purchaseInquiry = purchaseInquiryService.findById(purchaseOrder.getInquiryId());
            request.setAttribute("purchaseInquiry",purchaseInquiry);
        }
        return "/purchaseOrder/purchaseOrderLoad";
    }

    @RequestMapping(value = "/save")
    public  String save(Integer nowId,Integer id,String code,Integer companyId,
                        String name,String transport,
                        String introduce ,String remark,HttpServletRequest request){
        PurchaseInquiry purchaseInquiry = purchaseInquiryService.findByCode(code);
        if(id == null){
            PurchaseOrder purchaseOrder = new PurchaseOrder();
            purchaseOrder.setCompanyId(companyId);purchaseOrder.setTransport(transport);
            if (purchaseInquiry!=null)purchaseOrder.setInquiryId(purchaseInquiry.getId());
            purchaseOrder.setName(name);purchaseOrder.setIntroduce(introduce);
            purchaseOrder.setRemark(remark);
            purchaseOrder.setCreateUserId(nowId);purchaseOrder.setUpdateUserId(nowId);
            purchaseOrder.setCreateTime(new Date());purchaseOrder.setUpdateTime(new Date());
            purchaseOrder.setStatus("A");
            purchaseOrder.setCode(codeGeneratorService.gen());
            int cnt = purchaseOrderService.add(purchaseOrder);
            if (cnt == 1){ System.out.println("新增成功！ "+purchaseOrder.getName()); }
            else{ System.out.println("新增失败！ "+purchaseOrder.getName()); }
        }else {
            PurchaseOrder purchaseOrder = purchaseOrderService.findById(id);
            purchaseOrder.setCompanyId(companyId);purchaseOrder.setTransport(transport);
            if (purchaseInquiry!=null)purchaseOrder.setInquiryId(purchaseInquiry.getId());
            purchaseOrder.setName(name);
            purchaseOrder.setIntroduce(introduce);
            purchaseOrder.setRemark(remark);
            purchaseOrder.setUpdateUserId(nowId);purchaseOrder.setUpdateTime(new Date());
            int cnt = purchaseOrderService.update(purchaseOrder);
            if (cnt == 1){ System.out.println("修改成功！ "+purchaseOrder.getName()); }
            else{ System.out.println("修改失败！ "+purchaseOrder.getName()); }
        }
        request.setAttribute("message","操作成功");
        NUIResponseUtils.setDefaultValues(request);
        return "/common/nui.response";
    }

    @RequestMapping(value = "/delete")
    public  String delete(Integer id,HttpServletRequest request){
        int cnt = purchaseOrderService.delete(id);
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
