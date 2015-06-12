package com.oms.backend.entity;

import java.util.Date;

public class PurchaseItem {
    private Integer purItemId;

    private Date createTime;

    private String createdBy;

    private Date updateTime;

    private String updatedBy;

    private Integer purchaseOrderInqId;

    private Integer materialMaterialId;

    public Integer getPurItemId() {
        return purItemId;
    }

    public void setPurItemId(Integer purItemId) {
        this.purItemId = purItemId;
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

    public Integer getPurchaseOrderInqId() {
        return purchaseOrderInqId;
    }

    public void setPurchaseOrderInqId(Integer purchaseOrderInqId) {
        this.purchaseOrderInqId = purchaseOrderInqId;
    }

    public Integer getMaterialMaterialId() {
        return materialMaterialId;
    }

    public void setMaterialMaterialId(Integer materialMaterialId) {
        this.materialMaterialId = materialMaterialId;
    }
}