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
import com.hotel.backend.entity.User;
import com.hotel.backend.service.HotelMarketService;
import com.hotel.backend.service.LHotelMktService;
import com.hotel.backend.service.UserService;
import com.hotel.backend.utility.Mail;
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
	private UserService userService;

	@Autowired
	private LHotelMktService lHotelMktService;

	@RequestMapping("/deleteMktById")
	public @ResponseBody
	String deleteMktById(HttpServletRequest request,
			HttpServletResponse response, String mktId) {

		/*
		 * UserView userView = (UserView) request.getSession()
		 * .getAttribute("user");
		 * 
		 * String hotelId = userView.getHotelId();
		 * 
		 * Map<String, String> map = new HashMap<String, String>();
		 * 
		 * map.put("hotelId", hotelId); map.put("mktId", mktId);
		 */

		lHotelMktService.deleteLink(mktId);

		hotelMarketService.deleteMarketById(mktId);

		String result = "success";
		return result;
	}

	@RequestMapping("/changeMktStatus")
	public @ResponseBody
	String changeMktStatus(HttpServletRequest request,
			HttpServletResponse response, String mktId, String status) {

		String result = "success";

		if (status.equals("0")) {
			status = "1";
		} else {
			status = "0";
		}

		Map<String, String> map = new HashMap<String, String>();

		map.put("id", mktId);
		map.put("status", status);
		
		hotelMarketService.changeStatusById(map);

		UserView userView = (UserView) request.getSession()
				.getAttribute("user");

		User user = userService.getAdminByMarketId(mktId);

		if (userView.getRoleId().equals("0001")) {
			// 如果是IDC管理员，则发邮件通知酒店，信息未通过审核
			String smtp = "smtp.163.com";// smtp服务器
			String from = "15251327856@163.com";// 邮件显示名称
			String to = user.getEmail();// 收件人的邮件地址，必须是真实地址
			String copyto = "";// 抄送人邮件地址
			String subject = "信息审核未通过";// 邮件标题
			String content = "你好！您所在酒店编号为：" + mktId + "的商场购物信息未通过审核，已被删除！";// 邮件内容
			String username = "15251327856";// 发件人真实的账户名
			String password = "piano0713";// 发件人密码

			if (Mail.sendAndCc(smtp, from, to, copyto, subject, content,
					username, password)) {
				result = "success";
			} else {
				result = "error";
			}

		}

		 
		return result;
	}

	@RequestMapping("/goAddMkt")
	public ModelAndView goAddMkt() {
		return new ModelAndView("addMkt");
	}

	@RequestMapping("/addMkt")
	public @ResponseBody
	String addMkt(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("market") Market market) {

		String result = "";
		String mktId = "";

		UserView userView = (UserView) request.getSession()
				.getAttribute("user");

		String hotelId = userView.getHotelId();

		int size = hotelMarketService.getAllMarketList().size();

		if (size == 0) {

			mktId = "0001";

		} else {

			String temp = hotelMarketService.getAllMarketList().get(size - 1)
					.getId();

			int total = Integer.parseInt(temp) + 1;

			if (total < 10) {
				mktId = "000" + total;
			} else if (total >= 10 && total < 100) {
				mktId = "00" + total;
			} else if (total >= 100 && total < 1000) {
				mktId = "0" + total;
			} else {
				mktId = "" + total;
			}
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

	@RequestMapping("/updateMarket")
	public @ResponseBody
	String updateMarket(HttpServletRequest request,
			HttpServletResponse response,
			@ModelAttribute("market") Market market) {

		String result = "success";
		hotelMarketService.updateMkt(market);
		return result;
	}

}
