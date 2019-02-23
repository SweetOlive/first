package com.springtest.springboot.service;

import com.springtest.springboot.po.DemandManagement;
import com.springtest.springboot.util.page.PageList;

public interface DemandManagementService {

    public PageList<DemandManagement> findPage(DemandManagement demandManagement,Integer pageNum,Integer pageSize);

    public DemandManagement findById(Integer id);

    public int add(DemandManagement demandManagement);

    public  int update(DemandManagement  demandManagement);

    public  int  delete(Integer id);
}
