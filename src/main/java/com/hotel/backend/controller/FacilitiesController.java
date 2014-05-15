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
import com.hotel.backend.entity.User;
import com.hotel.backend.service.HotelFacilitiesService;
import com.hotel.backend.service.LHotelFacilitiesService;
import com.hotel.backend.service.UserService;
import com.hotel.backend.utility.Mail;
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
	private UserService userService;
	
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
		
		
		String result = "success";
		
		UserView userView = (UserView) request.getSession()
				.getAttribute("user");

		
		User user = userService.getAdminByFacilitiesId(facilitiesId);
		
		if (userView.getRoleId().equals("0001")) {
			//如果是IDC管理员，则发邮件通知酒店，信息未通过审核
			    String smtp = "smtp.163.com";// smtp服务器
			    String from = "15251327856@163.com";// 邮件显示名称
			    String to = user.getEmail();// 收件人的邮件地址，必须是真实地址
			    String copyto = "";// 抄送人邮件地址
			    String subject = "信息审核未通过";// 邮件标题
			    String content = "你好！您所在酒店编号为："+facilitiesId+"的设施信息未通过审核，已被删除！";// 邮件内容
			    String username = "15251327856";// 发件人真实的账户名
			    String password = "piano0713";// 发件人密码
			    
			    if (Mail.sendAndCc(smtp, from, to, copyto, subject, content, username, password)) {
		           result = "success";
		        } else {
		           result = "error";
		        }
			
		}
		
		lHotelFacilitiesService.deleteLink(facilitiesId);

		hotelFacilitiesService.deleteFacilitiesById(facilitiesId);
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
