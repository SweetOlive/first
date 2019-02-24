package com.springtest.springboot.controller;

import com.springtest.springboot.po.PriceGoodsContact;
import com.springtest.springboot.po.StorageSending;
import com.springtest.springboot.po.SysDepartment;
import com.springtest.springboot.service.CodeGeneratorService;
import com.springtest.springboot.service.PriceGoodsContactService;
import com.springtest.springboot.service.StorageSendingService;
import com.springtest.springboot.service.SysDepartmentService;
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
 * 发料控制器
 * CaiRonggui 2019.02.24 23:03
 */
@Controller
@RequestMapping(value = "/storageSending")

public class StorageSendingController {

    @Autowired
    private StorageSendingService storageSendingService;

    @Autowired
    private PriceGoodsContactService priceGoodsContactService;

    @Autowired
    private SysDepartmentService sysDepartmentService;

    @Autowired
    private CodeGeneratorService codeGeneratorService;

    @RequestMapping(value = "/list")
    public String list(@ModelAttribute(value = "storageSending") StorageSending storageSending,
                       @RequestParam(value = "pageNum",defaultValue = "1")Integer pageNum,
                       @RequestParam(value = "pageSize",defaultValue = "10")Integer pageSize,
                       String goodsName,String departmentName,
                       HttpServletRequest request){
        PageList<StorageSending> pageList = storageSendingService.findPage(storageSending,goodsName,departmentName,pageNum,pageSize);
        request.setAttribute("pageList",pageList);
        request.setAttribute("goodsName",goodsName);
        request.setAttribute("departmentName",departmentName);
        return "/storageSending/storageSendingList";
    }

    @RequestMapping(value = "/load")
    public String load(Integer id,HttpServletRequest request){
        //部门
        List<SysDepartment> sysDepartmentList = sysDepartmentService.findAll();
        request.setAttribute("sysDepartmentList",sysDepartmentList);

        //物资
        List<PriceGoodsContact> priceGoodsContactList = priceGoodsContactService.findAll();
        System.out.println("priceGoodsContactList : " + priceGoodsContactList.toString()+"  Size: "+priceGoodsContactList.size());
        request.setAttribute("priceGoodsContactList",priceGoodsContactList);

        if (id != null){
            StorageSending storageSending = storageSendingService.findById(id);
            request.setAttribute("storageSending",storageSending);
        }
        return "/storageSending/storageSendingLoad";
    }

    @RequestMapping(value = "/save")
    public  String save(Integer nowId,Integer id,Integer goodsId,Integer departmentId,
                        Integer number,String remark,HttpServletRequest request){
        if(id == null){
            StorageSending storageSending = new StorageSending();
            storageSending.setGoodsId(goodsId);storageSending.setDepartmentId(departmentId);
            storageSending.setNumber(number);
            storageSending.setRemark(remark);
            storageSending.setCreateUserId(nowId);storageSending.setUpdateUserId(nowId);
            storageSending.setCreateTime(new Date());storageSending.setUpdateTime(new Date());
            storageSending.setStatus("A");
            storageSending.setCode(codeGeneratorService.gen());
            int cnt = storageSendingService.add(storageSending);
            if (cnt == 1){ System.out.println("新增成功！ "+storageSending.getCode()); }
            else{ System.out.println("新增失败！ "+storageSending.getCode()); }
        }else {
            StorageSending storageSending = storageSendingService.findById(id);
            storageSending.setGoodsId(goodsId);storageSending.setDepartmentId(departmentId);
            storageSending.setNumber(number);
            storageSending.setRemark(remark);
            storageSending.setUpdateUserId(nowId);storageSending.setUpdateTime(new Date());
            int cnt = storageSendingService.update(storageSending);
            if (cnt == 1){ System.out.println("修改成功！ "+storageSending.getCode()); }
            else{ System.out.println("修改失败！ "+storageSending.getCode()); }
        }
        request.setAttribute("message","操作成功");
        NUIResponseUtils.setDefaultValues(request);
        return "/common/nui.response";
    }

    @RequestMapping(value = "/delete")
    public  String delete(Integer id,HttpServletRequest request){
        int cnt = storageSendingService.delete(id);
        if (cnt == 1){
            System.out.println("删除成功！ ");
        } else{
            System.out.println("删除失败！ ");
        }
        request.setAttribute("message","操作成功");
        NUIResponseUtils.setDefaultValues(request);
        return "/common/nui.response";
    }

    @RequestMapping(value = "/loadStorageSending")
    public  String loadStorageSending(Integer id,HttpServletRequest request){
        //部门
        List<SysDepartment> sysDepartmentList = sysDepartmentService.findAll();
        request.setAttribute("sysDepartmentList",sysDepartmentList);

        //物资
        List<PriceGoodsContact> priceGoodsContactList = priceGoodsContactService.findAll();
        System.out.println("priceGoodsContactList : " + priceGoodsContactList.toString()+"  Size: "+priceGoodsContactList.size());
        request.setAttribute("priceGoodsContactList",priceGoodsContactList);

        if (id != null){
            StorageSending storageSending = storageSendingService.findById(id);
            request.setAttribute("storageSending",storageSending);
        }
        return "/storageSending/sendingDetail";
    }

    @RequestMapping(value = "/saveDetail")
    public String saveDetail(Integer id,Integer nowId,String operate,HttpServletRequest request){
        StorageSending storageSending = storageSendingService.findById(id);
        System.out.println("operate : "+ operate);
        if (operate.equals("P")){
            storageSending.setStatus(operate);
            //修改物资表属性：主要包含数量两个
            PriceGoodsContact priceGoodsContact = priceGoodsContactService.findById(storageSending.getGoodsId());
            //判断需求量是否大于库存量
            if (priceGoodsContact.getCount()!=null && priceGoodsContact.getCount() >= storageSending.getNumber()){
                priceGoodsContact.setCount(priceGoodsContact.getCount()-storageSending.getNumber());
                int cnt = priceGoodsContactService.update(priceGoodsContact);
                if (cnt==1){
                    System.out.println(priceGoodsContact.getName()+"物资更新成功：");
                    System.out.println("数量更新为：" +priceGoodsContact.getCount());
                }else{
                    System.out.println(priceGoodsContact.getName()+"物资更新失败：");
                }
                storageSendingService.update(storageSending);
                request.setAttribute("message","操作成功");
            }else{
                request.setAttribute("message","操作失败");
            }
        }
        request.setAttribute("message","操作成功");
        NUIResponseUtils.setDefaultValues(request);
        return "/common/nui.response";
    }
}
