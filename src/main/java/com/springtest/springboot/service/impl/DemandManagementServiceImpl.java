package com.springtest.springboot.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.springtest.springboot.dao.DemandManagementMapper;
import com.springtest.springboot.po.DemandManagement;
import com.springtest.springboot.service.DemandManagementService;
import com.springtest.springboot.util.page.PageList;
import com.springtest.springboot.util.page.Paginator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service(value = "/demandManagementService")
public class DemandManagementServiceImpl implements DemandManagementService {

    @Autowired
    private DemandManagementMapper demandManagementMapper;

    @Override
    public PageList<DemandManagement> findPage(DemandManagement demandManagement, Integer pageNum, Integer pageSize){
        Page<Object> result = PageHelper.startPage(pageNum,pageSize);
        List<DemandManagement> list = demandManagementMapper.findAll(demandManagement);
        Paginator paginator = new Paginator(pageNum, pageSize, (int)result.getTotal());
        PageList<DemandManagement> pageList = new PageList<DemandManagement>(paginator);
        pageList.setData(list);
        return pageList;
    }

    @Override
    public DemandManagement findById(Integer id){
        return demandManagementMapper.selectByPrimaryKey(id);
    }

    @Override
    public int add(DemandManagement budgetManagement){
        return demandManagementMapper.insert(budgetManagement);
    }

    @Override
    public  int update(DemandManagement  budgetManagement){
        return demandManagementMapper.updateByPrimaryKeySelective(budgetManagement);
    }

    @Override
    public  int  delete(Integer id){
        return demandManagementMapper.deleteByPrimaryKey(id);
    }
}
