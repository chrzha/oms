package com.oms.backend.controller;

import org.springframework.stereotype.Controller;
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

    @RequestMapping(value = "/view/main", method = RequestMethod.GET)
    public String viewMain() {
        return "order_main";
    }

    @RequestMapping("/list")
    public @ResponseBody
    Map<String,Object> getOrderList(Integer page, Integer rows){
        List<Map<String, Object>> orderList = new ArrayList<Map<String, Object>>();
        Map<String, Object> result = new HashMap<String, Object>();
        Map<String, Object> order1 = new HashMap<String, Object>();
        order1.put("id","1");
        order1.put("orderId","5679677");
        order1.put("status","OK");
        order1.put("createdBy","chrzha");
        for(int i=0;i<rows;i++){
            orderList.add(order1);
        }
        result.put("total", 50);
        result.put("rows",orderList);
        return result;
    }
}
