package com.hotel.backend.mapper;

import java.util.List;

import com.hotel.backend.entity.Food;


public interface HotelFoodMapper {

	  public List<Food> getFoodList();
    
	  public List<Food> getFoodListByHotelId(String hotelId);
	  
	  public void deleteFoodById(String foodId);
	  
	  public Integer addFood(Food food);
}
