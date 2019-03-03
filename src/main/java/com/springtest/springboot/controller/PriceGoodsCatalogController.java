package com.springtest.springboot.controller;

import com.springtest.springboot.BaseException;
import com.springtest.springboot.Constants;
import com.springtest.springboot.po.PriceGoodsCatalog;
import com.springtest.springboot.po.PriceGoodsContact;
import com.springtest.springboot.service.CodeGeneratorService;
import com.springtest.springboot.service.PriceGoodsCatalogService;
import com.springtest.springboot.service.PriceGoodsContactService;
import com.springtest.springboot.util.NUIResponseUtils;
import com.springtest.springboot.util.page.PageList;
import net.sf.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * 物资目录管理控制器
 * Cai Ronggui 2019.02.19
 */

@Controller
@RequestMapping(value = "/priceGoodsCatalog")
public class PriceGoodsCatalogController {

    @Autowired
    private  PriceGoodsCatalogService priceGoodsCatalogService;

    @Autowired
    private CodeGeneratorService codeGeneratorService;

    @Autowired
    private PriceGoodsContactService priceGoodsContactService;

    //物资目录列表
    @RequestMapping(value = "/list")
    public String list(@ModelAttribute(value = "priceGoodsCatalog") PriceGoodsCatalog priceGoodsCatalog,
                       @RequestParam(value = "pageNum",defaultValue = "1")Integer pageNum,
                       @RequestParam(value = "pageSize",defaultValue = "10")Integer pageSize,
                       HttpServletRequest request){
        PageList<PriceGoodsCatalog> pageList = priceGoodsCatalogService.findAllPage(priceGoodsCatalog,pageNum,pageSize);
        request.setAttribute("pageList",pageList);
        return "/priceGoodsCatalog/catalogList";
    }

    //物资目录新增修改入口
    @RequestMapping(value = "/load")
    public String load(Integer id,HttpServletRequest request){
        if (id != null){
            PriceGoodsCatalog priceGoodsCatalog = priceGoodsCatalogService.findById(id);
            request.setAttribute("priceGoodsCatalog",priceGoodsCatalog);
        }
        return "/priceGoodsCatalog/catalogLoad";
    }

    //物资目录新增修改
    @RequestMapping(value = "/save")
    public  String save(Integer nowId,Integer id,String name, String introduce,HttpServletRequest request){
        if(id == null){
            if (priceGoodsCatalogService.findByName(name)!=null){
                throw new BaseException("0006");
            }
            PriceGoodsCatalog priceGoodsCatalog = new PriceGoodsCatalog();
            priceGoodsCatalog.setName(name);priceGoodsCatalog.setIntroduce(introduce);
            priceGoodsCatalog.setCreateUserId(nowId);priceGoodsCatalog.setUpdateUserId(nowId);
            priceGoodsCatalog.setCreateTime(new Date());priceGoodsCatalog.setUpdateTime(new Date());
            priceGoodsCatalog.setStatus("S");
            priceGoodsCatalog.setCode(codeGeneratorService.gen());
            int cnt = priceGoodsCatalogService.add(priceGoodsCatalog);
            if (cnt == 1){ System.out.println("新增成功！ "+priceGoodsCatalog.getName()); }
            else{ System.out.println("新增失败！ "+priceGoodsCatalog.getName()); }
        }else {
            PriceGoodsCatalog priceGoodsCatalog = priceGoodsCatalogService.findById(id);
            if (priceGoodsCatalog.getName().equals(name)){
                priceGoodsCatalog.setName(name);
            }else{
                if (priceGoodsCatalogService.findByName(name)!=null){
                    throw new BaseException("0006");
                }else {
                    priceGoodsCatalog.setName(name);
                }
            }
            priceGoodsCatalog.setIntroduce(introduce);
            priceGoodsCatalog.setUpdateUserId(nowId);priceGoodsCatalog.setUpdateTime(new Date());
            int cnt = priceGoodsCatalogService.update(priceGoodsCatalog);
            if (cnt == 1){ System.out.println("修改成功！ "+priceGoodsCatalog.getName()); }
            else{ System.out.println("修改失败！ "+priceGoodsCatalog.getName()); }
        }
        request.setAttribute("message","操作成功");
        NUIResponseUtils.setDefaultValues(request);
        return "/common/nui.response";
    }

    //删除目录
    @RequestMapping(value = "/delete")
    public  String delete(Integer id,HttpServletRequest request){
        int cnt = priceGoodsCatalogService.delete(id);
        List<PriceGoodsContact> list = priceGoodsContactService.findAllByCatalogId(id);
        for (PriceGoodsContact priceGoodsContact : list){
            priceGoodsContactService.detele(priceGoodsContact.getId());
        }
        if (cnt == 1){
            System.out.println("删除成功！ ");
        } else{
            System.out.println("删除失败！ ");
        }
        request.setAttribute("message","操作成功");
        NUIResponseUtils.setDefaultValues(request);
        return "/common/nui.response";
    }

    //目录详情-即物资详情
    @RequestMapping(value = "/loadCatalog")
    public String loadCatalog(Integer id,HttpServletRequest request){
        if (id != null){
            PriceGoodsCatalog priceGoodsCatalog = priceGoodsCatalogService.findById(id);
            request.setAttribute("priceGoodsCatalog",priceGoodsCatalog);
            List<PriceGoodsContact> list = priceGoodsContactService.findAllByCatalogId(id);
            //判断物资列表是否为空，空的话新建第一个物资
            if (list.size()==0){
                PriceGoodsContact priceGoodsContact = new PriceGoodsContact();
                priceGoodsContact.setName(priceGoodsCatalog.getName());
                priceGoodsContact.setCatalogId(id);
                priceGoodsContact.setParentId(-1);
                priceGoodsContact.setCode(codeGeneratorService.gen());
                priceGoodsContact.setCreateTime(new Date());priceGoodsContact.setUpdateTime(new Date());
                priceGoodsContact.setCreateUserId(priceGoodsCatalog.getCreateUserId());
                priceGoodsContact.setUpdateUserId(priceGoodsCatalog.getCreateUserId());
                priceGoodsContactService.add(priceGoodsContact);
            }
        }
        return "/priceGoodsCatalog/goodsList";
    }

    //（json格式数据）
    @RequestMapping(value = "/jsonList")
    public void jsonList(Integer id ,HttpServletRequest request, HttpServletResponse response) throws IOException {
        System.out.println("catalogId: "+ id);
        PriceGoodsContact smallPriceGoodsContact = priceGoodsContactService.findSmallParentId(id);
        JSONArray permissionJsonArray = priceGoodsCatalogService.findAllByTree(smallPriceGoodsContact.getParentId(),id);
        response.setCharacterEncoding("UTF-8");
        response.setContentType("application/json");
        response.getWriter().println(permissionJsonArray.toString());
    }

    //物资新增修改入口
    @RequestMapping(value = "/goodsLoad")
    public String goodsLoad(Integer id,Integer parentId,HttpServletRequest request){
        if (id !=null){
            System.out.println("物资修改：id = "+ id);
            PriceGoodsContact priceGoodsContact = priceGoodsContactService.findById(id);
            PriceGoodsContact parentPriceGoodsContact = priceGoodsContactService.findById(priceGoodsContact.getParentId());
            request.setAttribute("priceGoodsContact",priceGoodsContact);
            request.setAttribute("parentPriceGoodsContact",parentPriceGoodsContact);
            request.setAttribute("catalogId",priceGoodsContact.getCatalogId());
        }
        if(parentId !=null){
            System.out.println("物资新增：parentId = "+ parentId);
            PriceGoodsContact parentPriceGoodsContact = priceGoodsContactService.findById(parentId);
            request.setAttribute("parentPriceGoodsContact",parentPriceGoodsContact);
            request.setAttribute("catalogId",parentPriceGoodsContact.getCatalogId());
        }
        return "/priceGoodsCatalog/goodsLoad";
    }

    //物资新增修改保存
    @RequestMapping(value = "/goodsSave")
    public String save(Integer nowId,Integer catalogId,Integer id,Integer parentId,
                       String name,String introduce,
                       HttpServletRequest request){
        System.out.println("++++++++++++++++++");
        System.out.println("当前登录用户nowId : "+ nowId);
        System.out.println("当前id : "+ id);
        System.out.println("父parentId : "+parentId);
        System.out.println("catalogId : "+catalogId);
        System.out.println("++++++++++++++++++");

        if (id==null && parentId !=null){
            PriceGoodsContact priceGoodsContact = new PriceGoodsContact();
            priceGoodsContact.setParentId(parentId);
            priceGoodsContact.setName(name);
            priceGoodsContact.setIntroduce(introduce);
            priceGoodsContact.setCatalogId(catalogId);
            priceGoodsContact.setCreateUserId(nowId);priceGoodsContact.setUpdateUserId(nowId);
            priceGoodsContact.setCreateTime(new Date());priceGoodsContact.setUpdateTime(new Date());
            priceGoodsContact.setCode(codeGeneratorService.gen());
            int cnt = priceGoodsContactService.add(priceGoodsContact);
        }
        if (id!=null && parentId !=null){
            PriceGoodsContact priceGoodsContact = priceGoodsContactService.findById(id);
            priceGoodsContact.setName(name);
            priceGoodsContact.setIntroduce(introduce);
            priceGoodsContact.setUpdateUserId(nowId);
            priceGoodsContact.setUpdateTime(new Date());
            int cnt = priceGoodsContactService.update(priceGoodsContact);
        }
        request.setAttribute("message","操作成功");
        NUIResponseUtils.setDefaultValues(request);
        return "/common/nui.response";
    }
    //删除
    @RequestMapping(value = "/goodsDelete")
    public  String goodsDelete(Integer id,HttpServletRequest request){
        System.out.println("物资id："+ id);
        int cnt = priceGoodsContactService.detele(id);

        request.setAttribute("message","操作成功");
        NUIResponseUtils.setDefaultValues(request);
        return "/common/nui.response";
    }

}
