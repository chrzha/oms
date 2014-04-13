package com.hotel.backend.controller;

import com.hotel.backend.entity.User;

import com.hotel.backend.service.impl.UserServiceImpl;

import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.Path;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@Path("/")
public class IsexsitController {
    @Autowired
    UserServiceImpl userServiceImpl;

    @RequestMapping(value = "/isExsit")
    public void isexsitController(HttpServletRequest request, HttpServletResponse response, String username) {
       
        try {
            if (userServiceImpl.getUserByUsername(username) instanceof User) {
                
                response.getWriter().print(false);
            } else {
               
                response.getWriter().print(true);
            }
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
    }

}
