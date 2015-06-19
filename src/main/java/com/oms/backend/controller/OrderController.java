package com.oms.backend.controller;

import com.oms.backend.entity.Order;
import com.oms.backend.entity.PaginationTableInfo;
import com.oms.backend.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("orders")
public class OrderController {

    @Autowired
    private OrderService orderService;

    @RequestMapping(value = "/view/main", method = RequestMethod.GET)
    public String viewMain() {
        ModelAndView mv = new ModelAndView();
        return "order_main";
    }

    @RequestMapping(value = "/view/modify/{orderId}", method = RequestMethod.GET)
    public ModelAndView viewModify(@PathVariable("orderId") String orderId) {
        HashMap<String, Object> detailMap = orderService.getOrderDetail(orderId);
        ModelAndView mv = new ModelAndView("order_modify");
        mv.addObject("orderDetail", detailMap);
        return mv;
    }

    @RequestMapping(value = "/view/add", method = RequestMethod.GET)
    public ModelAndView viewAdd() {
        ModelAndView mv = new ModelAndView("order_add");
        return mv;
    }

    @RequestMapping(value = "", method = RequestMethod.POST)
    @ResponseBody
    public String addOrder(@RequestBody Order order) {
        order.setCreatedBy("system");
        int respRow = orderService.insertOrder(order);
        return "add successfully!";
    }

    @RequestMapping(value = "/{orderId}", method = RequestMethod.PUT)
    @ResponseBody
    public String updateOrder(@RequestBody Order order, @PathVariable("orderId") String orderId) {
        order.setOrderId(orderId);
        int respRow = orderService.updateOrderById(order);
        return "update successfully";
    }

    @RequestMapping(value = "/{orderId}", method = RequestMethod.DELETE)
    public
    @ResponseBody
    String deleteOrder(@PathVariable("orderId") String orderId) {
        String res = "success";
        orderService.deleteOrderById(orderId);
        return res;

    }

    @RequestMapping(value = "", method = RequestMethod.GET)
    public
    @ResponseBody
    Map<String, Object> getOrderList(PaginationTableInfo pti) {

        Map<String, Object> result = new HashMap<String, Object>();
        int total = orderService.getTotalCount(pti);
        List<Order> orderList = orderService.getList(pti);
        result.put("total", total);
        result.put("rows", orderList);
        return result;
    }

    @RequestMapping(value = "/goods", method = RequestMethod.GET)
    public
    @ResponseBody
    Map<String, Object> getGoodsList(Integer page, Integer rows) {
        List<Map<String, Object>> orderList = new ArrayList<Map<String, Object>>();
        Map<String, Object> result = new HashMap<String, Object>();
        for (int i = 0; i < 5; i++) {
            Map<String, Object> order1 = new HashMap<String, Object>();
            order1.put("goodsId", i + 1);
            order1.put("goodsName", "goods_" + (i + 1));
            order1.put("goodsType", "40g*150");
            order1.put("goodsDep", "袋");
            order1.put("computerDep", "袋");
            order1.put("price", 10);
            order1.put("rate", 1.1);
            result.put("total", 50);
            orderList.add(order1);
        }
        result.put("rows", orderList);
        return result;
    }
}
