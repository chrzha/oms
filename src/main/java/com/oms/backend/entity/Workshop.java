package com.oms.backend.entity;

import java.util.Date;

public class Workshop {
    private Integer workshopId;

    private String workshopCode;

    private String workshopName;

    private Date createTime;

    private String createdBy;

    private Date updateTime;

    private String updatedBy;

    public Integer getWorkshopId() {
        return workshopId;
    }

    public void setWorkshopId(Integer workshopId) {
        this.workshopId = workshopId;
    }

    public String getWorkshopCode() {
        return workshopCode;
    }

    public void setWorkshopCode(String workshopCode) {
        this.workshopCode = workshopCode == null ? null : workshopCode.trim();
    }

    public String getWorkshopName() {
        return workshopName;
    }

    public void setWorkshopName(String workshopName) {
        this.workshopName = workshopName == null ? null : workshopName.trim();
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