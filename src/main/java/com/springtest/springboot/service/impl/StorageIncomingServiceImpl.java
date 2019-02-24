package com.springtest.springboot.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.springtest.springboot.dao.StorageIncomingMapper;
import com.springtest.springboot.po.StorageIncoming;
import com.springtest.springboot.service.StorageIncomingService;
import com.springtest.springboot.util.page.PageList;
import com.springtest.springboot.util.page.Paginator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service(value = "storageIncomingService")
public class StorageIncomingServiceImpl implements StorageIncomingService {
    @Autowired
    private StorageIncomingMapper storageIncomingMapper;

    @Override
    public PageList<StorageIncoming> findPage(StorageIncoming storageIncoming,String receivingCode, Integer pageNum, Integer pageSize){
        Page<Object> result = PageHelper.startPage(pageNum,pageSize);
        List<StorageIncoming> list = storageIncomingMapper.findAll(storageIncoming,receivingCode);
        Paginator paginator = new Paginator(pageNum, pageSize, (int)result.getTotal());
        PageList<StorageIncoming> pageList = new PageList<StorageIncoming>(paginator);
        pageList.setData(list);
        return pageList;
    }

    @Override
    public StorageIncoming findById(Integer id){
        return storageIncomingMapper.selectByPrimaryKey(id);
    }

    @Override
    public int add(StorageIncoming storageIncoming){
        return storageIncomingMapper.insert(storageIncoming);
    }

    @Override
    public  int update(StorageIncoming  budgetManagement){
        return storageIncomingMapper.updateByPrimaryKeySelective(budgetManagement);
    }

    @Override
    public  int  delete(Integer id){
        return storageIncomingMapper.deleteByPrimaryKey(id);
    }
}
