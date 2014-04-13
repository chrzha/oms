package com.hotel.backend.controller;

import com.hotel.backend.view.UserView;

import java.util.ArrayList;
import java.util.List;

import javax.ws.rs.Path;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * //TODO Description
 * <p>
 * Copyright (c) 2012 Acxiom Corporation. All Rights Reserved.
 * </p>
 * 
 * @author chrzha date: Apr 2, 2014
 *         <p>
 *         Last updated by chrzha date:Apr 2, 2014
 *         </p>
 */
@Controller
@Path("/")
public class UserViewController {
    
    @RequestMapping("/updateUserView")
    public @ResponseBody List<UserView> updateUserView(){
        
        List<UserView> list = new ArrayList<>();
        
        return list;
    }
    
    @RequestMapping("/deleteUserView")
    public @ResponseBody List<UserView> deleteUserView(){
        
        List<UserView> list = new ArrayList<>();
        
        return list;
    }

    
}

