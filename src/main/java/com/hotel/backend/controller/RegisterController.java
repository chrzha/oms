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
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hotel.backend.entity.Hotel;
import com.hotel.backend.entity.User;
import com.hotel.backend.service.HotelService;
import com.hotel.backend.service.LUserRoleService;
import com.hotel.backend.service.UserService;
import com.hotel.backend.service.impl.UserServiceImpl;
import com.hotel.backend.utility.Mail;

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
	public @ResponseBody String registerController( @ModelAttribute("user") User user,
			String roleId) {
		String result = "";
		// 20140001
		
		int size = userService.getAllUser().size();
		String temp = userService.getAllUser().get(size-1).getUserId();
		int total = Integer.parseInt(temp.substring(4, temp.length()))+1;
		
		
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
			result = "success";
		} else {
			result = "error";
			//需要判断是否存在，主键不是姓名
		}
		return result;
	}
	
	@RequestMapping(value = "/hotelRegRedirect")
	public ModelAndView hotelRegRedirect() {
		ModelAndView modelAndView = new ModelAndView("hotelRegister");
		return modelAndView;

	}
	
	@RequestMapping("/hotelRegister")
	public @ResponseBody String hotelRegister(@ModelAttribute("hotel") Hotel hotel,String email){
	    String result = "";
	    //05130001
	    int size = hotelService.getHotelTotalCount();
	    String temp = hotelService.getHotelList().get(size-1).getId();
	    int total = Integer.parseInt(temp.substring(4, temp.length()))+1;
	    
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
        hotel.setPhone(hotel.getPhone().trim());
	    hotel.setId(hotelId);
	    hotel.setStatus("0");
	    
	    if (hotelService.createHotel(hotel)>0) {
            //注册成功，发送邮件通知！
	    	String smtp = "smtp.163.com";// smtp服务器
			String from = "15251327856@163.com";// 邮件显示名称
			String to = email;// 收件人的邮件地址，必须是真实地址
			String copyto = "";// 抄送人邮件地址
			String subject = "注册邮件";// 邮件标题
			String content = "你好！您注册的酒店编号为："+hotelId+",请妥善保管！";// 邮件内容
			String username = "15251327856";// 发件人真实的账户名
			String password = "piano0713";// 发件人密码
			Mail.sendAndCc(smtp, from, to, copyto, subject, content, username, password);

           result = "success";
        } else {
           result = "error";
        }
        return result;
	}
	

}
