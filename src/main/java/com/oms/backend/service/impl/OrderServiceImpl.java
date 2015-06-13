package com.oms.backend.service.impl;

import com.oms.backend.entity.Order;
import com.oms.backend.entity.PaginationTableInfo;
import com.oms.backend.mapper.OrderMapper;
import com.oms.backend.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 庆峰 on 2015/6/13.
 */
@Service
public class OrderServiceImpl implements OrderService{

    @Autowired
    private OrderMapper orderMapper;

    @Override
    public int deleteOrderById(String orderId) {
        return orderMapper.deleteOrderById(orderId);
    }

    @Override
    public int updateOrderById(Order order) {
        return orderMapper.updateOrderById(order);
    }

    @Override
    public int insertOrder(Order order) {
        return orderMapper.insertOrder(order);
    }

    @Override
    public List<Order> getList(PaginationTableInfo pti) {
        return orderMapper.getList(pti);
    }

    @Override
    public Integer getTotalCount(PaginationTableInfo pti) {
        return orderMapper.getTotalCount(pti);
    }
}
