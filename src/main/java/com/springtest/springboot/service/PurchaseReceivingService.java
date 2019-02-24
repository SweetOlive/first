package com.springtest.springboot.service;

import com.springtest.springboot.po.PurchaseReceiving;
import com.springtest.springboot.util.page.PageList;

public interface PurchaseReceivingService {

    public PageList<PurchaseReceiving> findPage(PurchaseReceiving purchaseReceiving, String orderName,Integer pageNum, Integer pageSize);

    public PurchaseReceiving findById(Integer id);

    public int add(PurchaseReceiving purchaseReceiving);

    public  int update(PurchaseReceiving  purchaseReceiving);

    public  int  delete(Integer id);
}
