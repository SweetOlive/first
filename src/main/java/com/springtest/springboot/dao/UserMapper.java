package com.springtest.springboot.dao;

import com.springtest.springboot.po.UserDomain;

import java.util.List;

public interface UserMapper {

    int insert(UserDomain record);

    List<UserDomain> selectUsers();

    List<UserDomain> selectAll();
}
