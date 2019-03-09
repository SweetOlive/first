package com.springtest.springboot.controller;

import com.springtest.springboot.Constants;
import com.springtest.springboot.service.*;
import com.springtest.springboot.util.JsonUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.HashMap;
import java.util.Map;

/**
 * 一些特殊访问控制层
 * CaiRonggui 2019.03.03 21:22
 */
@Controller
@RequestMapping(value = "/admin")
public class AdminController {

    @Autowired
    private FileService fileService;

    @Autowired
    private SupplierCompanyService supplierCompanyService;

    @Autowired
    private PurchaseOrderService purchaseOrderService;

    @Autowired
    private PurchaseReceivingService purchaseReceivingService;

    @Autowired
    private StorageIncomingService storageIncomingService;

    @Autowired
    private StorageSendingService storageSendingService;

    //显示图片用
    @RequestMapping("/imgView")
    public void image(HttpServletRequest request, HttpServletResponse response, String path) throws Exception {
        fileService.image(path, request, response);
    }

    //菜单栏提示
    @ResponseBody
    @RequestMapping(value = "/refreshSideBarRedPoint")
    public String refreshSideBarRedPoint(String type,HttpServletRequest request) throws Exception {
        Map<String,Object> pointMap = new HashMap<>();
        if(type!=null) {
            if (type.equals("COMPANY_APPROVER_NUM")){
                pointMap.put("COMPANY_APPROVER_NUM",supplierCompanyService.findByStatusA().size());
            }else if (type.equals("ORDER_APPROVER_NUM")){
                pointMap.put("ORDER_APPROVER_NUM",purchaseOrderService.findAllWithStatus("A").size()+purchaseOrderService.findAllWithStatus("P").size());
            }else if (type.equals("RECEIVING_APPROVER_NUM")){
                pointMap.put("RECEIVING_APPROVER_NUM",purchaseReceivingService.findStatus("A").size());
            }else if (type.equals("INCOMING_APPROVER_NUM")){
                pointMap.put("INCOMING_APPROVER_NUM",storageIncomingService.findByStatus("A").size());
            }else if (type.equals("SEND_APPROVER_NUM")){
                pointMap.put("SEND_APPROVER_NUM",storageSendingService.findByStatus("A").size());
            }
        }else{
            pointMap.put("COMPANY_APPROVER_NUM",supplierCompanyService.findByStatusA().size());
            pointMap.put("ORDER_APPROVER_NUM",purchaseOrderService.findAllWithStatus("A").size()+purchaseOrderService.findAllWithStatus("P").size());
            pointMap.put("RECEIVING_APPROVER_NUM",purchaseReceivingService.findStatus("A").size());
            pointMap.put("INCOMING_APPROVER_NUM",storageIncomingService.findByStatus("A").size());
            pointMap.put("SEND_APPROVER_NUM",storageSendingService.findByStatus("A").size());
        }
        return JsonUtils.obj2Json(pointMap);
    }



}
