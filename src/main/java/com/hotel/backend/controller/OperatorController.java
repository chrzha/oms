package com.hotel.backend.controller;

import javax.ws.rs.Path;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.hotel.backend.utility.Mail;

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
	@RequestMapping("/operatorHome")
	public ModelAndView goOperatorHomePage(String hotelId){
		
	return new ModelAndView("operatorHome");
	}

	
	@RequestMapping("/applyAdmin")
	public String applyAdmin(String hotelId){
		String result = "success";
		String smtp = "smtp.163.com";// smtp服务器
		String from = "15251327856@163.com";// 邮件显示名称
		String to = "1032537895@qq.com";// 收件人的邮件地址，必须是真实地址
		String copyto = "";// 抄送人邮件地址
		String subject = "申请为管理员";// 邮件标题
		String content = "想申请为管理员";// 邮件内容
		String username = "15251327856";// 发件人真实的账户名
		String password = "piano0713";// 发件人密码
		Mail.sendAndCc(smtp, from, to, copyto, subject, content, username, password);
		
	return result;
	}
	
	
	
}

