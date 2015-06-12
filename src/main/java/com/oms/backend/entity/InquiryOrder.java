package com.oms.backend.entity;

import java.util.Date;

public class InquiryOrder {
    private Integer inqId;

    private Integer requesterId;

    private Integer buyerId;

    private Date quoteDeadline;

    private Date estimatedAog;

    private Date createTime;

    private String createdBy;

    private Date updateTime;

    private String updatedBy;

    private byte[] attachment;

    public Integer getInqId() {
        return inqId;
    }

    public void setInqId(Integer inqId) {
        this.inqId = inqId;
    }

    public Integer getRequesterId() {
        return requesterId;
    }

    public void setRequesterId(Integer requesterId) {
        this.requesterId = requesterId;
    }

    public Integer getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(Integer buyerId) {
        this.buyerId = buyerId;
    }

    public Date getQuoteDeadline() {
        return quoteDeadline;
    }

    public void setQuoteDeadline(Date quoteDeadline) {
        this.quoteDeadline = quoteDeadline;
    }

    public Date getEstimatedAog() {
        return estimatedAog;
    }

    public void setEstimatedAog(Date estimatedAog) {
        this.estimatedAog = estimatedAog;
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

    public byte[] getAttachment() {
        return attachment;
    }

    public void setAttachment(byte[] attachment) {
        this.attachment = attachment;
    }
}