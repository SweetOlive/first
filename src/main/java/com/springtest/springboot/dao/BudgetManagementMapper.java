package com.springtest.springboot.dao;

import com.springtest.springboot.po.BudgetManagement;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface BudgetManagementMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(BudgetManagement record);

    int insertSelective(BudgetManagement record);

    BudgetManagement selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(BudgetManagement record);

    int updateByPrimaryKey(BudgetManagement record);

    List<BudgetManagement> findAll(@Param("param")BudgetManagement budgetManagement);

}