package com.springtest.springboot.dao;

import com.springtest.springboot.po.PurchaseReceiving;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PurchaseReceivingMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(PurchaseReceiving record);

    int insertSelective(PurchaseReceiving record);

    PurchaseReceiving selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(PurchaseReceiving record);

    int updateByPrimaryKey(PurchaseReceiving record);

    List<PurchaseReceiving> findAll(@Param("param")PurchaseReceiving purchaseReceiving,@Param("orderName") String orderName);
}