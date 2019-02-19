package com.springtest.springboot.service;

import com.springtest.springboot.po.PriceGoodsContact;

public interface PriceGoodsContactService {

    //查找出指定物资目录最小parentId的物资实体
    public PriceGoodsContact findSmallParentId(Integer catalogId);

    public PriceGoodsContact findById(Integer id);

    public int add(PriceGoodsContact priceGoodsContact);

    public int update(PriceGoodsContact priceGoodsContact);

    public int detele (Integer id);



}
