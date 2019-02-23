package com.springtest.springboot.dao;

import com.springtest.springboot.po.DemandManagement;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface DemandManagementMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(DemandManagement record);

    int insertSelective(DemandManagement record);

    DemandManagement selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(DemandManagement record);

    int updateByPrimaryKey(DemandManagement record);

    List<DemandManagement> findAll(@Param("param")DemandManagement demandManagement);
}