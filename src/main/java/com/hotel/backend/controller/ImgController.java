package com.hotel.backend.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.ws.rs.Path;

import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartFile;
import org.springframework.web.servlet.ModelAndView;

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

	@RequestMapping(value = "/upload", method = RequestMethod.GET)
	public ModelAndView upload() {

		ModelAndView modelAndView = new ModelAndView("upload");
		return modelAndView;
	}
	

	@RequestMapping(value = "/doUpload", method = RequestMethod.POST)
	public ModelAndView doUpload(HttpServletRequest request,     
            HttpServletResponse response) throws IOException {
		
		MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;  
        CommonsMultipartFile file = (CommonsMultipartFile) multipartRequest  
                .getFile("imgfile");  
  
        String name = multipartRequest.getParameter("name");  
        System.out.println("name: " + name);  
        // ����ļ���  
        String realFileName = file.getOriginalFilename();  
        System.out.println("����ļ���" + realFileName);  
        // ��ȡ·��  
        String ctxPath = request.getSession().getServletContext().getRealPath(  
                "/")  
                + "images/";  
        // �����ļ�  
        File dirPath = new File(ctxPath);  
        if (!dirPath.exists()) {  
            dirPath.mkdir();  
        }  
        File uploadFile = new File(ctxPath + realFileName);  //uploadFile save the path to mysql
        FileCopyUtils.copy(file.getBytes(), uploadFile);  
      //  request.setAttribute("files", loadFiles(request));  
        return new ModelAndView("success");  
	 
	}
	

}
