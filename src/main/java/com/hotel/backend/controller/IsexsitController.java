package com.hotel.backend.controller;

import javax.ws.rs.Path;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotel.backend.entity.User;
import com.hotel.backend.service.impl.UserServiceImpl;

@Controller
@Path("/")
public class IsexsitController {
    @Autowired
    UserServiceImpl userServiceImpl;

    @RequestMapping(value = "/isExsit")
    public @ResponseBody boolean isexsitController(String username) {
       
    	boolean b = true;
     
            if (userServiceImpl.getUserByUsername(username) instanceof User) {
                b = false;
            } else {
             return b;
            }
       return b;
    }

}
