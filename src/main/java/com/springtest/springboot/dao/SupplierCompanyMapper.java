package com.springtest.springboot.dao;

import com.springtest.springboot.po.SupplierCompany;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface SupplierCompanyMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SupplierCompany record);

    int insertSelective(SupplierCompany record);

    SupplierCompany selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SupplierCompany record);

    int updateByPrimaryKey(SupplierCompany record);

    List<SupplierCompany> findAllWithOutSA(@Param("param") SupplierCompany supplierCompany);

    List<SupplierCompany> findAllWithSA(@Param("param") SupplierCompany supplierCompany);
}