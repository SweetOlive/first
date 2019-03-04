package com.springtest.springboot.service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import com.springtest.springboot.Constants;
import com.springtest.springboot.dao.SysPermissionMapper;
import com.springtest.springboot.po.SysPermission;
import com.springtest.springboot.service.SysPermissionService;
import com.springtest.springboot.util.page.PageList;
import com.springtest.springboot.util.page.Paginator;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Service(value = "sysPermissionService")
public class SysPermissionServiceImpl implements SysPermissionService {

    @Autowired
    private SysPermissionMapper sysPermissionMapper;

    @Override
    public JSONArray findAllByTree(Integer parentId){
        JSONArray jsonArray = new JSONArray();
        List<SysPermission> sysPermissionList = sysPermissionMapper.findByParentId(parentId);
        if (sysPermissionList != null && sysPermissionList.size() > 0){
            for (SysPermission sysPermission : sysPermissionList){
                setJsonByPermission(sysPermission,jsonArray);
            }
        }
        return jsonArray;
    }

    private void setJsonByPermission(SysPermission sysPermission, JSONArray jsonArray){
        JSONObject jsonObject = new JSONObject();
        String text = null;
        text=sysPermission.getName();
        jsonObject.put("id",sysPermission.getId());
        jsonObject.put("text",text);
        if (sysPermission.getParentId().intValue()==-1){
            jsonObject.put("type", "root");
        }
        JSONArray itemJsonArray = this.findAllByTree(sysPermission.getId());
        if(itemJsonArray.size()>0){
            jsonObject.put("type", "item");
        }else{
            jsonObject.put("type", "default");
        }
        jsonObject.put("children",itemJsonArray);
        jsonArray.add(jsonObject);
    }

    @Override
    public PageList<SysPermission> findPage(SysPermission sysPermission, Integer pageNum, Integer pageSize){
        Page<Object> result = PageHelper.startPage(pageNum,pageSize);
        List<SysPermission> list = sysPermissionMapper.findAll(sysPermission);
        Paginator paginator = new Paginator(pageNum, pageSize, (int)result.getTotal());
        PageList<SysPermission> pageList = new PageList<SysPermission>(paginator);
        pageList.setData(list);
        return pageList;
    }

    @Override
    public SysPermission findById(Integer id){
        return sysPermissionMapper.selectByPrimaryKey(id);
    }

    @Override
    public int add(SysPermission sysPermission){
        return sysPermissionMapper.insert(sysPermission);
    }

    @Override
    public  int update(SysPermission  sysPermission){
        return sysPermissionMapper.updateByPrimaryKeySelective(sysPermission);
    }

    @Override
    public  int  delete(Integer id){
        return sysPermissionMapper.deleteByPrimaryKey(id);
    }

    @Override
    public SysPermission findByNameParentId(String name,Integer parentId){
        return sysPermissionMapper.findByNameParentId(name,parentId);
    }

    @Override
    public SysPermission findByCode(String code){
        return sysPermissionMapper.findByCode(code);
    }

    @Override
    public List<SysPermission> findByRoleId(Integer roleId){
        return sysPermissionMapper.findByRoleId(roleId);
    }

    @SuppressWarnings("unchecked")
    @Override
    public Set<String> getCurrentUserPermissions(HttpSession session) throws Exception {
        Set<String> result = new HashSet<String>();
        Object obj = session.getAttribute(Constants.ABT_CURRENT_USER_PERMISSION);
        if (obj != null && (obj instanceof Set)) {
            result = (Set<String>) obj;
        }
        return result;
    }
}
