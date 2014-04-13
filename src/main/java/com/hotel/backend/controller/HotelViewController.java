package com.hotel.backend.controller;

import com.hotel.backend.entity.View;


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
public class HotelViewController {

    
    @RequestMapping("/updateHotelView")
    public @ResponseBody List<View> updateHotelView(){
        List<View> list = new ArrayList<>();
        
        return list;
    }
    @RequestMapping("/deleteHotelView")
    public @ResponseBody List<View> deleteHotelView(){
        List<View> list = new ArrayList<>();
        
        return list;
    }
}

