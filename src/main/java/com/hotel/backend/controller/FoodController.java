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
 
import com.hotel.backend.entity.User;
import com.hotel.backend.service.HotelFoodService;
 
import com.hotel.backend.service.LHotelFoodService;
 
import com.hotel.backend.service.UserService;
import com.hotel.backend.utility.Mail;
import com.hotel.backend.view.UserView;

@Controller
@Path("/")
public class FoodController {
	
	@Autowired
	private HotelFoodService hotelFoodService;
	
	@Autowired
	private UserService userService;

	@Autowired
	private LHotelFoodService lHotelFoodService;

	@RequestMapping("/deleteFoodById")
	public @ResponseBody
	String deleteFoodById(HttpServletRequest request,
			HttpServletResponse response, String foodId) {


		lHotelFoodService.deleteLink(foodId);

		hotelFoodService.deleteFoodById(foodId);

		String result = "success";
		return result;
	}
	@RequestMapping("/changeFoodStatus")
	public @ResponseBody
	String changeFoodStatus(HttpServletRequest request,
			HttpServletResponse response, String foodId,String status) {
		
		
		String result = "success";
		
		if (status.equals("0")) {
			status = "1";
		}else {
			status = "0";
		}

		UserView userView = (UserView) request.getSession()
				.getAttribute("user");

		
		User user = userService.getAdminByFoodId(foodId);
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("id", foodId);
		map.put("status", status);
		
		hotelFoodService.changeStatusById(map);
		
		
		if (userView.getRoleId().equals("0001")&&status.equals("0")) {
			//如果是IDC管理员，则发邮件通知酒店，信息未通过审核
			    String smtp = "smtp.163.com";// smtp服务器
			    String from = "15251327856@163.com";// 邮件显示名称
			    String to = user.getEmail();// 收件人的邮件地址，必须是真实地址
			    String copyto = "";// 抄送人邮件地址
			    String subject = "信息审核未通过";// 邮件标题
			    String content = "你好！您所在酒店编号为："+foodId+"的美食信息未通过审核！";// 邮件内容
			    String username = "15251327856";// 发件人真实的账户名
			    String password = "piano0713";// 发件人密码
			    
			    if (Mail.sendAndCc(smtp, from, to, copyto, subject, content, username, password)) {
		           result = "success";
		        } else {
		           result = "error";
		        }
			
		}

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
		String foodId = "";

		UserView userView = (UserView) request.getSession()
				.getAttribute("user");

		String hotelId = userView.getHotelId();

		
		int size = hotelFoodService.getAllFoodList().size();
		
		if (size==0) {
			foodId = "0001";
		}else {
			
			String temp = hotelFoodService.getAllFoodList().get(size-1).getId();
			
			int total = Integer.parseInt(temp)+1;
			
			if (total < 10) {
				foodId = "000" + total;
			} else if (total >= 10 && total < 100) {
				foodId = "00" + total;
			} else if (total >= 100 && total < 1000) {
				foodId = "0" + total;
			} else {
				foodId = "" + total;
			}
		}
		

		Map<String, String> map = new HashMap<String, String>();

		map.put("hotelId", hotelId);
		map.put("foodId", foodId);
		food.setId(foodId);
		food.setPhoto("default.jpg");
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
