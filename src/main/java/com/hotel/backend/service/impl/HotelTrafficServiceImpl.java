/**
 * 
 */
package com.hotel.backend.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.backend.entity.Traffic;
import com.hotel.backend.mapper.HotelTrafficMapper;
import com.hotel.backend.service.HotelTrafficService;

/**
 * @author chrzha
 *
 */
@Service
public class HotelTrafficServiceImpl implements HotelTrafficService{
	
	@Autowired
	private HotelTrafficMapper hotelTrafficMapper;


	@Override
	public List<Traffic> getTrafficListByHotelId(String hotelId) {
		// TODO Auto-generated method stub
		return hotelTrafficMapper.getTrafficListByHotelId(hotelId);
	}

	@Override
	public void deleteTrafficById(String trafficId) {
		// TODO Auto-generated method stub
		hotelTrafficMapper.deleteTrafficById(trafficId);
		
	}

	@Override
	public Integer addTraffic(Traffic traffic) {
		// TODO Auto-generated method stub
		return hotelTrafficMapper.addTraffic(traffic);
	}

	@Override
	public void updateTraffic(Traffic traffic) {
		// TODO Auto-generated method stub
		hotelTrafficMapper.updateTraffic(traffic);
		
	}

	@Override
	public Integer getTotalCount() {
		// TODO Auto-generated method stub
		return hotelTrafficMapper.getTotalCount();
	}

	@Override
	public List<Traffic> getAllTrafficList() {
		// TODO Auto-generated method stub
		return hotelTrafficMapper.getAllTrafficList();
	}

	@Override
	public List<Traffic> getTrafficListPaged(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return hotelTrafficMapper.getTrafficListPaged(map);
	}

	

}
