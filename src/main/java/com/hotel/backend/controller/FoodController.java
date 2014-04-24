package com.hotel.backend.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.Path;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hotel.backend.entity.Food;
 
import com.hotel.backend.service.HotelFoodService;
 
import com.hotel.backend.service.LHotelFoodService;
 
import com.hotel.backend.view.UserView;

@Controller
@Path("/")
public class FoodController {
	
	@Autowired
	private HotelFoodService hotelFoodService;

	@Autowired
	private LHotelFoodService lHotelFoodService;

	@RequestMapping("/deleteFoodById")
	public @ResponseBody
	String deleteFoodById(HttpServletRequest request,
			HttpServletResponse response, String foodId) {

		UserView userView = (UserView) request.getSession()
				.getAttribute("user");

		String hotelId = userView.getHotelId();

		Map<String, String> map = new HashMap<String, String>();

		map.put("hotelId", hotelId);
		map.put("foodId", foodId);

		lHotelFoodService.deleteLink(map);

		hotelFoodService.deleteFoodById(foodId);

		String result = "success";
		return result;
	}
	
	@RequestMapping("/goAddFood")
	public ModelAndView goAddMkt(){
		return new ModelAndView("addFood");
	}

	@RequestMapping("/addFood")
	public @ResponseBody
	String addFood(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("food") Food food) {

		String result = "";

		UserView userView = (UserView) request.getSession()
				.getAttribute("user");

		String hotelId = userView.getHotelId();

		
		int size = hotelFoodService.getFoodListByHotelId(hotelId).size();
		
		String temp = hotelFoodService.getFoodListByHotelId(hotelId).get(size-1).getId();
		
		int total = Integer.parseInt(temp)+1;
		
		String foodId = "";
		if (total < 10) {
			foodId = "000" + total;
		} else if (total >= 10 && total < 100) {
			foodId = "00" + total;
		} else if (total >= 100 && total < 1000) {
			foodId = "0" + total;
		} else {
			foodId = "" + total;
		}

		Map<String, String> map = new HashMap<String, String>();

		map.put("hotelId", hotelId);
		map.put("foodId", foodId);
		food.setId(foodId);
		lHotelFoodService.insertLink(map);
		if (hotelFoodService.addFood(food) > 0) {

			result = "success";
		} else {

			return result = "error";
		}
		return result;
	}

	@RequestMapping("/updateFood")
	public @ResponseBody
	String updateFood(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("food") Food food) {

		String result = "success";
        hotelFoodService.updateFood(food);
		return result;
	}
	
	
	


}
