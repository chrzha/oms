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

import com.hotel.backend.entity.User;
import com.hotel.backend.entity.View;
import com.hotel.backend.service.HotelViewService;
import com.hotel.backend.service.LHotelViewService;
import com.hotel.backend.service.UserService;
import com.hotel.backend.utility.Mail;
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
	private UserService userService;

	@Autowired
	private LHotelViewService lHotelViewService;

	@RequestMapping("/deleteViewById")
	public @ResponseBody
	String deleteViewById(HttpServletRequest request,
			HttpServletResponse response, String viewId) {

	/*	UserView userView = (UserView) request.getSession()
				.getAttribute("user");

		String hotelId = userView.getHotelId();

		Map<String, String> map = new HashMap<String, String>();

		map.put("hotelId", hotelId);
		map.put("viewId", viewId);
*/
		lHotelViewService.deleteLink(viewId);

		hotelViewService.deleteViewById(viewId);

		String result = "success";
		return result;
	}
	@RequestMapping("/changeViewStatus")
	public @ResponseBody
	String changeViewStatus(HttpServletRequest request,
			HttpServletResponse response, String viewId,String status) {
		
		String result = "success";
		
		if (status.equals("0")) {
			status = "1";
		}else {
			status = "0";
		}

		Map<String, String> map = new HashMap<String, String>();

		map.put("id", viewId);
		map.put("status", status);
		
		hotelViewService.changeStatusById(map);

		UserView userView = (UserView) request.getSession()
				.getAttribute("user");

		
		User user = userService.getAdminByViewId(viewId);	
		if (userView.getRoleId().equals("0001")) {
			//如果是IDC管理员，则发邮件通知酒店，信息未通过审核
			    String smtp = "smtp.163.com";// smtp服务器
			    String from = "15251327856@163.com";// 邮件显示名称
			    String to = user.getEmail();// 收件人的邮件地址，必须是真实地址
			    String copyto = "";// 抄送人邮件地址
			    String subject = "信息审核未通过";// 邮件标题
			    String content = "你好！您所在酒店编号为："+viewId+"的旅游信息未通过审核，已被删除！";// 邮件内容
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
	@RequestMapping("/goAddView")
	public ModelAndView goAddMkt(){
		return new ModelAndView("addView");
	}

	@RequestMapping("/addView")
	public @ResponseBody
	String addView(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("view") View view) {

		String result = "";
		String viewId = "";

		UserView userView = (UserView) request.getSession()
				.getAttribute("user");

		String hotelId = userView.getHotelId();

        int size = hotelViewService.getAllViewList().size();
        
        if (size==0) {
			viewId = "0001";
		}else {
			
			String temp = hotelViewService.getAllViewList().get(size-1).getId();
			
			int total = Integer.parseInt(temp)+1;
			
			if (total < 10) {
				viewId = "000" + total;
			} else if (total >= 10 && total < 100) {
				viewId = "00" + total;
			} else if (total >= 100 && total < 1000) {
				viewId = "0" + total;
			} else {
				viewId = "" + total;
			}
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
