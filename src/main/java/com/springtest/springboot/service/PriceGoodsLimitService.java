package com.springtest.springboot.service;

import com.springtest.springboot.po.PriceGoodsLimit;
import com.springtest.springboot.util.page.PageList;

public interface PriceGoodsLimitService {

    public  PageList<PriceGoodsLimit>  findPage(PriceGoodsLimit priceGoodsLimit,String goodsName,Integer pageNum,Integer pageSize);

    public int add(PriceGoodsLimit priceGoodsLimit);

    public int update(PriceGoodsLimit priceGoodsLimit);

    public int delete(Integer id);

    public PriceGoodsLimit findById(Integer id);
}
