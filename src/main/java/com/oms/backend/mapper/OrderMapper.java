package com.oms.backend.mapper;

import com.oms.backend.entity.Order;
import com.oms.backend.entity.PaginationTableInfo;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by 庆峰 on 2015/6/13.
 */
public interface OrderMapper {
    public int deleteOrderById(@Param("orderId")String orderId);
    public int updateOrderById(Order order);
    public int insertOrder(Order order);
    public List<Order> getList(PaginationTableInfo pti);
    public Integer getTotalCount(PaginationTableInfo pti);
}
