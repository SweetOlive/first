package com.springtest.springboot.service;

import com.github.pagehelper.PageInfo;
import com.springtest.springboot.po.Hello;
import com.springtest.springboot.po.UserDomain;

import java.util.List;

public interface UserService {
    int addUser(UserDomain user);

    PageInfo<UserDomain> findAllUser(int pageNum, int pageSize);

    List<UserDomain> findAll();

    public int add(Hello hello);
}
