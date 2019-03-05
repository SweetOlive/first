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
 * 收料控制器
 * CaiRonggui 2019.02.24 20:33
 */
@Controller
@RequestMapping(value = "/purchaseReceiving")
public class PurchaseReceivingController {

    @Autowired
    private PurchaseReceivingService purchaseReceivingService;

    @Autowired
    private PurchaseOrderService purchaseOrderService;

    @Autowired
    private PurchaseInquiryService purchaseInquiryService;

    @Autowired
    private SupplierCompanyService supplierCompanyService;

    @Autowired
    private  PriceGoodsContactService priceGoodsContactService;

    @Autowired
    private CodeGeneratorService codeGeneratorService;



    @RequestMapping(value = "/list")
    public String list(@ModelAttribute(value = "purchaseReceiving") PurchaseReceiving purchaseReceiving,
                       @RequestParam(value = "pageNum",defaultValue = "1")Integer pageNum,
                       @RequestParam(value = "pageSize",defaultValue = "10")Integer pageSize,
                       String orderName,
                       HttpServletRequest request){
        PageList<PurchaseReceiving> pageList = purchaseReceivingService.findPage(purchaseReceiving,orderName,pageNum,pageSize);
        request.setAttribute("pageList",pageList);
        request.setAttribute("orderName",orderName);
        return "/purchaseReceiving/purchaseReceivingList";
    }

    @RequestMapping(value = "/load")
    public String load(Integer id,HttpServletRequest request){
        //找到所有到货的订单
        List<PurchaseOrder> orderList = purchaseOrderService.findAllWithStatus("S");
        System.out.println("orderList : " + orderList.toString()+"  Size: "+orderList.size());
        request.setAttribute("orderList",orderList);
        if (id != null){
            PurchaseReceiving purchaseReceiving = purchaseReceivingService.findById(id);
            request.setAttribute("purchaseReceiving",purchaseReceiving);
        }
        return "/purchaseReceiving/purchaseReceivingLoad";
    }

    @RequestMapping(value = "/save")
    public  String save(Integer nowId,Integer id,Integer orderId,String remark,HttpServletRequest request){
        if(id == null){
            if (purchaseReceivingService.findByOrderIdAndAPStatus(orderId)!= null){
                throw  new BaseException("0016");
            }
            PurchaseReceiving purchaseReceiving = new PurchaseReceiving();
            purchaseReceiving.setOrderId(orderId);
            purchaseReceiving.setRemark(remark);
            purchaseReceiving.setCreateUserId(nowId);purchaseReceiving.setUpdateUserId(nowId);
            purchaseReceiving.setCreateTime(new Date());purchaseReceiving.setUpdateTime(new Date());
            purchaseReceiving.setStatus("A");
            purchaseReceiving.setCode(codeGeneratorService.gen());
            int cnt = purchaseReceivingService.add(purchaseReceiving);
            if (cnt == 1){ System.out.println("新增成功！ "+purchaseReceiving.getCode()); }
            else{ System.out.println("新增失败！ "+purchaseReceiving.getCode()); }
        }else {
            PurchaseReceiving purchaseReceiving = purchaseReceivingService.findById(id);
            if (purchaseReceiving.getOrderId().equals(orderId)){
                purchaseReceiving.setOrderId(orderId);
            }else{
                if (purchaseReceivingService.findByOrderIdAndAPStatus(orderId)!= null){
                    throw  new BaseException("0016");
                }else {
                    purchaseReceiving.setOrderId(orderId);
                }
            }
            purchaseReceiving.setRemark(remark);
            purchaseReceiving.setUpdateUserId(nowId);purchaseReceiving.setUpdateTime(new Date());
            int cnt = purchaseReceivingService.update(purchaseReceiving);
            if (cnt == 1){ System.out.println("修改成功！ "+purchaseReceiving.getCode()); }
            else{ System.out.println("修改失败！ "+purchaseReceiving.getCode()); }
        }
        request.setAttribute("message","操作成功");
        NUIResponseUtils.setDefaultValues(request);
        return "/common/nui.response";
    }

    @RequestMapping(value = "/delete")
    public  String delete(Integer id,HttpServletRequest request){
        int cnt = purchaseReceivingService.delete(id);
        if (cnt == 1){
            System.out.println("删除成功！ ");
        } else{
            System.out.println("删除失败！ ");
        }
        request.setAttribute("message","操作成功");
        NUIResponseUtils.setDefaultValues(request);
        return "/common/nui.response";
    }

    @RequestMapping(value = "/loadPurchaseReceiving")
    public  String loadPurchaseReceiving(Integer id,HttpServletRequest request){
        if (id !=null){
            List<SupplierCompany> supplierCompanyList = supplierCompanyService.findAllWithP();
            request.setAttribute("supplierCompanyList",supplierCompanyList);
            PurchaseReceiving purchaseReceiving = purchaseReceivingService.findById(id);
            request.setAttribute("purchaseReceiving",purchaseReceiving);
            PurchaseOrder purchaseOrder = purchaseOrderService.findById(purchaseReceiving.getOrderId());
            request.setAttribute("purchaseOrder",purchaseOrder);
            PurchaseInquiry purchaseInquiry = purchaseInquiryService.findById(purchaseOrder.getInquiryId());
            request.setAttribute("purchaseInquiry",purchaseInquiry);
            PriceGoodsContact priceGoodsContact = priceGoodsContactService.findById(purchaseInquiry.getGoodsId());
            request.setAttribute("priceGoodsContact",priceGoodsContact);
        }
        return "/purchaseReceiving/receivingDetail";
    }

    @RequestMapping(value = "/saveDetail")
    public String saveDetail(Integer id,Integer nowId,String operate,HttpServletRequest request){
        PurchaseReceiving purchaseReceiving = purchaseReceivingService.findById(id);
        System.out.println("operate : "+ operate);
        if (operate.equals("P")){
            purchaseReceiving.setStatus(operate);
            purchaseReceivingService.update(purchaseReceiving);
        }else if (operate.equals("F")){
            purchaseReceiving.setStatus(operate);
            purchaseReceivingService.update(purchaseReceiving);
        }
        NUIResponseUtils.setDefaultValues(request);
        return "/common/nui.response";
    }
}
