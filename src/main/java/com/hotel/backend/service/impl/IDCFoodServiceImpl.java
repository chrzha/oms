/**
 * 
 */
package com.hotel.backend.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.backend.mapper.IDCFoodMapper;
import com.hotel.backend.service.IDCFoodService;
import com.hotel.backend.view.IDCFood;

/**
 * @author chrzha
 *
 */
@Service
public class IDCFoodServiceImpl implements IDCFoodService{
	
	@Autowired
	private IDCFoodMapper idcFoodMapper;

	@Override
	public List<IDCFood> getIDCFoodListPaged(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return idcFoodMapper.getIDCFoodListPaged(map);
	}

	 

}
