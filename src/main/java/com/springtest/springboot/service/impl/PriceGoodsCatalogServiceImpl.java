package com.springtest.springboot.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.springtest.springboot.dao.PriceGoodsCatalogMapper;
import com.springtest.springboot.dao.PriceGoodsContactMapper;
import com.springtest.springboot.po.PriceGoodsCatalog;
import com.springtest.springboot.po.PriceGoodsContact;
import com.springtest.springboot.service.PriceGoodsCatalogService;
import com.springtest.springboot.util.page.PageList;
import com.springtest.springboot.util.page.Paginator;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service(value = "priceGoodsCatalogService")
public class PriceGoodsCatalogServiceImpl implements PriceGoodsCatalogService {

    @Autowired
    private PriceGoodsCatalogMapper priceGoodsCatalogMapper;

    @Autowired
    private PriceGoodsContactMapper priceGoodsContactMapper;

    @Override
    public PageList<PriceGoodsCatalog> findAllPage(PriceGoodsCatalog priceGoodsCatalog, Integer pageNum, Integer pageSize) {
        Page<Object> result = PageHelper.startPage(pageNum,pageSize);
        List<PriceGoodsCatalog> list = priceGoodsCatalogMapper.findAll(priceGoodsCatalog);
        Paginator paginator = new Paginator(pageNum, pageSize, (int)result.getTotal());
        PageList<PriceGoodsCatalog> pageList = new PageList<PriceGoodsCatalog>(paginator);
        pageList.setData(list);
        return pageList;
    }

    //根据id查询物资目录信息
    @Override
    public PriceGoodsCatalog findById(Integer id){
        return priceGoodsCatalogMapper.selectByPrimaryKey(id);
    }

    //新增物资目录
    @Override
    public int add(PriceGoodsCatalog priceGoodsCatalog){
        return priceGoodsCatalogMapper.insert(priceGoodsCatalog);
    }

    //修改物资目录信息
    @Override
    public int update(PriceGoodsCatalog priceGoodsCatalog){
        return priceGoodsCatalogMapper.updateByPrimaryKeySelective(priceGoodsCatalog);
    }

    //删除目录
    @Override
    public int delete(Integer id){
        return priceGoodsCatalogMapper.deleteByPrimaryKey(id);
    }

    @Override
    public JSONArray findAllByTree(Integer parentId,Integer catalogId){
        JSONArray jsonArray = new JSONArray();
        List<PriceGoodsContact> priceGoodsContactList = priceGoodsContactMapper.findByParentId(parentId,catalogId);
        if (priceGoodsContactList != null && priceGoodsContactList.size() > 0){
            for (PriceGoodsContact priceGoodsContact : priceGoodsContactList){
                setJsonByPermission(parentId,catalogId,priceGoodsContact,jsonArray);
            }
        }
        return jsonArray;
    }

    private void setJsonByPermission(Integer parentId,Integer catalogId,PriceGoodsContact priceGoodsContact, JSONArray jsonArray){
        JSONObject jsonObject = new JSONObject();
        String text = null;
        text=priceGoodsContact.getName();
        jsonObject.put("id",priceGoodsContact.getId());
        jsonObject.put("text",text);
        if (priceGoodsContact.getParentId().intValue()==parentId){
            jsonObject.put("type", "root");
        }
        JSONArray itemJsonArray = this.findAllByTree(priceGoodsContact.getId(),catalogId);
        if(itemJsonArray.size()>0){
            jsonObject.put("type", "item");
        }else{
            jsonObject.put("type", "default");
        }
        jsonObject.put("children",itemJsonArray);
        jsonArray.add(jsonObject);
    }

    @Override
    public PriceGoodsCatalog findByName(String name){
        return priceGoodsCatalogMapper.findByName(name);
    }

    @Override
    public List<PriceGoodsCatalog> findAll(){
        PriceGoodsCatalog priceGoodsCatalog = new PriceGoodsCatalog();
        return priceGoodsCatalogMapper.findAll(priceGoodsCatalog);
    }
}
