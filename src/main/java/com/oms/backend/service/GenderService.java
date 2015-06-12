package com.oms.backend.service;

import com.oms.backend.entity.Gender;

import java.util.List;

public interface GenderService {
    
    List<Gender> selectAll();
    
}
