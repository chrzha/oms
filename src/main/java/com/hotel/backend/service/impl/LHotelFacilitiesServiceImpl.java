/**
 * 
 */
package com.hotel.backend.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.backend.mapper.LHotelFacilitiesMapper;
import com.hotel.backend.service.LHotelFacilitiesService;

/**
 * @author chrzha
 *
 */
@Service
public class LHotelFacilitiesServiceImpl implements LHotelFacilitiesService{

	
	@Autowired
	private LHotelFacilitiesMapper lHotelFacilitiesMapper;
	
	@Override
	public void insertLink(Map<String, String> map) {
		// TODO Auto-generated method stub
		lHotelFacilitiesMapper.insertLink(map);
		
	}

	@Override
	public void deleteLink(String facilitiesId) {
		// TODO Auto-generated method stub
		lHotelFacilitiesMapper.deleteLink(facilitiesId);
	}

	@Override
	public void updateLink(Map<String, String> map) {
		// TODO Auto-generated method stub
		lHotelFacilitiesMapper.updateLink(map);
	}

	@Override
	public void deleteLinkByHotelId(String hotelId) {
		// TODO Auto-generated method stub
		lHotelFacilitiesMapper.deleteLinkByHotelId(hotelId);
	}

}
