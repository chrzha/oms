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
package com.oms.backend.controller;

import com.oms.backend.entity.User;
import com.oms.backend.service.UserService;
import com.oms.backend.view.UserView;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.Path;
import java.io.IOException;

@Controller
@Path("/")
public class LoginController {

    @Autowired
    UserService userService;

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public ModelAndView getMainPage() {

        ModelAndView modelAndView = new ModelAndView("login");
        return modelAndView;
    }

    // validate
    @RequestMapping(value = "/validate", method = RequestMethod.POST)
    public ModelAndView validateUser(HttpServletRequest request) throws IOException {

        return new ModelAndView("oms_main");

    }

    //updateUserInfo
    @RequestMapping("/updateUserInfo")
    public
    @ResponseBody
    String updateUserInfo(HttpServletRequest request,
            HttpServletResponse response, @ModelAttribute("user") User user) {

        String result = "success";

        userService.updateUser(user);

        UserView userView = (UserView) request.getSession().getAttribute("user");

        userView.setEmail(user.getEmail());
        userView.setPhone(user.getPhone());

        return result;

    }

}
