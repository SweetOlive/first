package com.springtest.springboot.dao;

import com.springtest.springboot.po.StorageSending;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StorageSendingMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(StorageSending record);

    int insertSelective(StorageSending record);

    StorageSending selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(StorageSending record);

    int updateByPrimaryKey(StorageSending record);

    List<StorageSending> findAll(@Param("param")StorageSending storageSending,
                                  @Param("goodsName") String goodsName,
                                  @Param("departmentName")String departmentName);

    List<StorageSending> findByStatus(@Param("status") String status);
}