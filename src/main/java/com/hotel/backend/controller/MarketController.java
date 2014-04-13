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

import com.hotel.backend.entity.Market;
import com.hotel.backend.service.HotelMarketService;
import com.hotel.backend.service.LHotelMktService;
import com.hotel.backend.view.UserView;

/**
 * @author chrzha
 * 
 */
@Controller
@Path("/")
public class MarketController {

	@Autowired
	private HotelMarketService hotelMarketService;

	@Autowired
	private LHotelMktService lHotelMktService;

	@RequestMapping("/deleteMktById")
	public @ResponseBody
	String deleteMktById(HttpServletRequest request,
			HttpServletResponse response, String mktId) {

		UserView userView = (UserView) request.getSession()
				.getAttribute("user");

		String hotelId = userView.getHotelId();

		Map<String, String> map = new HashMap<String, String>();

		map.put("hotelId", hotelId);
		map.put("mktId", mktId);

		lHotelMktService.deleteLink(map);

		hotelMarketService.deleteMarketById(mktId);

		String result = "success";
		return result;
	}
	
	@RequestMapping("/goAddMkt")
	public ModelAndView goAddMkt(){
		return new ModelAndView("addMkt");
	}

	@RequestMapping("/addMkt")
	public @ResponseBody
	String addMkt(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("market") Market market) {

		String result = "";

		UserView userView = (UserView) request.getSession()
				.getAttribute("user");

		String hotelId = userView.getHotelId();

		long total = hotelMarketService.getMarketListByHotelId(hotelId).size();
		String mktId = "";
		if (total < 10) {
			mktId = "000" + total;
		} else if (total >= 10 && total < 100) {
			mktId = "00" + total;
		} else if (total >= 100 && total < 1000) {
			mktId = "0" + total;
		} else {
			mktId = "" + total;
		}

		Map<String, String> map = new HashMap<String, String>();

		map.put("hotelId", hotelId);
		map.put("mktId", mktId);
		market.setId(mktId);
		lHotelMktService.insertLink(map);
		if (hotelMarketService.addMkt(market) > 0) {

			result = "success";
		} else {

			return result = "error";
		}
		return result;
	}

}
