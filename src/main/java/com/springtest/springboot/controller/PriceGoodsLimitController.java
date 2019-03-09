package com.springtest.springboot.controller;

import com.springtest.springboot.BaseException;
import com.springtest.springboot.po.PriceGoodsCatalog;
import com.springtest.springboot.po.PriceGoodsContact;
import com.springtest.springboot.po.PriceGoodsLimit;
import com.springtest.springboot.service.PriceGoodsCatalogService;
import com.springtest.springboot.service.PriceGoodsContactService;
import com.springtest.springboot.service.PriceGoodsLimitService;
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
 * 限价管理控制器
 * Cai Ronggui 2019.02.20
 */
@Controller
@RequestMapping(value = "/priceGoodsLimit")
public class PriceGoodsLimitController {

    @Autowired
    private PriceGoodsLimitService priceGoodsLimitService;

    @Autowired
    private PriceGoodsCatalogService priceGoodsCatalogService;

    @Autowired
    private PriceGoodsContactService priceGoodsContactService;

    @RequestMapping(value = "/list")
    public String list(@ModelAttribute(value = "priceGoodsLimit") PriceGoodsLimit priceGoodsLimit,
                       @RequestParam(value = "pageNum",defaultValue = "1")Integer pageNum,
                       @RequestParam(value = "pageSize",defaultValue = "10")Integer pageSize,
                       String goodsName,
                       HttpServletRequest request){
        PageList<PriceGoodsLimit> pageList = priceGoodsLimitService.findPage(priceGoodsLimit,goodsName,pageNum,pageSize);
        request.setAttribute("pageList",pageList);
        return "/priceGoodsLimit/priceGoodsLimitList";
    }

    @RequestMapping(value = "/load")
    public String load(Integer id,HttpServletRequest request){
        PriceGoodsCatalog priceGoodsCatalog = new PriceGoodsCatalog();
        priceGoodsCatalog.setStatus("S");
        List<PriceGoodsCatalog> priceGoodsCatalogList = priceGoodsCatalogService.findAll(priceGoodsCatalog);
        request.setAttribute("priceGoodsCatalogList",priceGoodsCatalogList);
        if (id != null){
            PriceGoodsLimit priceGoodsLimit = priceGoodsLimitService.findById(id);
            request.setAttribute("priceGoodsLimit",priceGoodsLimit);
            SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
            String strdate = format.format(priceGoodsLimit.getStartTime())+" ~ "+format.format(priceGoodsLimit.getEndTime());
            request.setAttribute("approvalTime",strdate);
            PriceGoodsContact priceGoodsContact = priceGoodsContactService.findByCode(priceGoodsLimit.getGoodsCode());
            request.setAttribute("priceGoodsContact",priceGoodsContact);
        }
        return "/priceGoodsLimit/priceGoodsLimitLoad";
    }

    @RequestMapping(value = "/save")
    public  String save(Integer nowId,Integer id,Integer goodsId, String remark,
                        Double priceMax,Double priceMin,String limitTime,
                        HttpServletRequest request) throws  Exception{
        System.out.println("limitTime : "+limitTime);
        System.out.println("goodsId : "+goodsId);
        System.out.println("priceMax : "+priceMax);
        System.out.println("priceMin : "+priceMin);
        String s[] = limitTime.split(" ");
        System.out.println("s[o] : "+s[0]);
        System.out.println("s[2] : "+s[2]);
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Date startTime = sdf.parse(s[0]);
        Date endTime = sdf.parse(s[2]);
        if(id == null){
            PriceGoodsLimit priceGoodsLimit = new PriceGoodsLimit();
            PriceGoodsContact goodsContact = priceGoodsContactService.findById(goodsId);
            if (goodsContact!=null){
                priceGoodsLimit.setGoodsCode(goodsContact.getCode());
            }else{
                throw new BaseException("0014");
            }
            priceGoodsLimit.setRemark(remark);
            priceGoodsLimit.setPriceMax(priceMax);priceGoodsLimit.setPriceMin(priceMin);
            priceGoodsLimit.setStartTime(startTime);priceGoodsLimit.setEndTime(endTime);
            priceGoodsLimit.setCreateUserId(nowId);priceGoodsLimit.setUpdateUserId(nowId);
            priceGoodsLimit.setCreateTime(new Date());priceGoodsLimit.setUpdateTime(new Date());
            int cnt = priceGoodsLimitService.add(priceGoodsLimit);
            if (cnt == 1){ System.out.println("新增成功！ "+priceGoodsLimit.getGoodsCode()); }
            else{ System.out.println("新增失败！ "+priceGoodsLimit.getGoodsCode()); }

            goodsContact.setIsLimit("Y");
            goodsContact.setLimitStartTime(startTime);
            goodsContact.setLimitEndTime(endTime);
            goodsContact.setUpdateUserId(nowId);
            goodsContact.setUpdateTime(new Date());
            cnt = priceGoodsContactService.update(goodsContact);
            if (cnt == 1){ System.out.println("更新成功！ "+goodsContact.getName()); }
            else{ System.out.println("更新失败！ "+goodsContact.getName()); }
        }else {
            PriceGoodsLimit priceGoodsLimit = priceGoodsLimitService.findById(id);
            PriceGoodsContact priceGoodsContact = priceGoodsContactService.findById(goodsId);
            if (priceGoodsContact!=null){
                priceGoodsLimit.setGoodsCode(priceGoodsContact.getCode());
            }else{
                throw new BaseException("0014");
            }
            priceGoodsLimit.setRemark(remark);
            priceGoodsLimit.setPriceMax(priceMax);priceGoodsLimit.setPriceMin(priceMin);
            priceGoodsLimit.setStartTime(startTime);priceGoodsLimit.setEndTime(endTime);
            priceGoodsLimit.setUpdateUserId(nowId);priceGoodsLimit.setUpdateTime(new Date());
            int cnt = priceGoodsLimitService.update(priceGoodsLimit);
            if (cnt == 1){ System.out.println("修改成功！ "+priceGoodsLimit.getGoodsCode()); }
            else{ System.out.println("修改失败！ "+priceGoodsLimit.getGoodsCode()); }
        }
        request.setAttribute("message","操作成功");
        NUIResponseUtils.setDefaultValues(request);
        return "/common/nui.response";
    }

    //删除目录
    @RequestMapping(value = "/delete")
    public  String delete(Integer id,HttpServletRequest request){
        int cnt = priceGoodsLimitService.delete(id);
        if (cnt != 1){
            System.out.println("删除失败！ ");
        } else{
            System.out.println("删除成功！ ");
        }
        request.setAttribute("message","操作成功");
        NUIResponseUtils.setDefaultValues(request);
        return "/common/nui.response";
    }
}
