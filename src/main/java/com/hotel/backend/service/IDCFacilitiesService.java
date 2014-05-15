/**
 * 
 */
package com.hotel.backend.service;

import java.util.List;
import java.util.Map;

import com.hotel.backend.view.IDCFacilities;

/**
 * @author chrzha
 *
 */
public interface IDCFacilitiesService {
	public List<IDCFacilities> getIDCFacilitiesListPaged(Map<String, Integer> map);
}
