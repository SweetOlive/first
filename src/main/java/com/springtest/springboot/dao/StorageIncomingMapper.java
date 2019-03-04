package com.springtest.springboot.dao;

import com.springtest.springboot.po.StorageIncoming;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface StorageIncomingMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(StorageIncoming record);

    int insertSelective(StorageIncoming record);

    StorageIncoming selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(StorageIncoming record);

    int updateByPrimaryKey(StorageIncoming record);

    List<StorageIncoming> findAll(@Param("param")StorageIncoming storageIncoming,@Param("receivingCode") String receivingCode);

    StorageIncoming findByReceivingIdAndAPStatus(@Param("reId") Integer reId);
}