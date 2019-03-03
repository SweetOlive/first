package com.springtest.springboot.service;

import com.springtest.springboot.po.PurchaseOrder;
import com.springtest.springboot.util.page.PageList;

import java.util.List;

public interface PurchaseOrderService {

    public PageList<PurchaseOrder> findPage(PurchaseOrder purchaseOrder, Integer pageNum, Integer pageSize);

    public PurchaseOrder findById(Integer id);

    public int add(PurchaseOrder purchaseOrder);

    public  int update(PurchaseOrder  purchaseOrder);

    public  int  delete(Integer id);

    public List<PurchaseOrder> findAllWithStatus(String status);

    public  PurchaseOrder findByName(String name);
}
