package com.oms.backend.entity;

import java.util.Date;

public class MaterialType {
    private Integer matTypeId;

    private String matTypeCode;

    private String matTypeName;

    private Date createTime;

    private String createdBy;

    private Date updateTime;

    private String updatedBy;

    public Integer getMatTypeId() {
        return matTypeId;
    }

    public void setMatTypeId(Integer matTypeId) {
        this.matTypeId = matTypeId;
    }

    public String getMatTypeCode() {
        return matTypeCode;
    }

    public void setMatTypeCode(String matTypeCode) {
        this.matTypeCode = matTypeCode == null ? null : matTypeCode.trim();
    }

    public String getMatTypeName() {
        return matTypeName;
    }

    public void setMatTypeName(String matTypeName) {
        this.matTypeName = matTypeName == null ? null : matTypeName.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy == null ? null : createdBy.trim();
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy == null ? null : updatedBy.trim();
    }
}