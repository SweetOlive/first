package com.springtest.springboot.service.impl;

import com.springtest.springboot.dao.SysDepartmentMapper;
import com.springtest.springboot.po.SysDepartment;
import com.springtest.springboot.service.SysDepartmentService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service(value = "sysDepartmentService")
public class SysDepartmentServiceImpl  implements SysDepartmentService {

    @Autowired
    private SysDepartmentMapper sysDepartmentMapper;

    @Override
    public JSONArray findAllByTree(Integer parentId){
        JSONArray jsonArray = new JSONArray();
        List<SysDepartment> sysDepartmentList = sysDepartmentMapper.findByParentId(parentId);
        if (sysDepartmentList != null && sysDepartmentList.size() > 0){
            for (SysDepartment sysDepartment : sysDepartmentList){
                setJsonByPermission(sysDepartment,jsonArray);
            }
        }
        return jsonArray;
    }

    private void setJsonByPermission(SysDepartment sysDepartment, JSONArray jsonArray){
        JSONObject jsonObject = new JSONObject();
        String text = null;
        text=sysDepartment.getName();
        jsonObject.put("id",sysDepartment.getId());
        jsonObject.put("text",text);
        jsonObject.put("sum",sysDepartment.getSum());
        if (sysDepartment.getParentId().intValue()==-1){
            jsonObject.put("type", "root");
        }
        JSONArray itemJsonArray = this.findAllByTree(sysDepartment.getId());
        if(itemJsonArray.size()>0){
            jsonObject.put("type", "item");
        }else{
            jsonObject.put("type", "default");
        }
        jsonObject.put("children",itemJsonArray);
        jsonArray.add(jsonObject);
    }

    @Override
    public SysDepartment findById(Integer id){
        return  sysDepartmentMapper.selectByPrimaryKey(id);
    }

    @Override
    public int add(SysDepartment sysDepartment){
        return sysDepartmentMapper.insert(sysDepartment);
    }

    @Override
    public int update(SysDepartment sysDepartment){
        return sysDepartmentMapper.updateByPrimaryKeySelective(sysDepartment);
    }

    @Override
    public int delete(Integer id){
        return  sysDepartmentMapper.deleteByPrimaryKey(id);
    }


    @Override
    public List<SysDepartment> findAll(){
        return sysDepartmentMapper.findAll();
    }
}
