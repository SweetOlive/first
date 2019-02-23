package com.springtest.springboot.service;

import com.springtest.springboot.po.PurchaseInquiry;
import com.springtest.springboot.util.page.PageList;

public interface PurchaseInquiryService {
    public PageList<PurchaseInquiry> findPage(PurchaseInquiry purchaseInquiry,String companyName,String goodsName, Integer pageNum, Integer pageSize);

    public PurchaseInquiry findById(Integer id);

    public int add(PurchaseInquiry purchaseInquiry);

    public  int update(PurchaseInquiry  purchaseInquiry);

    public  int  delete(Integer id);

    public PurchaseInquiry findByCode(String code);
}
