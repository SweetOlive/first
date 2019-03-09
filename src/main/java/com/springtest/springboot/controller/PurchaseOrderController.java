package com.springtest.springboot.controller;

import com.springtest.springboot.BaseException;
import com.springtest.springboot.po.*;
import com.springtest.springboot.service.*;
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
    private  PriceGoodsContactService priceGoodsContactService;

    @Autowired
    private PurchaseReceivingService purchaseReceivingService;

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
    public  String save(Integer nowId,Integer id,String code,
                        String name,String transport,
                        String introduce ,String remark,HttpServletRequest request){
        PurchaseInquiry purchaseInquiry = purchaseInquiryService.findByCode(code);
        if(id == null){
//            if (purchaseOrderService.findByName(name)!=null){
//                throw new BaseException("0010");
//            }
            PurchaseOrder purchaseOrder = new PurchaseOrder();
            if (purchaseInquiry!=null){
                purchaseOrder.setInquiryId(purchaseInquiry.getId());
                purchaseInquiry.setStatus("Y");
                purchaseOrder.setCompanyId(purchaseInquiry.getCompanyId());
                purchaseInquiryService.update(purchaseInquiry);
            }else{
                throw new BaseException("0011");
            }
            purchaseOrder.setTransport(transport);
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
//            if (purchaseOrder.getName().equals(name)){
//                purchaseOrder.setName(name);
//            }else{
//                if (purchaseOrderService.findByName(name)!=null){
//                    throw new BaseException("0010");
//                }else {
//                    purchaseOrder.setName(name);
//                }
//            }
            purchaseOrder.setName(name);
            if (purchaseInquiry!=null){
                purchaseOrder.setInquiryId(purchaseInquiry.getId());
                purchaseOrder.setCompanyId(purchaseInquiry.getCompanyId());
            }else{
                throw new BaseException("0011");
            }
            purchaseOrder.setTransport(transport);
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

    @RequestMapping(value = "/loadPurchaseOrder")
    public  String loadPurchaseOrder(Integer id,HttpServletRequest request){
        if (id!=null){
            PurchaseOrder purchaseOrder = purchaseOrderService.findById(id);
            request.setAttribute("purchaseOrder",purchaseOrder);
            SupplierCompany supplierCompany = supplierCompanyService.findById(purchaseOrder.getCompanyId());
            request.setAttribute("supplierCompany",supplierCompany);
            PurchaseInquiry purchaseInquiry = purchaseInquiryService.findById(purchaseOrder.getInquiryId());
            request.setAttribute("purchaseInquiry",purchaseInquiry);
            PriceGoodsContact priceGoodsContact = priceGoodsContactService.findById(purchaseInquiry.getGoodsId());
            request.setAttribute("priceGoodsContact",priceGoodsContact);
        }
        return "/purchaseOrder/orderDetail";
    }

    @RequestMapping(value = "/saveDetail")
    public String saveDetail(Integer id,Integer nowId,String operate,HttpServletRequest request){
        System.out.println("operate : "+operate);
        PurchaseOrder purchaseOrder = purchaseOrderService.findById(id);
        if (operate.equals("P")){
            purchaseOrder.setStatus(operate);
            purchaseOrderService.update(purchaseOrder);
        }else if (operate.equals("F")){
            purchaseOrder.setStatus(operate);
            purchaseOrderService.update(purchaseOrder);
            PurchaseInquiry purchaseInquiry = purchaseInquiryService.findById(purchaseOrder.getInquiryId());
            purchaseInquiry.setStatus("N");
            purchaseInquiryService.update(purchaseInquiry);
        }else if(operate.equals("S")){
            purchaseOrder.setStatus(operate);
            purchaseOrder.setArrivetime(new Date());
            purchaseOrderService.update(purchaseOrder);
            //到货完成生成一条收料信息
            PurchaseReceiving purchaseReceiving = new PurchaseReceiving();
            purchaseReceiving.setOrderId(purchaseOrder.getId());
            purchaseReceiving.setCreateUserId(nowId);purchaseReceiving.setUpdateUserId(nowId);
            purchaseReceiving.setCreateTime(new Date());purchaseReceiving.setUpdateTime(new Date());
            purchaseReceiving.setStatus("A");
            purchaseReceiving.setCode(codeGeneratorService.gen());
            int cnt = purchaseReceivingService.add(purchaseReceiving);
            if (cnt == 1){ System.out.println("新增成功！ "+purchaseReceiving.getCode()); }
            else{ System.out.println("新增失败！ "+purchaseReceiving.getCode()); }
        }
        request.setAttribute("message","操作成功");
        NUIResponseUtils.setDefaultValues(request);
        return "/common/nui.response";
    }
}
