/**
 * 
 */
package com.hotel.backend.service.impl;

import java.util.List;

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
	public List<Market> getMarketList() {
		// TODO Auto-generated method stub
		return hotelMarketMapper.getMarketList();
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

}
