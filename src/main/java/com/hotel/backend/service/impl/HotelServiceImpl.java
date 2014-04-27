package com.hotel.backend.service.impl;

import com.hotel.backend.entity.Hotel;
import com.hotel.backend.mapper.HotelMapper;
import com.hotel.backend.service.HotelService;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
@Service
public class HotelServiceImpl implements HotelService {
	
	@Autowired
	private HotelMapper hotelMapper;
	

	/** (non-Javadoc)
	 * @see com.hotel.backend.service.HotelService#getHotelList()
	 */
	@Override
	public List<Hotel> getHotelList() {
		// TODO Auto-generated method stub
		return hotelMapper.getHotelList();
	}

	/** (non-Javadoc)
	 * @see com.hotel.backend.service.HotelService#getHotelTotalCount()
	 */
	@Override
	public Integer getHotelTotalCount() {
		// TODO Auto-generated method stub
		return hotelMapper.getHotelTotalCount();
	}

	/** (non-Javadoc)
	 * @see com.hotel.backend.service.HotelService#getHotelById(java.lang.String)
	 */
	@Override
	public Hotel getHotelById(String id) {
		// TODO Auto-generated method stub
		return hotelMapper.getHotelById(id);
	}

	/** (non-Javadoc)
	 * @see com.hotel.backend.service.HotelService#deleteHotelById(java.lang.String)
	 */
	@Override
	public void deleteHotelById(String id) {
		// TODO Auto-generated method stub
		hotelMapper.deleteHotelById(id);
	}

	/** (non-Javadoc)
	 * @see com.hotel.backend.service.HotelService#createHotel(com.hotel.backend.entity.Hotel)
	 */
	@Override
	public Integer createHotel(Hotel hotel) {
		// TODO Auto-generated method stub
		return hotelMapper.createHotel(hotel);
	}

	/** (non-Javadoc)
	 * @see com.hotel.backend.service.HotelService#updateHotelInfo(com.hotel.backend.entity.Hotel)
	 */
	@Override
	public Integer updateHotelInfo(Hotel hotel) {
		// TODO Auto-generated method stub
		return hotelMapper.updateHotelInfo(hotel);
	}

	@Override
	public void validateHotel(Map<String, String> map) {
		// TODO Auto-generated method stub
		hotelMapper.validateHotel(map);
		
	}

	@Override
	public void uploadLogo(Map<String, String> map) {
		// TODO Auto-generated method stub
		hotelMapper.uploadLogo(map);
	}

}

