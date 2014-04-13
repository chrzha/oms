/**
 * 
 */
package com.hotel.backend.service;

import java.util.List;

import com.hotel.backend.entity.Market;


/**
 * @author chrzha
 *
 */
public interface HotelMarketService {

	public List<Market> getMarketListByHotelId(String hotelId);
	public List<Market> getMarketList();
	public void deleteMarketById(String mktId);
	public Integer addMkt(Market market);
}
