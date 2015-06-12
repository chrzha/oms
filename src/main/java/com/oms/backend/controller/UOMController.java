package com.oms.backend.controller;

import com.oms.backend.entity.UOM;
import com.oms.backend.service.UOMService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.List;

/**
 * 
 */
@Controller
@RequestMapping("unit")
public class UOMController {

	@Autowired
	private UOMService uOMService;

	@ResponseBody
	@RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json")
	public List<UOM> list() {
		List<UOM> uOMList = uOMService.selectAll();

		return uOMList;
	}

}
