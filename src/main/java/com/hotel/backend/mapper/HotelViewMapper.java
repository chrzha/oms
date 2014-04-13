package com.hotel.backend.mapper;

import com.hotel.backend.entity.Market;
import com.hotel.backend.entity.View;


import java.util.List;

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
    
    public List<View> getHotelViewList();
    
    public List<View> getViewListByHotelId(String hotelId);
    
    public void deleteViewById(String viewId);
	  
	public Integer addView(View view);
	    
    

}

