/**
 * 
 */
package com.hotel.backend.mapper;

import java.util.List;
import java.util.Map;

import com.hotel.backend.entity.Traffic;

/**
 * @author chrzha
 *
 */
public interface HotelTrafficMapper {
	
	public List<Traffic> getTrafficList(Map<String, Integer> map);

	public List<Traffic> getTrafficListByHotelId(String hotelId);

	public void deleteTrafficById(String trafficId);

	public Integer addTraffic(Traffic traffic);

	public void updateTraffic(Traffic traffic);

	public Integer getTotalCount();

	
}
