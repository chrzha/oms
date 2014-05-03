package com.hotel.backend.mapper;

import java.util.List;
import java.util.Map;

import com.hotel.backend.entity.View;

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

public interface HotelViewMapper {
    
    public List<View> getHotelViewList(Map<String, Integer> map);
    
    public List<View> getViewListByHotelId(String hotelId);
    
    public void deleteViewById(String viewId);
	  
	public Integer addView(View view);
	
	public void updateView(View view);
    

}

