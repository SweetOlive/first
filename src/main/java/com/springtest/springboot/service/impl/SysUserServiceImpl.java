package com.springtest.springboot.service.impl;

import com.springtest.springboot.dao.SysUserMapper;
import com.springtest.springboot.po.SysUser;
import com.springtest.springboot.service.SysUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service(value = "SysUserService")
public class SysUserServiceImpl implements SysUserService {
    @Autowired
    private SysUserMapper sysUserMapper;

    @Override
    public SysUser findByAccountNumber(String number){
        return sysUserMapper.findByAccountNumber(number);
    }
}
