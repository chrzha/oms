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
import org.springframework.web.servlet.ModelAndView;

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

    @RequestMapping("/list")
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
        order1.put("number", "chrzha");
        order1.put("price", "chrzha");
        order1.put("rate", "chrzha");
        order1.put("money", "chrzha");
        for (int i = 0; i < 2; i++) {
            orderList.add(order1);
        }
        result.put("total", 50);
        result.put("rows", orderList);
        return result;
    }
}
