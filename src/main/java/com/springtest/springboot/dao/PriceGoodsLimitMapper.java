package com.springtest.springboot.dao;

import com.springtest.springboot.po.PriceGoodsLimit;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PriceGoodsLimitMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(PriceGoodsLimit record);

    int insertSelective(PriceGoodsLimit record);

    PriceGoodsLimit selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(PriceGoodsLimit record);

    int updateByPrimaryKey(PriceGoodsLimit record);

    List<PriceGoodsLimit> findAll(@Param("param")PriceGoodsLimit priceGoodsLimit,@Param("goodsName")String goodsName);
}