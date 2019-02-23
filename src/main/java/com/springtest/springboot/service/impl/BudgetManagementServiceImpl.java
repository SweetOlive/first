package com.springtest.springboot.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.springtest.springboot.dao.BudgetManagementMapper;
import com.springtest.springboot.po.BudgetManagement;
import com.springtest.springboot.service.BudgetManagementService;
import com.springtest.springboot.util.page.PageList;
import com.springtest.springboot.util.page.Paginator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service(value = "budgetManagementService")
public class BudgetManagementServiceImpl implements BudgetManagementService {

    @Autowired
    private BudgetManagementMapper budgetManagementMapper;

    @Override
    public PageList<BudgetManagement> findPage(BudgetManagement budgetManagement, Integer pageNum, Integer pageSize){
        Page<Object> result = PageHelper.startPage(pageNum,pageSize);
        List<BudgetManagement> list = budgetManagementMapper.findAll(budgetManagement);
        Paginator paginator = new Paginator(pageNum, pageSize, (int)result.getTotal());
        PageList<BudgetManagement> pageList = new PageList<BudgetManagement>(paginator);
        pageList.setData(list);
        return pageList;
    }

    @Override
    public BudgetManagement findById(Integer id){
        return budgetManagementMapper.selectByPrimaryKey(id);
    }

    @Override
    public int add(BudgetManagement budgetManagement){
        return budgetManagementMapper.insert(budgetManagement);
    }

    @Override
    public  int update(BudgetManagement  budgetManagement){
        return budgetManagementMapper.updateByPrimaryKeySelective(budgetManagement);
    }

    @Override
    public  int  delete(Integer id){
        return budgetManagementMapper.deleteByPrimaryKey(id);
    }
}
