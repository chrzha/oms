package com.oms.backend.entity;

import java.util.Date;

public class SupplierRank {
    private Integer supRankId;

    private String supRankCode;

    private String supRankName;

    private Date createTime;

    private String createdBy;

    private Date updateTime;

    private String updatedBy;

    public Integer getSupRankId() {
        return supRankId;
    }

    public void setSupRankId(Integer supRankId) {
        this.supRankId = supRankId;
    }

    public String getSupRankCode() {
        return supRankCode;
    }

    public void setSupRankCode(String supRankCode) {
        this.supRankCode = supRankCode == null ? null : supRankCode.trim();
    }

    public String getSupRankName() {
        return supRankName;
    }

    public void setSupRankName(String supRankName) {
        this.supRankName = supRankName == null ? null : supRankName.trim();
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