/**
 * 
 */
package com.hotel.backend.mapper;

import java.util.List;
import java.util.Map;

import com.hotel.backend.entity.Market;

/**
 * @author chrzha
 * 
 */
public interface HotelMarketMapper {

	public List<Market> getAllMarketList();

	public List<Market> getMarketListPaged(Map<String, Integer> map);

	public List<Market> getMarketListByHotelId(String hotelId);

	public void deleteMarketById(String mktId);

	public Integer addMkt(Market market);

	public void updateMkt(Market market);

	public Integer getTotalCount();
	
	public void changeStatusById(Map<String, String> map);

}
