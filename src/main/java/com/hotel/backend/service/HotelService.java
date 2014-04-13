package com.hotel.backend.service;

import com.hotel.backend.entity.Hotel;

import java.util.List;
import java.util.Map;

/**
 * //TODO Description
 * <p>
 * Copyright (c) 2012 Acxiom Corporation. All Rights Reserved.
 * </p>
 * 
 * @author chrzha date: Mar 21, 2014
 *         <p>
 *         Last updated by chrzha date:Mar 21, 2014
 *         </p>
 */

public interface HotelService {
	public List<Hotel> getHotelList();
	public Integer getHotelTotalCount();
	public Hotel getHotelById(String id);
	public void deleteHotelById(String id);
	public Integer createHotel(Hotel hotel);
	public boolean updateHotelInfo(Hotel hotel);
	public void validateHotel(Map<String , String> map);

}

