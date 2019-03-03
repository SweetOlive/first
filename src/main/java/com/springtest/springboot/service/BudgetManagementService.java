package com.springtest.springboot.service;

import com.springtest.springboot.po.BudgetManagement;
import com.springtest.springboot.util.page.PageList;

public interface BudgetManagementService {

    public PageList<BudgetManagement> findPage(BudgetManagement budgetManagement,Integer pageNum,Integer pageSize);

    public BudgetManagement findById(Integer id);

    public int add(BudgetManagement budgetManagement);

    public  int update(BudgetManagement  budgetManagement);

    public  int  delete(Integer id);

    public BudgetManagement findByName(String name);
}
