package com.hotel.backend.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.Path;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.hotel.backend.entity.Food;
import com.hotel.backend.service.HotelFoodService;
import com.hotel.backend.view.UserView;

/**
 * //TODO Description
 * <p>
 * Copyright (c) 2012 Acxiom Corporation. All Rights Reserved.
 * </p>
 * 
 * @author chrzha date: Mar 28, 2014
 *         <p>
 *         Last updated by chrzha date:Mar 28, 2014
 *         </p>
 */
@Controller
@RequestMapping("/")
public class ImgController {
	
	@Autowired
	private HotelFoodService hotelFoodService;

	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public ModelAndView upload(String foodId) {

		ModelAndView modelAndView = new ModelAndView("upload","foodId",foodId);
		return modelAndView;
	}
	

	@RequestMapping(value = "/doUpload", method = RequestMethod.POST)
	public ModelAndView doUpload(HttpServletRequest request,     
            HttpServletResponse response,String foodId) throws IOException {
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;  
        CommonsMultipartFile file = (CommonsMultipartFile) multipartRequest  
                .getFile("imgfile");  
  
        String name = multipartRequest.getParameter("name");  
        System.out.println("name: " + name);  
        //图片名称，包括后缀
        String realFileName = file.getOriginalFilename();    
  
        // F:\cloud-based-hotel-master\src\main\webapp\images/
        String ctxPath = request.getSession().getServletContext().getRealPath(  
                "/")  
                + "images/";  
        File dirPath = new File(ctxPath);  
        if (!dirPath.exists()) {  
            dirPath.mkdir();  
        }  

        //F:\cloud-based-hotel-master\src\main\webapp\images\logo.jpg
        File uploadFile = new File(ctxPath + realFileName);  
        FileCopyUtils.copy(file.getBytes(), uploadFile);  
        
        Map<String, String> map = new HashMap<String, String>();
        map.put("id", foodId);
        map.put("photo", realFileName);
        hotelFoodService.uploadFoodPhoto(map);
        
        UserView userView = (UserView) request.getSession()
				.getAttribute("user");

		String hotelId = userView.getHotelId();
		
        List<Food> list = hotelFoodService.getFoodListByHotelId(hotelId);
        
        
        return new ModelAndView("hotelFoodList","list",list);  
	 
	}
	

}
