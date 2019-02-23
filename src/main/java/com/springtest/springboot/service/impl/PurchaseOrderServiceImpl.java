package com.springtest.springboot.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.springtest.springboot.dao.PurchaseOrderMapper;
import com.springtest.springboot.po.PurchaseOrder;
import com.springtest.springboot.service.PurchaseOrderService;
import com.springtest.springboot.util.page.PageList;
import com.springtest.springboot.util.page.Paginator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service(value = "purchaseOrderService")
public class PurchaseOrderServiceImpl implements PurchaseOrderService {

    @Autowired
    private PurchaseOrderMapper purchaseOrderMapper;
    @Override
    public PageList<PurchaseOrder> findPage(PurchaseOrder purchaseOrder, Integer pageNum, Integer pageSize){
        Page<Object> result = PageHelper.startPage(pageNum,pageSize);
        List<PurchaseOrder> list = purchaseOrderMapper.findAll(purchaseOrder);
        Paginator paginator = new Paginator(pageNum, pageSize, (int)result.getTotal());
        PageList<PurchaseOrder> pageList = new PageList<PurchaseOrder>(paginator);
        pageList.setData(list);
        return pageList;
    }

    @Override
    public PurchaseOrder findById(Integer id){
        return purchaseOrderMapper.selectByPrimaryKey(id);
    }

    @Override
    public int add(PurchaseOrder purchaseOrder){
        return purchaseOrderMapper.insert(purchaseOrder);
    }

    @Override
    public  int update(PurchaseOrder  purchaseOrder){
        return purchaseOrderMapper.updateByPrimaryKeySelective(purchaseOrder);
    }

    @Override
    public  int  delete(Integer id){
        return purchaseOrderMapper.deleteByPrimaryKey(id);
    }
}
