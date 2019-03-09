package com.springtest.springboot.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.springtest.springboot.dao.SupplierCompanyMapper;
import com.springtest.springboot.po.SupplierCompany;
import com.springtest.springboot.service.SupplierCompanyService;
import com.springtest.springboot.util.page.PageList;
import com.springtest.springboot.util.page.Paginator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service(value = "supplierCompanyService")
public class SupplierCompanyServiceImpl implements SupplierCompanyService {

    @Autowired
    private SupplierCompanyMapper supplierCompanyMapper;

    @Override
    public PageList<SupplierCompany> findPageWithOutSA(SupplierCompany supplierCompany, Integer pageNum, Integer pageSize){
        Page<Object> result = PageHelper.startPage(pageNum,pageSize);
        List<SupplierCompany> list = supplierCompanyMapper.findAllWithOutSA(supplierCompany);
        Paginator paginator = new Paginator(pageNum, pageSize, (int)result.getTotal());
        PageList<SupplierCompany> pageList = new PageList<SupplierCompany>(paginator);
        pageList.setData(list);
        return pageList;
    }

    @Override
    public PageList<SupplierCompany> findPageWithSA(SupplierCompany supplierCompany,Integer pageNum,Integer pageSize){
        Page<Object> result = PageHelper.startPage(pageNum,pageSize);
        List<SupplierCompany> list = supplierCompanyMapper.findAllWithSA(supplierCompany);
        Paginator paginator = new Paginator(pageNum, pageSize, (int)result.getTotal());
        PageList<SupplierCompany> pageList = new PageList<SupplierCompany>(paginator);
        pageList.setData(list);
        return pageList;
    }

    @Override
    public int  add(SupplierCompany supplierCompany){
        return supplierCompanyMapper.insert(supplierCompany);
    }

    @Override
    public int update(SupplierCompany supplierCompany){
        return supplierCompanyMapper.updateByPrimaryKeySelective(supplierCompany);
    }

    @Override
    public int delete(Integer id){
        return supplierCompanyMapper.deleteByPrimaryKey(id);
    }

    @Override
    public SupplierCompany findById(Integer id){
        return supplierCompanyMapper.selectByPrimaryKey(id);
    }

    @Override
    public List<SupplierCompany> findAllWithP(){
        return supplierCompanyMapper.findAllWithP();
    }

    @Override
    public SupplierCompany findByName(String name){
        return supplierCompanyMapper.findByName(name);
    }

    @Override
    public List<SupplierCompany> findByStatusA(){
        return supplierCompanyMapper.findByStatusA();
    }
}
