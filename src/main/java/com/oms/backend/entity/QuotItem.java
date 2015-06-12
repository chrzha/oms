package com.oms.backend.entity;

import java.util.Date;

public class QuotItem {
    private Integer quotItemId;

    private Integer quotId;

    private Integer inqItemId;

    private Integer unitPrice;

    private Date createTime;

    private String createdBy;

    private Date updateTime;

    private String updatedBy;

    public Integer getQuotItemId() {
        return quotItemId;
    }

    public void setQuotItemId(Integer quotItemId) {
        this.quotItemId = quotItemId;
    }

    public Integer getQuotId() {
        return quotId;
    }

    public void setQuotId(Integer quotId) {
        this.quotId = quotId;
    }

    public Integer getInqItemId() {
        return inqItemId;
    }

    public void setInqItemId(Integer inqItemId) {
        this.inqItemId = inqItemId;
    }

    public Integer getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(Integer unitPrice) {
        this.unitPrice = unitPrice;
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