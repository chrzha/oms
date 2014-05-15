/**
 * 
 */
package com.hotel.backend.mapper;

import java.util.List;
import java.util.Map;

import com.hotel.backend.view.IDCView;

/**
 * @author chrzha
 *
 */
public interface IDCViewMapper {
	public List<IDCView> getIDCViewListPaged(Map<String, Integer> map);

}
