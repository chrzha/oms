package com.oms.backend.service;

import com.oms.backend.entity.Order;
import com.oms.backend.entity.PaginationTableInfo;

import java.util.List;

/**
 * Created by 庆峰 on 2015/6/13.
 */
public interface OrderService {

    public int deleteOrderById(String orderId);
    public int updateOrderById(Order order);
    public int insertOrder(Order order);
    public List<Order> getList(PaginationTableInfo pti);
    public Integer getTotalCount(PaginationTableInfo pti);

}
