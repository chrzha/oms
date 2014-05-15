/**
 * 
 */
package com.hotel.backend.service;

import java.util.List;
import java.util.Map;

import com.hotel.backend.view.IDCFood;

/**
 * @author chrzha
 *
 */
public interface IDCFoodService {
	
	public List<IDCFood> getIDCFoodListPaged(Map<String, Integer> map);

}
