/**
 * 
 */
package com.hotel.backend.mapper;

import java.util.List;
import java.util.Map;

import com.hotel.backend.view.IDCMarket;

/**
 * @author chrzha
 *
 */
public interface IDCMarketMapper {
	public List<IDCMarket> getIDCMarketListPaged(Map<String, Integer> map);

}
