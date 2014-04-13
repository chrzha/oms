package com.hotel.backend.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.ws.rs.Path;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Path("/")
public class LogoutController {

	@RequestMapping(value="/logout")
	protected void doGet(HttpSession session, HttpServletResponse response) throws ServletException, IOException {
		session.invalidate();
		response.getWriter().print(true);
	}


}
