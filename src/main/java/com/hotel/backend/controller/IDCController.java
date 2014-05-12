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

import com.hotel.backend.entity.Facilities;
import com.hotel.backend.entity.Food;
import com.hotel.backend.entity.Hotel;
import com.hotel.backend.entity.Market;
import com.hotel.backend.entity.Traffic;
import com.hotel.backend.entity.View;
import com.hotel.backend.service.HotelFacilitiesService;
import com.hotel.backend.service.HotelFoodService;
import com.hotel.backend.service.HotelMarketService;
import com.hotel.backend.service.HotelService;
import com.hotel.backend.service.HotelTrafficService;
import com.hotel.backend.service.HotelViewService;
import com.hotel.backend.service.LHotelFacilitiesService;
import com.hotel.backend.service.LHotelFoodService;
import com.hotel.backend.service.LHotelMktService;
import com.hotel.backend.service.LHotelTrafficService;
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
	private HotelTrafficService hotelTrafficService;
	
	@Autowired
	private HotelFacilitiesService hotelFacilitiesService;

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
	private LHotelFacilitiesService lHotelFacilitiesService;
	
	@Autowired
	private LHotelTrafficService lHotelTrafficService;

	@Autowired
	private HotelService hotelService;
	
	private int page; //当前页,名字必须为page   
	private int rows ; //每页大小,名字必须为rows   

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

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
		lHotelFacilitiesService.deleteLinkByHotelId(hotelId);
		lHotelTrafficService.deleteLinkByHotelId(hotelId);
		return result;
	}

	@RequestMapping("/mktList")
	public @ResponseBody
	Map<String, Object> mktList(Integer page, Integer rows,Map<String, Object> map) {
		Map<String, Integer> mapSearch = new HashMap<String, Integer>();
		mapSearch.put("startIndex", (page-1)*rows);
		mapSearch.put("pageSize", rows);
		List<Market> list = hotelMarketService.getMarketListPaged(mapSearch);
		// 获取总记录数
		int totalRows = hotelMarketService.getTotalCount();

		map.put("total", totalRows);

		map.put("rows", list);

		return map;
	}

	@RequestMapping("/idcMktList")
	public ModelAndView idcMktList() {

		return new ModelAndView("idcMktList");
	}
	
	@RequestMapping("/idcFacilitiesList")
	public ModelAndView idcFacilitiesList() {

		return new ModelAndView("idcFacilitiesList");
	}

	@RequestMapping("/idcFoodList")
	public ModelAndView idcFoodList() {

		return new ModelAndView("idcFoodList");
	}

	@RequestMapping("/foodList")
	public @ResponseBody
	Map<String, Object> foodList(Integer page, Integer rows,Map<String, Object> map) {

		Map<String, Integer> mapSearch = new HashMap<String, Integer>();
		mapSearch.put("startIndex", (page-1)*rows);
		mapSearch.put("pageSize", rows);
		List<Food> list = hotelFoodService.getFoodListPaged(mapSearch);
		// 获取总记录数
		int totalRows = hotelFoodService.getTotalCount();

		map.put("total", totalRows);

		map.put("rows", list);

		return map;
	}

	@RequestMapping("/idcViewList")
	public ModelAndView idcViewList() {

		return new ModelAndView("idcViewList");
	}

	@RequestMapping("/viewList")
	public @ResponseBody
	Map<String, Object> viewList(Integer page, Integer rows,Map<String, Object> map) {

		Map<String, Integer> mapSearch = new HashMap<String, Integer>();
		mapSearch.put("startIndex", (page-1)*rows);
		mapSearch.put("pageSize", rows);
		List<View> list = hotelViewService.getViewListPaged(mapSearch);
		// 获取总记录数
		int totalRows = hotelViewService.getTotalCount();

		map.put("total", totalRows);

		map.put("rows", list);

		return map;
	}
	
	@RequestMapping("/idcTrafficList")
	public ModelAndView trafficViewList() {

		return new ModelAndView("idcTrafficList");
	}

	@RequestMapping("/trafficList")
	public @ResponseBody
	Map<String, Object> trafficList(Integer page, Integer rows,Map<String, Object> map) {

		Map<String, Integer> mapSearch = new HashMap<String, Integer>();
		mapSearch.put("startIndex", (page-1)*rows);
		mapSearch.put("pageSize", rows);
		List<Traffic> list = hotelTrafficService.getTrafficListPaged(mapSearch);
		// 获取总记录数
		int totalRows = hotelTrafficService.getTotalCount();

		map.put("total", totalRows);

		map.put("rows", list);

		return map;
	}
	
	@RequestMapping("/facilitiesList")
	public @ResponseBody
	Map<String, Object> facilitiesList(Integer page, Integer rows,Map<String, Object> map) {

		Map<String, Integer> mapSearch = new HashMap<String, Integer>();
		mapSearch.put("startIndex", (page-1)*rows);
		mapSearch.put("pageSize", rows);
		List<Facilities> list = hotelFacilitiesService.getFacilitiesListPaged(mapSearch);
		// 获取总记录数
		int totalRows = hotelTrafficService.getTotalCount();

		map.put("total", totalRows);

		map.put("rows", list);

		return map;
	}

}
