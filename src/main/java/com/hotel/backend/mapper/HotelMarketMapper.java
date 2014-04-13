/**
 * 
 */
package com.hotel.backend.mapper;

import java.util.List;

import com.hotel.backend.entity.Market;


/**
 * @author chrzha
 *
 */
public interface HotelMarketMapper {

	  public List<Market> getMarketList();
	    
	  public List<Market> getMarketListByHotelId(String hotelId);
	  
	  public void deleteMarketById(String mktId);
	  
	  public Integer addMkt(Market market);
	    
}
