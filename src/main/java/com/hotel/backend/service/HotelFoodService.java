package com.hotel.backend.service;

import java.util.List;

import com.hotel.backend.entity.Food;

public interface HotelFoodService {

	public List<Food> getFoodList();

	public List<Food> getFoodListByHotelId(String hotelId);

	public void deleteFoodById(String foodId);

	public Integer addFood(Food food);
	
	public void updateFood(Food food);

}
