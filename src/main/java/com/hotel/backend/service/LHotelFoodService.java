package com.hotel.backend.service;

import java.util.Map;

public interface LHotelFoodService {

	public void insertLink(Map<String, String> map);

	public void deleteLink(String foodId);

	public void updateLink(Map<String, String> map);
	
	public void deleteLinkByHotelId(String hotelId);
}
