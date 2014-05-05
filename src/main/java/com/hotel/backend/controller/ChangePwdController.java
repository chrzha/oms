package com.hotel.backend.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.Path;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hotel.backend.service.UserService;


@Controller
@Path("/")
public class ChangePwdController {
	
	@Autowired
	private UserService userService;

	@RequestMapping("/changePwd")
	public ModelAndView goChangePwd() {

		return new ModelAndView("changePwd");
	}
	
	@RequestMapping("/doChangePwd")
	public @ResponseBody String  doChangePwd(HttpSession session,HttpServletRequest request,
			HttpServletResponse response,String userId, String userPassword) {
		String result = "";
		Map<String, String> map = new HashMap<String, String>();
		map.put("userId", userId);
		map.put("userPassword", userPassword);
			if(userService.changePwdById(map)>0){
				session.invalidate();
				result = "success";				
			}else {
				result = "error";	
			}

		return result;
	}

}
