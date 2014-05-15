/**
 * 
 */
package com.hotel.backend.mapper;

import java.util.List;
import java.util.Map;

import com.hotel.backend.view.IDCFacilities;

/**
 * @author chrzha
 *
 */
public interface IDCFacilitiesMapper {

	public List<IDCFacilities> getIDCFacilitiesListPaged(Map<String, Integer> map);
}
