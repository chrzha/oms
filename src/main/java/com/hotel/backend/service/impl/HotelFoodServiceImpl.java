package com.hotel.backend.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.backend.entity.Food;
import com.hotel.backend.mapper.HotelFoodMapper;
import com.hotel.backend.service.HotelFoodService;

@Service
public class HotelFoodServiceImpl implements HotelFoodService{
	
	@Autowired
	private HotelFoodMapper hotelFoodMapper;

	@Override
	public List<Food> getFoodList(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return hotelFoodMapper.getFoodList(map);
	}

	@Override
	public List<Food> getFoodListByHotelId(String hotelId) {
		// TODO Auto-generated method stub
		return hotelFoodMapper.getFoodListByHotelId(hotelId);
	}

	@Override
	public void deleteFoodById(String foodId) {
		// TODO Auto-generated method stub
		hotelFoodMapper.deleteFoodById(foodId);
	}

	@Override
	public Integer addFood(Food food) {
		// TODO Auto-generated method stub
		return hotelFoodMapper.addFood(food);
	}

	@Override
	public void updateFood(Food food) {
		// TODO Auto-generated method stub
		hotelFoodMapper.updateFood(food);
	}

	@Override
	public void uploadFoodPhoto(Map<String, String> map) {
		// TODO Auto-generated method stub
		hotelFoodMapper.uploadFoodPhoto(map);
	}

	@Override
	public Integer getTotalCount() {
		// TODO Auto-generated method stub
		return hotelFoodMapper.getTotalCount();
	}

}
