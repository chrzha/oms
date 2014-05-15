/**
 * 
 */
package com.hotel.backend.service;

import java.util.List;
import java.util.Map;

import com.hotel.backend.view.IDCMarket;

/**
 * @author chrzha
 *
 */
public interface IDCMarketService {
	public List<IDCMarket> getIDCMarketListPaged(Map<String, Integer> map);

}
