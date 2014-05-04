package com.hotel.backend.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.backend.entity.View;
import com.hotel.backend.mapper.HotelViewMapper;
import com.hotel.backend.service.HotelViewService;

/**
 * //TODO Description
 * <p>
 * Copyright (c) 2012 Acxiom Corporation. All Rights Reserved.
 * </p>
 * 
 * @author chrzha date: Apr 1, 2014
 *         <p>
 *         Last updated by chrzha date:Apr 1, 2014
 *         </p>
 */
@Service
public class HotelViewServiceImpl implements HotelViewService {

    @Autowired
    HotelViewMapper hotelViewMapper;
    
    
    @Override
    public List<View> getHotelViewList(Map<String, Integer> map) {
        // TODO Auto-generated method stub
        List<View> list = hotelViewMapper.getHotelViewList(map);
        
        return list;
    }


    /** (non-Javadoc)
     * @see com.hotel.backend.service.HotelViewService#getViewListByHotelId(java.lang.String)
     */
    @Override
    public List<View> getViewListByHotelId(String hotelId) {
        // TODO Auto-generated method stub
        List<View> list = hotelViewMapper.getViewListByHotelId(hotelId);
        return list;
    }


	@Override
	public void deleteViewById(String viewId) {
		// TODO Auto-generated method stub
		hotelViewMapper.deleteViewById(viewId);

	}


	@Override
	public Integer addView(View view) {
		// TODO Auto-generated method stub
		return hotelViewMapper.addView(view);
	}


	@Override
	public void updateView(View view) {
		// TODO Auto-generated method stub
		hotelViewMapper.updateView(view);
	}


	@Override
	public Integer getTotalCount() {
		// TODO Auto-generated method stub
		return hotelViewMapper.getTotalCount();
	}

}

