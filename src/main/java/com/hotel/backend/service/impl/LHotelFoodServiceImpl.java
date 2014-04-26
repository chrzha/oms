package com.hotel.backend.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.backend.mapper.LHotelFoodMapper;
import com.hotel.backend.service.LHotelFoodService;

@Service
public class LHotelFoodServiceImpl implements LHotelFoodService{
	
	@Autowired
	private LHotelFoodMapper lHotelFoodMapper;

	@Override
	public void insertLink(Map<String, String> map) {
		// TODO Auto-generated method stub
		lHotelFoodMapper.insertLink(map);
		
	}

	@Override
	public void deleteLink(Map<String, String> map) {
		// TODO Auto-generated method stub
		lHotelFoodMapper.deleteLink(map);
		
	}

	@Override
	public void updateLink(Map<String, String> map) {
		// TODO Auto-generated method stub
		lHotelFoodMapper.updateLink(map);
		
	}

	@Override
	public void deleteLinkByHotelId(String hotelId) {
		// TODO Auto-generated method stub
		lHotelFoodMapper.deleteLinkByHotelId(hotelId);
	}

}
