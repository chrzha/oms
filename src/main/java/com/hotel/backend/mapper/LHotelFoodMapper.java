package com.hotel.backend.mapper;

import java.util.Map;

public interface LHotelFoodMapper {
	public void insertLink(Map<String, String> map);

	public void deleteLink(String foodId);

	public void updateLink(Map<String, String> map);
	
	public void deleteLinkByHotelId(String hotelId);

}
