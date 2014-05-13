/**
 * 
 */
package com.hotel.backend.controller;

import java.util.List;

import javax.ws.rs.Path;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.hotel.backend.entity.ApplyInfo;
import com.hotel.backend.service.ApplyAdminService;

/**
 * @author chrzha
 *
 */
@Controller
@Path("/")
public class ApplyAdminController {
	
	@Autowired
	private ApplyAdminService applyAdminService;
	
	//getAllApplyList
	@RequestMapping("/getAllApplyList")
	public @ResponseBody
	List<ApplyInfo> getAllApplyList() {
		
		List<ApplyInfo> list = applyAdminService.getAllApplyList();
		return list;
	}

}
