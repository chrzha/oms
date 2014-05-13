/*
 * Copyright (C), Acxiom Corporation  
 * FileName: LoginController.java
 * Author:   chrzha
 * Date:     Jan 23, 2014 4:30:15 PM
 * Description: 
 * History: 
 * <author>      <time>      <version>    <desc>
 *
 */
package com.hotel.backend.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.Path;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.code.kaptcha.Constants;
import com.hotel.backend.entity.User;
import com.hotel.backend.service.UserService;
import com.hotel.backend.service.UserViewService;
import com.hotel.backend.view.UserView;

/**
 * ��Simple Functional Description��<br>
 * ��Functional Description��
 * 
 * @author chrzha
 * @see
 * @since
 */
@Controller
@Path("/")
public class LoginController {

	@Autowired
	UserService userService;

	@Autowired
	UserViewService userViewService;

	/*
	 * @Autowired LoginMapper loginMapper;
	 */

	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public ModelAndView getMainPage() {

		ModelAndView modelAndView = new ModelAndView("login");
		return modelAndView;
	}

	// validate
	@RequestMapping(value = "/validate", method = RequestMethod.GET)
	public @ResponseBody
	List<Object> validateUser(HttpServletRequest request,
			HttpServletResponse response, String userName, String userPassword,
			String roleId,String clientCode) throws IOException {

		List<Object> list = new ArrayList<>();
		
		HttpSession session = request.getSession();
		
		String sessionCode = (String)session.getAttribute(Constants.KAPTCHA_SESSION_KEY);
		if (!clientCode.equals(sessionCode)) {
			list.add("error_code");
		}else {
			
			UserView userView = userViewService.getUserViewByUserName(userName);


			if (userView == null) {
				list.add("error_0");
			} else if (!userView.getUserPassword().equals(userPassword)) {
				// list.removeAll(list);
				list.add("error_1");
			} else if (userView.getStatus().equals("0")) {
				list.add("error_2");// 未经过审核
			} else if (userView != null
					&& userView.getUserPassword().equals(userPassword)
					&& userView.getRoleId().equals("0001")
					&& userView.getRoleId().equals(roleId)) {
				list.add("idcHome");
				list.add(userView);
				request.getSession().setAttribute("user", userView);// 方便进行filter
			} else if (userView != null
					&& userView.getUserPassword().equals(userPassword)
					&& userView.getRoleId().equals("0002")
					&& userView.getRoleId().equals(roleId)) {
				list.add("adminHome");
				list.add(userView);
				request.getSession().setAttribute("user", userView);// 方便进行filter
			} else if (userView != null
					&& userView.getUserPassword().equals(userPassword)
					&& userView.getRoleId().equals("0003")
					&& userView.getRoleId().equals(roleId)) {
				list.add("operatorHome");
				list.add(userView);
				request.getSession().setAttribute("user", userView);// 方便进行filter
			} else {
				list.add("error_2");// 未经过审核
			}
			
		}
		
		
		
		return list;

	}
	
	
	//updateUserInfo
	@RequestMapping("/updateUserInfo")
	public @ResponseBody String updateUserInfo(HttpServletRequest request,
			HttpServletResponse response,@ModelAttribute("user") User user){
		
		String result = "success";
		
		userService.updateUser(user);
		
		UserView userView = (UserView) request.getSession().getAttribute("user");
		
		userView.setEmail(user.getEmail());
		userView.setPhone(user.getPhone());

		return result;
		
	}
	
	

}
