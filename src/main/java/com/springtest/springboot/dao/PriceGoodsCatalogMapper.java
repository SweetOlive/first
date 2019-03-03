package com.springtest.springboot.dao;

import com.springtest.springboot.po.PriceGoodsCatalog;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PriceGoodsCatalogMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(PriceGoodsCatalog record);

    int insertSelective(PriceGoodsCatalog record);

    PriceGoodsCatalog selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(PriceGoodsCatalog record);

    int updateByPrimaryKey(PriceGoodsCatalog record);

    //查找所有的物资目录
    public List<PriceGoodsCatalog> findAll(@Param("param") PriceGoodsCatalog priceGoodsCatalog);

    PriceGoodsCatalog findByName(@Param("name") String name);
}