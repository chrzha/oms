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

import com.hotel.backend.entity.Food;
import com.hotel.backend.entity.Market;
import com.hotel.backend.entity.View;
import com.hotel.backend.service.HotelMarketService;
import com.hotel.backend.service.HotelViewService;
import com.hotel.backend.service.LHotelMktService;
import com.hotel.backend.service.LHotelViewService;
import com.hotel.backend.view.UserView;

/**
 * @author chrzha
 *
 */
@Controller
@Path("/")
public class ViewController {
	
	@Autowired
	private HotelViewService hotelViewService;

	@Autowired
	private LHotelViewService lHotelViewService;

	@RequestMapping("/deleteViewById")
	public @ResponseBody
	String deleteViewById(HttpServletRequest request,
			HttpServletResponse response, String viewId) {

		UserView userView = (UserView) request.getSession()
				.getAttribute("user");

		String hotelId = userView.getHotelId();

		Map<String, String> map = new HashMap<String, String>();

		map.put("hotelId", hotelId);
		map.put("viewId", viewId);

		lHotelViewService.deleteLink(map);

		hotelViewService.deleteViewById(viewId);

		String result = "success";
		return result;
	}
	
	@RequestMapping("/goAddView")
	public ModelAndView goAddMkt(){
		return new ModelAndView("addView");
	}

	@RequestMapping("/addView")
	public @ResponseBody
	String addView(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("view") View view) {

		String result = "";

		UserView userView = (UserView) request.getSession()
				.getAttribute("user");

		String hotelId = userView.getHotelId();

        int size = hotelViewService.getViewListByHotelId(hotelId).size();
		
		String temp = hotelViewService.getViewListByHotelId(hotelId).get(size-1).getId();
		
		int total = Integer.parseInt(temp)+1;

		String viewId = "";
		if (total < 10) {
			viewId = "000" + total;
		} else if (total >= 10 && total < 100) {
			viewId = "00" + total;
		} else if (total >= 100 && total < 1000) {
			viewId = "0" + total;
		} else {
			viewId = "" + total;
		}

		Map<String, String> map = new HashMap<String, String>();

		map.put("hotelId", hotelId);
		map.put("viewId", viewId);
		view.setId(viewId);
		lHotelViewService.insertLink(map);
		if (hotelViewService.addView(view) > 0) {

			result = "success";
		} else {

			return result = "error";
		}
		return result;
	}

	@RequestMapping("/updateView")
	public @ResponseBody
	String updateView(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("view") View view) {

		String result = "success";
		hotelViewService.updateView(view);
      
		return result;
	}
	

}
