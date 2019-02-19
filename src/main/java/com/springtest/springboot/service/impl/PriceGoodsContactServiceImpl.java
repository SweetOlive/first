package com.springtest.springboot.service.impl;

import com.springtest.springboot.dao.PriceGoodsContactMapper;
import com.springtest.springboot.po.PriceGoodsContact;
import com.springtest.springboot.service.PriceGoodsContactService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "priceGoodsContactService")
public class PriceGoodsContactServiceImpl implements PriceGoodsContactService {

    @Autowired
    private PriceGoodsContactMapper priceGoodsContactMapper;

    @Override
    public PriceGoodsContact findSmallParentId(Integer catalogId){
        return priceGoodsContactMapper.findSmallParentId(catalogId);
    }

    @Override
    public PriceGoodsContact findById(Integer id){
        return priceGoodsContactMapper.selectByPrimaryKey(id);
    }

    @Override
    public int add(PriceGoodsContact priceGoodsContact){
        return  priceGoodsContactMapper.insert(priceGoodsContact);
    }

    @Override
    public int update(PriceGoodsContact priceGoodsContact){
        return priceGoodsContactMapper.updateByPrimaryKeySelective(priceGoodsContact);
    }

    @Override
    public int detele (Integer id){
        return  priceGoodsContactMapper.deleteByPrimaryKey(id);
    }
}