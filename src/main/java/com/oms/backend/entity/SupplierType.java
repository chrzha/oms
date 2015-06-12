package com.oms.backend.entity;

import java.util.Date;

public class SupplierType {
    private Integer supTypeId;

    private String supTypeCode;

    private String supTypeName;

    private Date createTime;

    private String createdBy;

    private Date updateTime;

    private String updatedBy;

    public Integer getSupTypeId() {
        return supTypeId;
    }

    public void setSupTypeId(Integer supTypeId) {
        this.supTypeId = supTypeId;
    }

    public String getSupTypeCode() {
        return supTypeCode;
    }

    public void setSupTypeCode(String supTypeCode) {
        this.supTypeCode = supTypeCode == null ? null : supTypeCode.trim();
    }

    public String getSupTypeName() {
        return supTypeName;
    }

    public void setSupTypeName(String supTypeName) {
        this.supTypeName = supTypeName == null ? null : supTypeName.trim();
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