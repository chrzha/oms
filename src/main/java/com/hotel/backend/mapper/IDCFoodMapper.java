/**
 * 
 */
package com.hotel.backend.mapper;

import java.util.List;
import java.util.Map;

import com.hotel.backend.view.IDCFood;

/**
 * @author chrzha
 *
 */
public interface IDCFoodMapper {

	public List<IDCFood> getIDCFoodListPaged(Map<String, Integer> map);
}
