package com.springtest.springboot.service;

import com.springtest.springboot.po.PriceGoodsCatalog;
import com.springtest.springboot.util.page.PageList;
import net.sf.json.JSONArray;

import java.util.List;

public interface PriceGoodsCatalogService {

    //物资目录列表
    public PageList<PriceGoodsCatalog> findAllPage(PriceGoodsCatalog priceGoodsCatalog,Integer pageNum,Integer pageSize) ;

    //根据id查询物资目录信息
    public PriceGoodsCatalog findById(Integer id);

    //新增物资目录
    public int add(PriceGoodsCatalog priceGoodsCatalog);

    //修改物资目录信息
    public int update(PriceGoodsCatalog priceGoodsCatalog);

    //删除目录
    public int delete(Integer id);

    //查询物资目录详情
    public JSONArray findAllByTree(Integer parentId,Integer catalogId);

    public PriceGoodsCatalog findByName(String name);

    public List<PriceGoodsCatalog> findAll();
}
