package com.springtest.springboot.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.springtest.springboot.dao.StorageSendingMapper;
import com.springtest.springboot.po.StorageSending;
import com.springtest.springboot.service.StorageSendingService;
import com.springtest.springboot.util.page.PageList;
import com.springtest.springboot.util.page.Paginator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service(value = "storageSendingService")
public class StorageSendingServiceImpl implements StorageSendingService {
    @Autowired
    private StorageSendingMapper storageSendingMapper;

    @Override
    public PageList<StorageSending> findPage(StorageSending storageSending, String goodsName, String departmentName, Integer pageNum, Integer pageSize){
        Page<Object> result = PageHelper.startPage(pageNum,pageSize);
        List<StorageSending> list = storageSendingMapper.findAll(storageSending,goodsName,departmentName);
        Paginator paginator = new Paginator(pageNum, pageSize, (int)result.getTotal());
        PageList<StorageSending> pageList = new PageList<StorageSending>(paginator);
        pageList.setData(list);
        return pageList;
    }

    @Override
    public StorageSending findById(Integer id){
        return storageSendingMapper.selectByPrimaryKey(id);
    }

    @Override
    public int add(StorageSending storageSending){
        return storageSendingMapper.insert(storageSending);
    }

    @Override
    public  int update(StorageSending  storageSending){
        return storageSendingMapper.updateByPrimaryKeySelective(storageSending);
    }

    @Override
    public  int  delete(Integer id){
        return storageSendingMapper.deleteByPrimaryKey(id);
    }
}
