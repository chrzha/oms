/**
 * 
 */
package com.hotel.backend.service;

import java.util.List;
import java.util.Map;

import com.hotel.backend.view.IDCTraffic;

/**
 * @author chrzha
 *
 */
public interface IDCTrafficService {
	public List<IDCTraffic> getIDCTrafficListPaged(Map<String, Integer> map);

}
