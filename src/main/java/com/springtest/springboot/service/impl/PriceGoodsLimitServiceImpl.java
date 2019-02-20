package com.springtest.springboot.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.springtest.springboot.dao.PriceGoodsLimitMapper;
import com.springtest.springboot.po.PriceGoodsLimit;
import com.springtest.springboot.service.PriceGoodsLimitService;
import com.springtest.springboot.util.page.PageList;
import com.springtest.springboot.util.page.Paginator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.xml.ws.Action;
import java.util.List;

@Service(value = "priceGoodsLimitService")
public class PriceGoodsLimitServiceImpl implements PriceGoodsLimitService {

    @Autowired
    private PriceGoodsLimitMapper priceGoodsLimitMapper;

    @Override
    public PageList<PriceGoodsLimit> findPage(PriceGoodsLimit priceGoodsLimit, String goodsName,Integer pageNum, Integer pageSize){
        Page<Object> result = PageHelper.startPage(pageNum,pageSize);
        List<PriceGoodsLimit> list = priceGoodsLimitMapper.findAll(priceGoodsLimit,goodsName);
        Paginator paginator = new Paginator(pageNum, pageSize, (int)result.getTotal());
        PageList<PriceGoodsLimit> pageList = new PageList<PriceGoodsLimit>(paginator);
        pageList.setData(list);
        return pageList;
    }

    @Override
    public int add(PriceGoodsLimit priceGoodsLimit){
        return priceGoodsLimitMapper.insert(priceGoodsLimit);
    }

    @Override
    public int update(PriceGoodsLimit priceGoodsLimit){
        return priceGoodsLimitMapper.updateByPrimaryKeySelective(priceGoodsLimit);
    }

    @Override
    public int delete(Integer id){
        return priceGoodsLimitMapper.deleteByPrimaryKey(id);
    }

    @Override
    public PriceGoodsLimit findById(Integer id){
        return priceGoodsLimitMapper.selectByPrimaryKey(id);
    }
}
