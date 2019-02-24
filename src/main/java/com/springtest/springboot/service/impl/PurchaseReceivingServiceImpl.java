package com.springtest.springboot.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.springtest.springboot.dao.PurchaseReceivingMapper;
import com.springtest.springboot.po.PurchaseReceiving;
import com.springtest.springboot.service.PurchaseReceivingService;
import com.springtest.springboot.util.page.PageList;
import com.springtest.springboot.util.page.Paginator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service(value = "purchaseReceivingService")
public class PurchaseReceivingServiceImpl implements PurchaseReceivingService {

    @Autowired
    private PurchaseReceivingMapper purchaseReceivingMapper;

    @Override
    public PageList<PurchaseReceiving> findPage(PurchaseReceiving purchaseReceiving,String orderName, Integer pageNum, Integer pageSize){
        Page<Object> result = PageHelper.startPage(pageNum,pageSize);
        List<PurchaseReceiving> list = purchaseReceivingMapper.findAll(purchaseReceiving,orderName);
        Paginator paginator = new Paginator(pageNum, pageSize, (int)result.getTotal());
        PageList<PurchaseReceiving> pageList = new PageList<PurchaseReceiving>(paginator);
        pageList.setData(list);
        return pageList;
    }

    @Override
    public PurchaseReceiving findById(Integer id){
        return purchaseReceivingMapper.selectByPrimaryKey(id);
    }

    @Override
    public int add(PurchaseReceiving purchaseReceiving){
        return purchaseReceivingMapper.insert(purchaseReceiving);
    }

    @Override
    public  int update(PurchaseReceiving  purchaseOrder){
        return purchaseReceivingMapper.updateByPrimaryKeySelective(purchaseOrder);
    }

    @Override
    public  int  delete(Integer id){
        return purchaseReceivingMapper.deleteByPrimaryKey(id);
    }
}
