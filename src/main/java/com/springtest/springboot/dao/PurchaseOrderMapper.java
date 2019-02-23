package com.springtest.springboot.dao;

import com.springtest.springboot.po.PurchaseOrder;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PurchaseOrderMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(PurchaseOrder record);

    int insertSelective(PurchaseOrder record);

    PurchaseOrder selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(PurchaseOrder record);

    int updateByPrimaryKey(PurchaseOrder record);

    List<PurchaseOrder> findAll(@Param("param")PurchaseOrder purchaseOrder);
}