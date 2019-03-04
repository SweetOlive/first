package com.springtest.springboot.service;

import com.springtest.springboot.po.StorageIncoming;
import com.springtest.springboot.util.page.PageList;

public interface StorageIncomingService {

    public PageList<StorageIncoming> findPage(StorageIncoming storageIncoming, String receivingCode,Integer pageNum, Integer pageSize);

    public StorageIncoming findById(Integer id);

    public int add(StorageIncoming storageIncoming);

    public  int update(StorageIncoming  storageIncoming);

    public  int  delete(Integer id);

    public StorageIncoming findByReceivingIdAndAPStatus(Integer reId);
}
