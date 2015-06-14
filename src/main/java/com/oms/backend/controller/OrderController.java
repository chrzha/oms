package com.oms.backend.controller;

import com.oms.backend.entity.Order;
import com.oms.backend.entity.PaginationTableInfo;
import com.oms.backend.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("order")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @RequestMapping(value = "/view/main", method = RequestMethod.GET)
    public String viewMain() {
        return "order_main";
    }

    @RequestMapping("/list")
    public @ResponseBody
    Map<String,Object> getOrderList(PaginationTableInfo pti){
        Map<String, Object> result = new HashMap<String, Object>();
        int total  = orderService.getTotalCount(pti);
        List<Order> orderList = orderService.getList(pti);
        result.put("total", total);
        result.put("rows",orderList);
        return result;
    }

    @RequestMapping("/delete/{orderId}")
    public @ResponseBody
    String delete(@PathVariable("orderId")String orderId){
        String res = "success";
        orderService.deleteOrderById(orderId);
        return res;
    }
}
