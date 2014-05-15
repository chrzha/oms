/**
 * 
 */
package com.hotel.backend.mapper;

import java.util.List;
import java.util.Map;

import com.hotel.backend.view.IDCTraffic;

/**
 * @author chrzha
 *
 */
public interface IDCTrafficMapper {
	public List<IDCTraffic> getIDCTrafficListPaged(Map<String, Integer> map);

}
