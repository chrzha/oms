package com.oms.backend.entity;

import java.util.Date;

/**
 * Created by 庆峰 on 2015/6/13.
 */
public class Order {

    private String orderId;
    private Integer orderStatus;
    private String orderComment;
    private Integer buyerId;
    private Integer supplierId;
    private Integer payTypeId;
    private Integer getDeptmtId;
    private Integer buyDeptmtId;
    private String orderAddress;
    private String getReason;
    private Date buyTime;
    private Date getTime;
    private Date outTime;
    private Date createdTime;
    private String createdBy;
    private Date updatedTime;
    private String updatedBy;

    public String getOrderAddress() {
        return orderAddress;
    }

    public void setOrderAddress(String orderAddress) {
        this.orderAddress = orderAddress;
    }

    public String getGetReason() {
        return getReason;
    }

    public void setGetReason(String getReason) {
        this.getReason = getReason;
    }

    public Date getBuyTime() {
        return buyTime;
    }

    public void setBuyTime(Date buyTime) {
        this.buyTime = buyTime;
    }

    public Date getGetTime() {
        return getTime;
    }

    public void setGetTime(Date getTime) {
        this.getTime = getTime;
    }

    public Date getOutTime() {
        return outTime;
    }

    public void setOutTime(Date outTime) {
        this.outTime = outTime;
    }

    public Integer getGetDeptmtId() {
        return getDeptmtId;
    }

    public void setGetDeptmtId(Integer getDeptmtId) {
        this.getDeptmtId = getDeptmtId;
    }

    public Integer getBuyDeptmtId() {
        return buyDeptmtId;
    }

    public void setBuyDeptmtId(Integer buyDeptmtId) {
        this.buyDeptmtId = buyDeptmtId;
    }

    public Integer getPayTypeId() {
        return payTypeId;
    }

    public void setPayTypeId(Integer payTypeId) {
        this.payTypeId = payTypeId;
    }

    public Integer getBuyerId() {
        return buyerId;
    }

    public void setBuyerId(Integer buyerId) {
        this.buyerId = buyerId;
    }

    public Integer getSupplierId() {
        return supplierId;
    }

    public void setSupplierId(Integer supplierId) {
        this.supplierId = supplierId;
    }

    public String getOrderId() {
        return orderId;
    }

    public void setOrderId(String orderId) {
        this.orderId = orderId;
    }

    public Integer getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(Integer orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getOrderComment() {
        return orderComment;
    }

    public void setOrderComment(String orderComment) {
        this.orderComment = orderComment;
    }

    public Date getCreatedTime() {
        return createdTime;
    }

    public void setCreatedTime(Date createdTime) {
        this.createdTime = createdTime;
    }

    public String getCreatedBy() {
        return createdBy;
    }

    public void setCreatedBy(String createdBy) {
        this.createdBy = createdBy;
    }

    public Date getUpdatedTime() {
        return updatedTime;
    }

    public void setUpdatedTime(Date updatedTime) {
        this.updatedTime = updatedTime;
    }

    public String getUpdatedBy() {
        return updatedBy;
    }

    public void setUpdatedBy(String updatedBy) {
        this.updatedBy = updatedBy;
    }
}
