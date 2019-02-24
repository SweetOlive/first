package com.springtest.springboot.controller;

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
 * 进库料控制器
 * CaiRonggui 2019.02.24 23:03
 */
@Controller
@RequestMapping(value = "/storageIncoming")
public class StorageIncomingController {

    @Autowired
    private StorageIncomingService storageIncomingService;

    @Autowired
    private PurchaseReceivingService purchaseReceivingService;

    @Autowired
    private PurchaseOrderService purchaseOrderService;

    @Autowired
    private PurchaseInquiryService purchaseInquiryService;

    @Autowired
    private PriceGoodsContactService priceGoodsContactService;

    @Autowired
    private CodeGeneratorService codeGeneratorService;

    @RequestMapping(value = "/list")
    public String list(@ModelAttribute(value = "storageIncoming") StorageIncoming storageIncoming,
                       @RequestParam(value = "pageNum",defaultValue = "1")Integer pageNum,
                       @RequestParam(value = "pageSize",defaultValue = "10")Integer pageSize,
                       String receivingCode,
                       HttpServletRequest request){
        PageList<StorageIncoming> pageList = storageIncomingService.findPage(storageIncoming,receivingCode,pageNum,pageSize);
        request.setAttribute("pageList",pageList);
        request.setAttribute("receivingCode",receivingCode);
        return "/storageIncoming/storageIncomingList";
    }

    @RequestMapping(value = "/load")
    public String load(Integer id,HttpServletRequest request){
        List<PurchaseReceiving> purchaseReceivingList = purchaseReceivingService.findStatus("P");
        System.out.println("purchaseReceivingList size: "+purchaseReceivingList.size());
        request.setAttribute("purchaseReceivingList",purchaseReceivingList);
        if (id != null){
            StorageIncoming storageIncoming = storageIncomingService.findById(id);
            request.setAttribute("storageIncoming",storageIncoming);
        }
        return "/storageIncoming/storageIncomingLoad";
    }

    @RequestMapping(value = "/save")
    public  String save(Integer nowId,Integer id,Integer receivingId
            ,String remark,HttpServletRequest request){
        if(id == null){
            StorageIncoming storageIncoming = new StorageIncoming();
            storageIncoming.setReceivingId(receivingId);
            storageIncoming.setRemark(remark);
            storageIncoming.setCreateUserId(nowId);storageIncoming.setUpdateUserId(nowId);
            storageIncoming.setCreateTime(new Date());storageIncoming.setUpdateTime(new Date());
            storageIncoming.setStatus("A");
            storageIncoming.setCode(codeGeneratorService.gen());
            int cnt = storageIncomingService.add(storageIncoming);
            if (cnt == 1){ System.out.println("新增成功！ "+storageIncoming.getCode()); }
            else{ System.out.println("新增失败！ "+storageIncoming.getCode()); }
        }else {
            StorageIncoming storageIncoming = storageIncomingService.findById(id);
            storageIncoming.setReceivingId(receivingId);
            storageIncoming.setRemark(remark);
            storageIncoming.setUpdateUserId(nowId);storageIncoming.setUpdateTime(new Date());
            int cnt = storageIncomingService.update(storageIncoming);
            if (cnt == 1){ System.out.println("修改成功！ "+storageIncoming.getCode()); }
            else{ System.out.println("修改失败！ "+storageIncoming.getCode()); }
        }
        request.setAttribute("message","操作成功");
        NUIResponseUtils.setDefaultValues(request);
        return "/common/nui.response";
    }

    @RequestMapping(value = "/delete")
    public  String delete(Integer id,HttpServletRequest request){
        int cnt = storageIncomingService.delete(id);
        if (cnt == 1){
            System.out.println("删除成功！ ");
        } else{
            System.out.println("删除失败！ ");
        }
        request.setAttribute("message","操作成功");
        NUIResponseUtils.setDefaultValues(request);
        return "/common/nui.response";
    }

    @RequestMapping(value = "/loadStorageIncoming")
    public  String loadStorageIncoming(Integer id,HttpServletRequest request){
        if (id !=null){
            List<PurchaseReceiving> purchaseReceivingList = purchaseReceivingService.findStatus("P");
            System.out.println("purchaseReceivingList size: "+purchaseReceivingList.size());
            request.setAttribute("purchaseReceivingList",purchaseReceivingList);

            StorageIncoming storageIncoming = storageIncomingService.findById(id);
            request.setAttribute("storageIncoming",storageIncoming);
        }
        return "/storageIncoming/incomingDetail";
    }

    @RequestMapping(value = "/saveDetail")
    public String saveDetail(Integer id,Integer nowId,String operate,HttpServletRequest request){
        StorageIncoming storageIncoming = storageIncomingService.findById(id);
        System.out.println("operate : "+ operate);
        if (operate.equals("P")){
            storageIncoming.setStatus(operate);
            storageIncomingService.update(storageIncoming);
            //修改物资表属性：主要包含价格数量两个
            PurchaseReceiving purchaseReceiving = purchaseReceivingService.findById(storageIncoming.getReceivingId());
            PurchaseOrder purchaseOrder = purchaseOrderService.findById(purchaseReceiving.getOrderId());
            PurchaseInquiry purchaseInquiry = purchaseInquiryService.findById(purchaseOrder.getInquiryId());
            PriceGoodsContact priceGoodsContact = priceGoodsContactService.findById(purchaseInquiry.getGoodsId());
            priceGoodsContact.setPrice(purchaseInquiry.getPrice());
            if (priceGoodsContact.getCount()!=null){
                priceGoodsContact.setCount(priceGoodsContact.getCount()+purchaseInquiry.getNumber());
            }else{
                priceGoodsContact.setCount(purchaseInquiry.getNumber());
            }
            int cnt = priceGoodsContactService.update(priceGoodsContact);
            if (cnt==1){
                System.out.println(priceGoodsContact.getName()+"物资更新成功：");
                System.out.println("价格更新为：" +priceGoodsContact.getPrice());
                System.out.println("数量更新为：" +priceGoodsContact.getCount());
            }else{
                System.out.println(priceGoodsContact.getName()+"物资更新失败：");
            }
        }
        request.setAttribute("message","操作成功");
        NUIResponseUtils.setDefaultValues(request);
        return "/common/nui.response";
    }
}
