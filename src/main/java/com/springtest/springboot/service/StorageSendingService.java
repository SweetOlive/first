package com.springtest.springboot.service;

import com.springtest.springboot.po.StorageSending;
import com.springtest.springboot.util.page.PageList;

public interface StorageSendingService {

    public PageList<StorageSending> findPage(StorageSending storageSending, String goodsName,String departmentName, Integer pageNum, Integer pageSize);

    public StorageSending findById(Integer id);

    public int add(StorageSending storageSending);

    public  int update(StorageSending  storageSending);

    public  int  delete(Integer id);
}
