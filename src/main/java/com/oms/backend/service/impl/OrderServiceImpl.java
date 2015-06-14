package com.oms.backend.service.impl;

import com.oms.backend.entity.Order;
import com.oms.backend.entity.PaginationTableInfo;
import com.oms.backend.mapper.OrderMapper;
import com.oms.backend.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 庆峰 on 2015/6/13.
 */
@Service
public class OrderServiceImpl implements OrderService{

    @Autowired
    private OrderMapper orderMapper;

    @Override
    public void deleteOrderById(String orderId) {
        orderMapper.deleteOrderById(orderId);
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
        Map<String, Object> paramsMap = new HashMap<String,Object>();
        int offset = (pti.getPage()-1)*pti.getRows();
        paramsMap.put("page",offset);
        paramsMap.put("rows",pti.getRows());
        paramsMap.put("orderStatus",pti.getOrderStatus());
        if (null != pti.getOrderId()){
            paramsMap.put("orderId","%"+pti.getOrderId()+"%");
        }else {
            paramsMap.put("orderId",null);
        }

        if (null != pti.getCreatedBy()){
            paramsMap.put("createdBy","%"+pti.getCreatedBy()+"%");
        }else {
            paramsMap.put("createdBy",null);
        }
        paramsMap.put("createdTime",pti.getCreatedTime());
        return orderMapper.getList(paramsMap);
    }

    @Override
    public Integer getTotalCount(PaginationTableInfo pti) {
        Map<String, Object> paramsMap = new HashMap<String,Object>();
        int offset = (pti.getPage()-1)*pti.getRows();
        paramsMap.put("page",offset);
        paramsMap.put("rows",pti.getRows());
        paramsMap.put("orderStatus",pti.getOrderStatus());
        if (null != pti.getOrderId()){
            paramsMap.put("orderId","%"+pti.getOrderId()+"%");
        }else {
            paramsMap.put("orderId",null);
        }

        if (null != pti.getCreatedBy()){
            paramsMap.put("createdBy","%"+pti.getCreatedBy()+"%");
        }else {
            paramsMap.put("createdBy",null);
        }
        paramsMap.put("createdTime",pti.getCreatedTime());
        return orderMapper.getTotalCount(paramsMap);
    }
}
