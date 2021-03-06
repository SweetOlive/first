package com.springtest.springboot.service.impl;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.springtest.springboot.dao.HelloMapper;
import com.springtest.springboot.dao.UserMapper;
import com.springtest.springboot.po.Hello;
import com.springtest.springboot.po.UserDomain;
import com.springtest.springboot.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
@Service(value = "userService")
public class UserServiceImpl implements UserService {

    @Autowired
    private UserMapper userMapper;//这里会报错，但是并不会影响

    @Autowired
    private HelloMapper helloMapper;

    @Override
    public int addUser(UserDomain user) {

        return userMapper.insert(user);
    }

    /*
     * 这个方法中用到了我们开头配置依赖的分页插件pagehelper
     * 很简单，只需要在service层传入参数，然后将参数传递给一个插件的一个静态方法即可；
     * pageNum 开始页数
     * pageSize 每页显示的数据条数
     * */
    @Override
    public PageInfo<UserDomain> findAllUser(int pageNum, int pageSize) {
        //将参数传给这个方法就可以实现物理分页了，非常简单。
        PageHelper.startPage(pageNum, pageSize);
        List<UserDomain> userDomains = userMapper.selectUsers();
        PageInfo result = new PageInfo(userDomains);
        return result;
    }

    @Override
    public List<UserDomain> findAll(){
        return userMapper.selectAll();
    }

    @Override
    public int add(Hello hello){
        return  helloMapper.insert(hello);
    }
}