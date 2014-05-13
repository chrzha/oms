package com.hotel.backend.controller;

import java.util.Date;

import javax.ws.rs.Path;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.hotel.backend.entity.ApplyInfo;
import com.hotel.backend.service.ApplyAdminService;
import com.hotel.backend.service.UserViewService;
import com.hotel.backend.utility.Mail;
import com.hotel.backend.view.UserView;

/**
 * //TODO Description
 * <p>
 * Copyright (c) 2012 Acxiom Corporation. All Rights Reserved.
 * </p>
 * 
 * @author chrzha date: Mar 21, 2014
 *         <p>
 *         Last updated by chrzha date:Mar 21, 2014
 *         </p>
 */
@Controller
@Path("/")
public class OperatorController {

	@Autowired
	private UserViewService userViewService;
	
	@Autowired
	private ApplyAdminService applyAdminService;

	@RequestMapping("/operatorHome")
	public ModelAndView goOperatorHomePage(String hotelId) {

		return new ModelAndView("operatorHome");
	}

	@RequestMapping("/applyAdmin")
	public @ResponseBody
	String applyAdmin(String userId, String reason) {

		UserView userView = userViewService.getUserViewByUserId(userId);

		String result = "success";
		String smtp = "smtp.163.com";// smtp服务器
		String from = "15251327856@163.com";// 邮件显示名称
		String to = "1032537895@qq.com";// 收件人的邮件地址，必须是真实地址
		String copyto = "";// 抄送人邮件地址
		String subject = "酒店编号为 " + userView.getHotelId() + "的操作员预申请为管理员，请审核，";// 邮件标题
		String content =  "理由：" + reason+"\n详细资料：\n" + "编号：" + userView.getUserId() + "\n用户名:"
				+ userView.getUserName() + "\n酒店编号：" + userView.getHotelId()
				+ "\n角色：" + userView.getRoleName();// 邮件内容
		String username = "15251327856";// 发件人真实的账户名
		String password = "piano0713";// 发件人密码
		
		
		ApplyInfo applyInfo = new ApplyInfo();
		applyInfo.setUserId(userId);
		applyInfo.setUserName(userView.getUserName());
		applyInfo.setRoleName(userView.getRoleName());
		applyInfo.setApplyDate(new Date());
		applyInfo.setConfirmDate(null);
		applyInfo.setFlag("0");
		applyInfo.setEmail(userView.getEmail());
		applyInfo.setHotelId(userView.getHotelId());
		applyInfo.setApplyRole("管理员");
		
		
		if (Mail.sendAndCc(smtp, from, to, copyto, subject, content, username,
				password)&&applyAdminService.addApply(applyInfo)>0) {
			return result;
		} else {
			result = "error";
		}
		return result;
	}

}
