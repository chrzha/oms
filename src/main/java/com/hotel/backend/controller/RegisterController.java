package com.hotel.backend.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.POST;
import javax.ws.rs.Path;

import org.apache.commons.mail.EmailException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.hotel.backend.entity.Hotel;
import com.hotel.backend.entity.User;
import com.hotel.backend.service.HotelService;
import com.hotel.backend.service.LUserRoleService;
import com.hotel.backend.service.UserService;
import com.hotel.backend.service.impl.UserServiceImpl;

@Controller
@Path("/")
public class RegisterController {

	@Autowired
	UserService userService;
	
	@Autowired
	HotelService hotelService;
	
	
	@Autowired
	LUserRoleService lUserRoleService;

	@RequestMapping(value = "/regRedirect")
	public ModelAndView regRedirect() {
		ModelAndView modelAndView = new ModelAndView("register");
		return modelAndView;

	}

	@RequestMapping(value = "/register",method = RequestMethod.POST)
	public ModelAndView registerController( @ModelAttribute("user") User user,
			String roleId) {
		ModelAndView modelAndView = new ModelAndView();
		// 20140001
		int total = userService.getUserTotalCount()+1;
		String userId = "";
		if (total < 10) {
			userId = "2014000" + total;
		} else if (total >= 10 && total < 100) {
			userId = "201400" + total;
		} else if (total >= 100 && total < 1000) {
			userId = "20140" + total;
		} else {
			userId = "2014" + total;
		}
		user.setUserId(userId);
		user.setStatus("0");
		user.setHotelId(user.getHotelId().substring(0, 8));
		Map<String, String> map = new HashMap<>();
		map.put("userId", userId);
		map.put("roleId",roleId);
		
		if (userService.createUser(user)>0) {
			lUserRoleService.insertLink(map);
			//注册成功，发送邮件通知！
			modelAndView.setViewName("success");
		} else {
			modelAndView.setViewName("error");
		}
		return modelAndView;
	}
	
	@RequestMapping(value = "/hotelRegRedirect")
	public ModelAndView hotelRegRedirect() {
		ModelAndView modelAndView = new ModelAndView("hotelRegister");
		return modelAndView;

	}
	
	@RequestMapping("/hotelRegister")
	public ModelAndView hotelRegister(@ModelAttribute("hotel") Hotel hotel){
	    
	    ModelAndView modelAndView = new ModelAndView();
	    //05130001
	    int total = hotelService.getHotelTotalCount()+1;
        String hotelId = "";
        if (total < 10) {
            hotelId = "0513000" + total;
        } else if (total >= 10 && total < 100) {
            hotelId = "051300" + total;
        } else if (total >= 100 && total < 1000) {
            hotelId = "05130" + total;
        } else {
            hotelId = "0513" + total;
        }
	    hotel.setId(hotelId);
	    hotel.setStatus("0");
	    
	    if (hotelService.createHotel(hotel)>0) {
            //注册成功，发送邮件通知！
	    	
	     
            modelAndView.setViewName("success");
        } else {
            modelAndView.setViewName("error");
        }
        return modelAndView;
	}
	

}
