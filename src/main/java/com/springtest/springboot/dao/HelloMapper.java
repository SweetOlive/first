package com.springtest.springboot.dao;

import com.springtest.springboot.po.Hello;

public interface HelloMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Hello record);

    int insertSelective(Hello record);

    Hello selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Hello record);

    int updateByPrimaryKey(Hello record);
}