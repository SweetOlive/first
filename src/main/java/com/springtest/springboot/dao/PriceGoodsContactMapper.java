package com.springtest.springboot.dao;

import com.springtest.springboot.po.PriceGoodsContact;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface PriceGoodsContactMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(PriceGoodsContact record);

    int insertSelective(PriceGoodsContact record);

    PriceGoodsContact selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(PriceGoodsContact record);

    int updateByPrimaryKey(PriceGoodsContact record);

    PriceGoodsContact findSmallParentId(@Param("catalogId") Integer catalogId);

    List<PriceGoodsContact> findByParentId(@Param("parentId")Integer parentId,@Param("catalogId") Integer catalogId);
}