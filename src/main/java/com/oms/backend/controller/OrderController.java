package com.oms.backend.controller;

import com.oms.backend.entity.Order;
import com.oms.backend.entity.PaginationTableInfo;
import com.oms.backend.service.OrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import java.util.*;

@Controller
@RequestMapping("order")
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
        HashMap<String,Object> detailMap = orderService.getOrderDetail(orderId);
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

    @RequestMapping(produces = MediaType.APPLICATION_JSON_VALUE, value = "/{orderId}", method = RequestMethod.PUT)
    @ResponseBody
    public String updateOrder(@RequestBody Order order,@PathVariable("orderId")String orderId) {
        order.setOrderId(orderId);
        int respRow = orderService.updateOrderById(order);
        return "update successfully";
    }

    @RequestMapping(value = "/list", method = RequestMethod.POST)
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

    @RequestMapping("/delete/{orderId}")
    public
    @ResponseBody
    String delete(@PathVariable("orderId") String orderId) {
        String res = "success";
        orderService.deleteOrderById(orderId);
        return res;

    }

    @RequestMapping("/update")
    public
    @ResponseBody
    Map<String, Object> getOrderDetail(Integer page, Integer rows) {
        List<Map<String, Object>> orderList = new ArrayList<Map<String, Object>>();
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> order1 = new HashMap<String, Object>();
        order1.put("goodsId", "1");
        order1.put("goodsName", "5679677");
        order1.put("goodsType", "OK");
        order1.put("goodsDep", "chrzha");
        order1.put("computerDep", "chrzha");
        order1.put("number", 45);
        order1.put("price", 10);
        order1.put("rate", 1.1);
        order1.put("money", 100);
        for (int i = 0; i < 2; i++) {
            orderList.add(order1);
        }
        result.put("total", 50);
        result.put("rows", orderList);
        return result;
    }
}
