/**
 * 
 */
package com.hotel.backend.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.backend.entity.Facilities;
import com.hotel.backend.mapper.HotelFacilitiesMapper;
import com.hotel.backend.service.HotelFacilitiesService;

/**
 * @author chrzha
 *
 */
@Service
public class HotelFacilitiesServiceImpl implements HotelFacilitiesService{
	
	@Autowired
	private HotelFacilitiesMapper hotelFacilitiesMapper;

	@Override
	public List<Facilities> getAllFacilitiesList() {
		// TODO Auto-generated method stub
		return hotelFacilitiesMapper.getAllFacilitiesList();
	}

	@Override
	public List<Facilities> getFacilitiesListPaged(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return hotelFacilitiesMapper.getFacilitiesListPaged(map);
	}

	@Override
	public List<Facilities> getFacilitiesListByHotelId(String hotelId) {
		// TODO Auto-generated method stub
		return hotelFacilitiesMapper.getFacilitiesListByHotelId(hotelId);
	}

	@Override
	public void deleteFacilitiesById(String facilitiesId) {
		// TODO Auto-generated method stub
		hotelFacilitiesMapper.deleteFacilitiesById(facilitiesId);
		
	}

	@Override
	public Integer addFacilities(Facilities facilities) {
		// TODO Auto-generated method stub
		return hotelFacilitiesMapper.addFacilities(facilities);
	}

	@Override
	public void updateFacilities(Facilities facilities) {
		// TODO Auto-generated method stub
		hotelFacilitiesMapper.updateFacilities(facilities);
	}

	@Override
	public Integer getTotalCount() {
		// TODO Auto-generated method stub
		return hotelFacilitiesMapper.getTotalCount();
	}

	
}
