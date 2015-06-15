package com.oms.backend.mapper;

import com.oms.backend.entity.Order;
import com.oms.backend.entity.PaginationTableInfo;
import org.apache.ibatis.annotations.Param;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * Created by 庆峰 on 2015/6/13.
 */
public interface OrderMapper {
    public void deleteOrderById(@Param("orderId")String orderId);
    public int updateOrderById(Order order);
    public int insertOrder(Order order);
    public List<Order> getList(Map<String, Object> paramsMap);
    public Integer getTotalCount(Map<String, Object> paramsMap);
    public HashMap<String,Object> getOrderDetail(@Param("orderId")String orderId);
}
