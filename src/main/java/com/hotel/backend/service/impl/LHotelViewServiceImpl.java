package com.hotel.backend.service.impl;

import com.hotel.backend.mapper.LHotelViewMapper;
import com.hotel.backend.service.LHotelViewService;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
@Service
public class LHotelViewServiceImpl implements LHotelViewService {

    @Autowired
    LHotelViewMapper lHotelViewMapper;
    
    
    @Override
    public void insertLink(Map<String, String> map) {
        // TODO Auto-generated method stub
        lHotelViewMapper.insertLink(map);
    }

    /** (non-Javadoc)
     * @see com.hotel.backend.service.LHotelViewService#deleteLink(java.util.Map)
     */
    @Override
    public void deleteLink(Map<String, String> map) {
        // TODO Auto-generated method stub
        lHotelViewMapper.deleteLink(map);
    }

    /** (non-Javadoc)
     * @see com.hotel.backend.service.LHotelViewService#updateLink(java.util.Map)
     */
    @Override
    public void updateLink(Map<String, String> map) {
        // TODO Auto-generated method stub
        lHotelViewMapper.updateLink(map);
    }
    
    

}

