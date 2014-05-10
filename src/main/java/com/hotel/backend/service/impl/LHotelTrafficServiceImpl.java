/**
 * 
 */
package com.hotel.backend.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.backend.mapper.LHotelTrafficMapper;
import com.hotel.backend.service.LHotelTrafficService;

/**
 * @author chrzha
 *
 */
@Service
public class LHotelTrafficServiceImpl implements LHotelTrafficService{
	
	@Autowired
	private LHotelTrafficMapper lHotelTrafficMapper;

	@Override
	public void insertLink(Map<String, String> map) {
		// TODO Auto-generated method stub
		lHotelTrafficMapper.insertLink(map);
		
	}

	@Override
	public void deleteLink(Map<String, String> map) {
		// TODO Auto-generated method stub
		lHotelTrafficMapper.deleteLink(map);
		
	}

	@Override
	public void updateLink(Map<String, String> map) {
		// TODO Auto-generated method stub
		lHotelTrafficMapper.updateLink(map);
		
	}

	@Override
	public void deleteLinkByHotelId(String hotelId) {
		// TODO Auto-generated method stub
		lHotelTrafficMapper.deleteLinkByHotelId(hotelId);
		
	}

}
