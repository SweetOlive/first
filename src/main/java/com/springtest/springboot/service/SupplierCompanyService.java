package com.springtest.springboot.service;

import com.springtest.springboot.po.SupplierCompany;
import com.springtest.springboot.util.page.PageList;

import java.util.List;

public interface SupplierCompanyService {

    //认证状态为通过、作废的
    public PageList<SupplierCompany> findPageWithOutSA(SupplierCompany supplierCompany,Integer pageNum,Integer pageSize);

    //认证状态为审核的
    public PageList<SupplierCompany> findPageWithSA(SupplierCompany supplierCompany,Integer pageNum,Integer pageSize);

    public int  add(SupplierCompany supplierCompany);

    public int update(SupplierCompany supplierCompany);

    public int delete(Integer id);

    public SupplierCompany findById(Integer id);

    public List<SupplierCompany> findAllWithP();

    public SupplierCompany findByName(String name);
}
