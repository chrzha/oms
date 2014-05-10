/**
 * 
 */
package com.hotel.backend.service;

import java.util.List;
import java.util.Map;

import com.hotel.backend.entity.Market;

/**
 * @author chrzha
 * 
 */
public interface HotelMarketService {
	
	public List<Market> getAllMarketList();

	public List<Market> getMarketListByHotelId(String hotelId);

	public List<Market> getMarketListPaged(Map<String, Integer> map);

	public void deleteMarketById(String mktId);

	public Integer addMkt(Market market);

	public void updateMkt(Market market);

	public Integer getTotalCount();
}
