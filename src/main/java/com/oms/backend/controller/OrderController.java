package com.oms.backend.controller;

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

    @RequestMapping(value = "/view/main", method = RequestMethod.GET)
    public String viewMain() {
        return "order_main";
    }
    @RequestMapping(value = "/view/modify/{orderId}", method = RequestMethod.GET)
    public  ModelAndView viewModify(@PathVariable("orderId")String orderId) {
    	ModelAndView mv = new ModelAndView("order_modify");
        mv.addObject("orderId",orderId);
    	return mv;
    }
    @RequestMapping(value = "/view/add", method = RequestMethod.GET)
    public  ModelAndView viewAdd() {
    	ModelAndView mv = new ModelAndView("order_add");
    	return mv;
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
    @RequestMapping("/update")
    public @ResponseBody
    Map<String,Object> getOrderDetail(Integer page, Integer rows){
    	List<Map<String, Object>> orderList = new ArrayList<Map<String, Object>>();
    	Map<String, Object> result = new HashMap<String, Object>();
    	Map<String, Object> order1 = new HashMap<String, Object>();
    	order1.put("goodsId","1");
    	order1.put("goodsName","5679677");
    	order1.put("goodsType","OK");
    	order1.put("goodsDep","chrzha");
    	order1.put("computerDep","chrzha");
    	order1.put("number","chrzha");
    	order1.put("price","chrzha");
    	order1.put("rate","chrzha");
    	order1.put("money","chrzha");
    	for(int i=0;i<2;i++){
    		orderList.add(order1);
    	}
    	result.put("total", 50);
    	result.put("rows",orderList);
    	return result;
    }
}
