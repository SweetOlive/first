package com.springtest.springboot.po;

import javax.persistence.Transient;
import java.util.Date;

public class SysDepartment {

    /**
     * 部门人员总数
     */
    @Transient
    private Integer sum;

    private Integer id;

    private Integer parentId;

    private String name;

    private String introduce;

    private Date createTime;

    private Date upadteTime;

    private Integer createUserId;

    private Integer updateUserId;

    private String remark;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public String getIntroduce() {
        return introduce;
    }

    public void setIntroduce(String introduce) {
        this.introduce = introduce == null ? null : introduce.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpadteTime() {
        return upadteTime;
    }

    public void setUpadteTime(Date upadteTime) {
        this.upadteTime = upadteTime;
    }

    public Integer getCreateUserId() {
        return createUserId;
    }

    public void setCreateUserId(Integer createUserId) {
        this.createUserId = createUserId;
    }

    public Integer getUpdateUserId() {
        return updateUserId;
    }

    public void setUpdateUserId(Integer updateUserId) {
        this.updateUserId = updateUserId;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public  Integer getSum(){
        return  sum;
    }
    public void  setSum(Integer sum){
        this.sum = sum;
    }
}