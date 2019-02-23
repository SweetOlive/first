package com.springtest.springboot.dao;

import com.springtest.springboot.po.PurchaseInquiry;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PurchaseInquiryMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(PurchaseInquiry record);

    int insertSelective(PurchaseInquiry record);

    PurchaseInquiry selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(PurchaseInquiry record);

    int updateByPrimaryKey(PurchaseInquiry record);

    List<PurchaseInquiry> findAll(@Param("param")PurchaseInquiry purchaseInquiry,@Param("companyName")String companyName,@Param("goodsName")String goodsName);

    PurchaseInquiry findByCode(@Param("code") String code);
}