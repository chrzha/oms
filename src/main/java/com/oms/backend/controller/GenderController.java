package com.oms.backend.controller;

import com.oms.backend.entity.Gender;
import com.oms.backend.service.GenderService;
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
@RequestMapping("gender")
public class GenderController {

    @Autowired
    private GenderService genderService;

    @ResponseBody
    @RequestMapping(value = "/list", method = RequestMethod.GET, produces = "application/json")
    public List<Gender> list() {
        List<Gender> genderList = genderService.selectAll();
        return genderList;
    }

}
