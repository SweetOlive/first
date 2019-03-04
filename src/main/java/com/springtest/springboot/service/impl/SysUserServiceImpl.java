package com.springtest.springboot.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.springtest.springboot.BaseException;
import com.springtest.springboot.Constants;
import com.springtest.springboot.dao.SysUserMapper;
import com.springtest.springboot.po.SysUser;
import com.springtest.springboot.service.SysUserService;
import com.springtest.springboot.util.page.PageList;
import com.springtest.springboot.util.page.Paginator;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;
@Service(value = "sysUserService")
public class SysUserServiceImpl implements SysUserService {

    @Autowired
    private SysUserMapper sysUserMapper;

    @Override
    public SysUser findByAccountNumber(String number){
        return sysUserMapper.findByAccountNumber(number);
    }

    @Override
    public PageList<SysUser> findAll(SysUser sysUser,Integer pageNum, Integer pageSize){
        Page<Object> result = PageHelper.startPage(pageNum,pageSize);
        List<SysUser> list = sysUserMapper.findAll(sysUser);
        Paginator paginator = new Paginator(pageNum, pageSize, (int)result.getTotal());
        PageList<SysUser> pageList = new PageList<SysUser>(paginator);
        pageList.setData(list);
        return pageList;
    }

    @Override
    public  int add(SysUser sysUser){
        return  sysUserMapper.insert(sysUser);
    }

    @Override
    public SysUser findById(Integer id){
        return sysUserMapper.selectByPrimaryKey(id);
    }

    @Override
    public int update(SysUser sysUser){
        return sysUserMapper.updateByPrimaryKeySelective(sysUser);
    }

    @Override
    public int delete(Integer id){
        return  sysUserMapper.deleteByPrimaryKey(id);
    }

    @Override
    public SysUser getCurrentUser(HttpSession session) throws Exception{
        Object object = session.getAttribute(Constants.ABT_CURRENT_USER);
        if (object == null && !(object instanceof SysUser)) {
            throw new BaseException("0022");
        }
        return (SysUser) object;
    }
}
