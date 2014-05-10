/**
 * 
 */
package com.hotel.backend.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.backend.entity.Market;
import com.hotel.backend.mapper.HotelMarketMapper;
import com.hotel.backend.service.HotelMarketService;


/**
 * @author chrzha
 *
 */
@Service
public class HotelMarketServiceImpl implements HotelMarketService{
	
	@Autowired
	private HotelMarketMapper hotelMarketMapper;

	@Override
	public List<Market> getMarketListByHotelId(String hotelId) {
		// TODO Auto-generated method stub
		return hotelMarketMapper.getMarketListByHotelId(hotelId);
	}

	@Override
	public List<Market> getMarketListPaged(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return hotelMarketMapper.getMarketListPaged(map);
	}

	@Override
	public void deleteMarketById(String mktId) {
		// TODO Auto-generated method stub
		hotelMarketMapper.deleteMarketById(mktId);
	}

	@Override
	public Integer addMkt(Market market) {
		// TODO Auto-generated method stub
		return hotelMarketMapper.addMkt(market);
	}

	@Override
	public void updateMkt(Market market) {
		// TODO Auto-generated method stub
		hotelMarketMapper.updateMkt(market);
	}

	@Override
	public Integer getTotalCount() {
		// TODO Auto-generated method stub
		return hotelMarketMapper.getTotalCount();
	}

	@Override
	public List<Market> getAllMarketList() {
		// TODO Auto-generated method stub
		return getAllMarketList();
	}

}
