package com.oms.backend.utility;

public class SendMail {
	public static void main(String[] args) {
		String smtp = "smtp.163.com";// smtp服务器
		String from = "15251327856@163.com";// 邮件显示名称
		String to = "1032537895@qq.com";// 收件人的邮件地址，必须是真实地址
		String copyto = "";// 抄送人邮件地址
		String subject = "注册邮件";// 邮件标题
		String content = "你好！";// 邮件内容
		String username = "15251327856";// 发件人真实的账户名
		String password = "piano0713";// 发件人密码
		Mail.sendAndCc(smtp, from, to, copyto, subject, content, username, password);
	}
}