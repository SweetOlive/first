package com.springtest.springboot.service;

import com.springtest.springboot.po.PriceGoodsContact;

import java.util.List;

public interface PriceGoodsContactService {

    //查找出指定物资目录最小parentId的物资实体
    public PriceGoodsContact findSmallParentId(Integer catalogId);

    //根据目录id查找底下所有物资list
    public List<PriceGoodsContact> findAllByCatalogId(Integer catalogId);

    public PriceGoodsContact findByCode(String code);

    public PriceGoodsContact findById(Integer id);

    public int add(PriceGoodsContact priceGoodsContact);

    public int update(PriceGoodsContact priceGoodsContact);

    public int detele (Integer id);



}
