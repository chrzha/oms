package com.oms.backend.controller;

import com.oms.backend.entity.MaterialType;
import com.oms.backend.service.MaterialTypeService;
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
@RequestMapping("materialType")
public class MaterialTypeController {

	@Autowired
	private MaterialTypeService MaterialTypeService;

	@ResponseBody
	@RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json")
	public List<MaterialType> list() {
		List<MaterialType> materialTypeList = MaterialTypeService.selectAll();
		
		return materialTypeList;
	}

}
