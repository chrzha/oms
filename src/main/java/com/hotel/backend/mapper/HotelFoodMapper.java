package com.hotel.backend.mapper;

import java.util.List;
import java.util.Map;

import com.hotel.backend.entity.Food;


public interface HotelFoodMapper {
	
	  public List<Food> getAllFoodList();

	  public List<Food> getFoodListPaged(Map<String, Integer> map);
    
	  public List<Food> getFoodListByHotelId(String hotelId);
	  
	  public void deleteFoodById(String foodId);
	  
	  public Integer addFood(Food food);
	  
	  public void updateFood(Food food);
	  
	  public void uploadFoodPhoto(Map<String, String> map);
	  
	  public Integer getTotalCount();
}
