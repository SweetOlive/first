package com.springtest.springboot.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.springtest.springboot.dao.PurchaseInquiryMapper;
import com.springtest.springboot.po.PurchaseInquiry;
import com.springtest.springboot.service.PurchaseInquiryService;
import com.springtest.springboot.util.page.PageList;
import com.springtest.springboot.util.page.Paginator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service(value = "purchaseInquiryService")
public class PurchaseInquiryServiceImpl implements PurchaseInquiryService {

    @Autowired
    private PurchaseInquiryMapper purchaseInquiryMapper;
    @Override
    public PageList<PurchaseInquiry> findPage(PurchaseInquiry purchaseInquiry, String companyName,String goodsName,Integer pageNum, Integer pageSize){
        Page<Object> result = PageHelper.startPage(pageNum,pageSize);
        List<PurchaseInquiry> list = purchaseInquiryMapper.findAll(purchaseInquiry, companyName, goodsName);
        Paginator paginator = new Paginator(pageNum, pageSize, (int)result.getTotal());
        PageList<PurchaseInquiry> pageList = new PageList<PurchaseInquiry>(paginator);
        pageList.setData(list);
        return pageList;
    }

    @Override
    public PurchaseInquiry findById(Integer id){
        return purchaseInquiryMapper.selectByPrimaryKey(id);
    }

    @Override
    public int add(PurchaseInquiry budgetManagement){
        return purchaseInquiryMapper.insert(budgetManagement);
    }

    @Override
    public  int update(PurchaseInquiry  purchaseInquiry){
        return purchaseInquiryMapper.updateByPrimaryKeySelective(purchaseInquiry);
    }

    @Override
    public  int  delete(Integer id){
        return purchaseInquiryMapper.deleteByPrimaryKey(id);
    }

    @Override
    public PurchaseInquiry findByCode(String code){
        return purchaseInquiryMapper.findByCode(code);
    }
}
