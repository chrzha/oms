package com.hotel.backend.service.impl;

import com.hotel.backend.mapper.LHotelMktMapper;
import com.hotel.backend.service.LHotelMktService;

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
public class LHotelMktServiceImpl implements LHotelMktService{

    @Autowired
    LHotelMktMapper lHotelMktMapper;
    
    
    
    @Override
    public void insertLink(Map<String, String> map) {
        // TODO Auto-generated method stub
        lHotelMktMapper.insertLink(map);
        
        
    }

    /** (non-Javadoc)
     * @see com.hotel.backend.service.LHotelMktService#deleteLink(java.util.Map)
     */
    @Override
    public void deleteLink(String marketId) {
        // TODO Auto-generated method stub
        lHotelMktMapper.deleteLink(marketId);
        
    }

    /** (non-Javadoc)
     * @see com.hotel.backend.service.LHotelMktService#updateLink(java.util.Map)
     */
    @Override
    public void updateLink(Map<String, String> map) {
        // TODO Auto-generated method stub
        lHotelMktMapper.updateLink(map);
    }

	@Override
	public void deleteLinkByHotelId(String hotelId) {
		// TODO Auto-generated method stub
		lHotelMktMapper.deleteLinkByHotelId(hotelId);
	}

}

