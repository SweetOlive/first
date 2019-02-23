package com.springtest.springboot.controller;

import com.springtest.springboot.po.PriceGoodsContact;
import com.springtest.springboot.po.PurchaseInquiry;
import com.springtest.springboot.po.SupplierCompany;
import com.springtest.springboot.service.CodeGeneratorService;
import com.springtest.springboot.service.PriceGoodsContactService;
import com.springtest.springboot.service.PurchaseInquiryService;
import com.springtest.springboot.service.SupplierCompanyService;
import com.springtest.springboot.util.NUIResponseUtils;
import com.springtest.springboot.util.page.PageList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * 询价单控制器
 * CaiRonggui 2019.02.23
 */
@Controller
@RequestMapping(value = "/purchaseInquiry")
public class PurchaseInquiryController {

    @Autowired
    private PurchaseInquiryService purchaseInquiryService;

    @Autowired
    private CodeGeneratorService codeGeneratorService;

    @Autowired
    private SupplierCompanyService supplierCompanyService;

    @Autowired
    private PriceGoodsContactService priceGoodsContactService;

    @RequestMapping(value = "/list")
    public String list(@ModelAttribute(value = "purchaseInquiry") PurchaseInquiry purchaseInquiry,
                       @RequestParam(value = "pageNum",defaultValue = "1")Integer pageNum,
                       @RequestParam(value = "pageSize",defaultValue = "10")Integer pageSize,
                       String companyName,String goodsName,
                       HttpServletRequest request){
        PageList<PurchaseInquiry> pageList = purchaseInquiryService.findPage(purchaseInquiry,companyName,goodsName,pageNum,pageSize);
        request.setAttribute("pageList",pageList);
        request.setAttribute("companyName",companyName);
        request.setAttribute("goodsName",goodsName);
        return "/purchaseInquiry/purchaseInquiryList";
    }

    @RequestMapping(value = "/load")
    public String load(Integer id,HttpServletRequest request){
        //找到所有状态为通过的供应商
        List<SupplierCompany> supplierCompanyList = supplierCompanyService.findAllWithP();
        System.out.println("supplierCompanyList : " + supplierCompanyList.toString()+"  Size: "+supplierCompanyList.size());
        request.setAttribute("supplierCompanyList",supplierCompanyList);
        //找到所有物资
        List<PriceGoodsContact> priceGoodsContactList = priceGoodsContactService.findAll();
        System.out.println("priceGoodsContactList : " + priceGoodsContactList.toString()+"  Size: "+priceGoodsContactList.size());
        request.setAttribute("priceGoodsContactList",priceGoodsContactList);
        if (id != null){
            PurchaseInquiry purchaseInquiry = purchaseInquiryService.findById(id);
            request.setAttribute("purchaseInquiry",purchaseInquiry);
        }
        return "/purchaseInquiry/purchaseInquiryLoad";
    }

    @RequestMapping(value = "/save")
    public  String save(Integer nowId,Integer id,Integer goodsId,Integer companyId,Integer number,
                        Double price,String arriveTime,String address,String paied,
                        String remark,HttpServletRequest request) throws  Exception{
        System.out.println("arriveTime:"+arriveTime);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date arrive_Time = sdf.parse(arriveTime);
        if(id == null){
            PurchaseInquiry purchaseInquiry = new PurchaseInquiry();
            purchaseInquiry.setGoodsId(goodsId);purchaseInquiry.setCompanyId(companyId);
            purchaseInquiry.setPrice(price);purchaseInquiry.setAddress(address);
            purchaseInquiry.setPaied(paied);purchaseInquiry.setNumber(number);
            purchaseInquiry.setArrivetime(arrive_Time);
            purchaseInquiry.setRemark(remark);
            purchaseInquiry.setCreateUserId(nowId);purchaseInquiry.setUpdateUserId(nowId);
            purchaseInquiry.setCreateTime(new Date());purchaseInquiry.setUpdateTime(new Date());
            purchaseInquiry.setCode(codeGeneratorService.gen());
            int cnt = purchaseInquiryService.add(purchaseInquiry);
            if (cnt == 1){ System.out.println("新增成功！ "+purchaseInquiry.getCode()); }
            else{ System.out.println("新增失败！ "+purchaseInquiry.getCode()); }
        }else {
            PurchaseInquiry purchaseInquiry = purchaseInquiryService.findById(id);
            purchaseInquiry.setGoodsId(goodsId);purchaseInquiry.setCompanyId(companyId);
            purchaseInquiry.setPrice(price);purchaseInquiry.setAddress(address);
            purchaseInquiry.setPaied(paied);purchaseInquiry.setNumber(number);
            purchaseInquiry.setArrivetime(arrive_Time);
            purchaseInquiry.setRemark(remark);
            purchaseInquiry.setUpdateUserId(nowId);purchaseInquiry.setUpdateTime(new Date());
            int cnt = purchaseInquiryService.update(purchaseInquiry);
            if (cnt == 1){ System.out.println("修改成功！ "+purchaseInquiry.getCode()); }
            else{ System.out.println("修改失败！ "+purchaseInquiry.getCode()); }
        }
        request.setAttribute("message","操作成功");
        NUIResponseUtils.setDefaultValues(request);
        return "/common/nui.response";
    }

    @RequestMapping(value = "/delete")
    public  String delete(Integer id,HttpServletRequest request){
        int cnt = purchaseInquiryService.delete(id);
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
