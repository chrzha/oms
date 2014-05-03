package com.hotel.backend.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.ws.rs.Path;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hotel.backend.entity.Food;
import com.hotel.backend.entity.Hotel;
import com.hotel.backend.entity.Market;
import com.hotel.backend.entity.View;
import com.hotel.backend.service.HotelFoodService;
import com.hotel.backend.service.HotelMarketService;
import com.hotel.backend.service.HotelService;
import com.hotel.backend.service.HotelViewService;
import com.hotel.backend.service.LHotelFoodService;
import com.hotel.backend.service.LHotelMktService;
import com.hotel.backend.service.LHotelViewService;
import com.hotel.backend.service.LUserRoleService;
import com.hotel.backend.service.UserService;
import com.hotel.backend.service.UserViewService;
import com.hotel.backend.view.UserView;

/**
 * //TODO Description
 * <p>
 * Copyright (c) 2012 Acxiom Corporation. All Rights Reserved.
 * </p>
 * 
 * @author chrzha date: Mar 21, 2014
 *         <p>
 *         Last updated by chrzha date:Mar 21, 2014
 *         </p>
 */
@Controller
@Path("/")
public class IDCController {

	@Autowired
	private UserViewService userViewService;

	@Autowired
	private HotelFoodService hotelFoodService;

	@Autowired
	private HotelMarketService hotelMarketService;

	@Autowired
	private HotelViewService hotelViewService;

	@Autowired
	private UserService userService;

	@Autowired
	private LUserRoleService lUserRoleService;

	@Autowired
	private LHotelViewService lHotelViewService;

	@Autowired
	private LHotelFoodService lHotelFoodService;

	@Autowired
	private LHotelMktService lHotelMktService;

	@Autowired
	private HotelService hotelService;

	@RequestMapping("/idcHome")
	public ModelAndView goIDCHomePage() {

		return new ModelAndView("idcHome");
	}

	@RequestMapping("/adminValidate")
	public ModelAndView goAdminValidatePage() {
		List<UserView> list = userViewService.getUserViewList();
		return new ModelAndView("adminValidate", "list", list);
	}

	@RequestMapping("/hotelsValidate")
	public ModelAndView goHotelsValidatePage() {
		List<Hotel> list = new ArrayList<Hotel>();
		list = hotelService.getHotelList();
		return new ModelAndView("hotelsValidate", "list", list);
	}

	@RequestMapping("/editUser")
	public ModelAndView editUser(String userId) {

		UserView userView = userViewService.getUserViewByUserId(userId);

		return new ModelAndView("editUser", "userView", userView);
	}

	@RequestMapping("/doEditUser")
	public ModelAndView doEditUser(String userId, String status, String roleId) {

		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("status", status);
		map.put("roleId", roleId);

		userViewService.updateUserViewById(map);

		return new ModelAndView("success");
	}

	@RequestMapping("/deleteUser")
	public @ResponseBody
	String deleteUser(String userId) {

		String result = "success";
		userService.deleteUserById(userId);
		lUserRoleService.deleteLink(userId);
		return result;
	}

	// editHotel?hotelId
	@RequestMapping("/editHotel")
	public ModelAndView editHotel(String id) {

		Hotel hotel = hotelService.getHotelById(id);

		return new ModelAndView("editHotel", "hotel", hotel);
	}

	// doEdithotel?id
	@RequestMapping("/doEditHotel")
	public ModelAndView doEditHotel(String id, String status) {

		Map<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("status", status);
		hotelService.validateHotel(map);
		return new ModelAndView("success");
	}

	@RequestMapping("/deleteHotelById")
	public @ResponseBody
	String deleteHotel(String hotelId) {

		String result = "success";
		hotelService.deleteHotelById(hotelId);
		lHotelFoodService.deleteLinkByHotelId(hotelId);
		lHotelMktService.deleteLinkByHotelId(hotelId);
		lHotelViewService.deleteLinkByHotelId(hotelId);
		return result;
	}

	

	@RequestMapping("/mktList")
	public @ResponseBody
	List<Market> mktList(Integer startIndex, Integer pageSize) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startIndex", startIndex);
		map.put("pageSize", pageSize);
		List<Market> list = hotelMarketService.getMarketList(map);
		return list;
	}

	@RequestMapping("/idcMktList")
	public ModelAndView idcMktList() {

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startIndex", 0);
		map.put("pageSize", 10);
		List<Market> list = hotelMarketService.getMarketList(map);

		return new ModelAndView("idcMktList", "list", list);
	}

	@RequestMapping("/idcFoodList")
	public ModelAndView idcFoodList() {

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startIndex", 0);
		map.put("pageSize", 10);
		List<Food> list = hotelFoodService.getFoodList(map);

		return new ModelAndView("idcFoodList", "list", list);
	}
	@RequestMapping("/foodList")
	public @ResponseBody
	List<Food> foodList(Integer startIndex, Integer pageSize) {

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startIndex", startIndex);
		map.put("pageSize", pageSize);
		List<Food> list = hotelFoodService.getFoodList(map);

		return list;
	}


	@RequestMapping("/idcViewList")
	public ModelAndView idcViewList() {

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startIndex", 0);
		map.put("pageSize", 10);
		List<View> list = hotelViewService.getHotelViewList(map);

		return new ModelAndView("idcViewList", "list", list);
	}

	@RequestMapping("/viewList")
	public @ResponseBody
	List<View> viewList(Integer startIndex, Integer pageSize) {

		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("startIndex", startIndex);
		map.put("pageSize", pageSize);

		List<View> list = hotelViewService.getHotelViewList(map);

		return list;
	}
	

}
