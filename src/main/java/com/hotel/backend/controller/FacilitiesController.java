/**
 * 
 */
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

import com.hotel.backend.entity.Facilities;
import com.hotel.backend.service.HotelFacilitiesService;
import com.hotel.backend.service.LHotelFacilitiesService;
import com.hotel.backend.view.UserView;

/**
 * @author chrzha
 *
 */
@Controller
@Path("/")
public class FacilitiesController {
	
	@Autowired
	private HotelFacilitiesService hotelFacilitiesService;
	
	@Autowired
	private LHotelFacilitiesService lHotelFacilitiesService;



	@RequestMapping("/deleteFacilitiesById")
	public @ResponseBody
	String deleteFacilitiesById(HttpServletRequest request,
			HttpServletResponse response, String facilitiesId) {

		/*UserView userView = (UserView) request.getSession()
				.getAttribute("user");

		String hotelId = userView.getHotelId();

		Map<String, String> map = new HashMap<String, String>();

		map.put("hotelId", hotelId);
		map.put("facilitiesId", facilitiesId);*/

		lHotelFacilitiesService.deleteLink(facilitiesId);

		hotelFacilitiesService.deleteFacilitiesById(facilitiesId);

		String result = "success";
		return result;
	}
	@RequestMapping("/deleteFacilitiesByIDC")
	public @ResponseBody
	String deleteFacilitiesByIDC(HttpServletRequest request,
			HttpServletResponse response, String facilitiesId) {

		hotelFacilitiesService.deleteFacilitiesById(facilitiesId);

		String result = "success";
		return result;
	}

	
	@RequestMapping("/goAddFacilities")
	public ModelAndView goAddMkt(){
		return new ModelAndView("addFacilities");
	}

	@RequestMapping("/addFacilities")
	public @ResponseBody
	String addFacilities(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("facilities") Facilities facilities) {

		String result = "";
		String facilitiesId = "";

		UserView userView = (UserView) request.getSession()
				.getAttribute("user");

		String hotelId = userView.getHotelId();

		
		int size = hotelFacilitiesService.getAllFacilitiesList().size();
		
		if (size==0) {
			facilitiesId = "0001";
		}else {
			
			String temp = hotelFacilitiesService.getAllFacilitiesList().get(size-1).getId();
			
			int total = Integer.parseInt(temp)+1;
			
			if (total < 10) {
				facilitiesId = "000" + total;
			} else if (total >= 10 && total < 100) {
				facilitiesId = "00" + total;
			} else if (total >= 100 && total < 1000) {
				facilitiesId = "0" + total;
			} else {
				facilitiesId = "" + total;
			}
		}
		

		Map<String, String> map = new HashMap<String, String>();

		map.put("hotelId", hotelId);
		map.put("facilitiesId", facilitiesId);
		facilities.setId(facilitiesId);
		lHotelFacilitiesService.insertLink(map);
		if (hotelFacilitiesService.addFacilities(facilities) > 0) {

			result = "success";
		} else {

			return result = "error";
		}
		return result;
	}

	@RequestMapping("/updateFacilities")
	public @ResponseBody
	String updateFood(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("facilities") Facilities facilities) {

		String result = "success";
		hotelFacilitiesService.updateFacilities(facilities);
		return result;
	}
	
	
	
	

}
