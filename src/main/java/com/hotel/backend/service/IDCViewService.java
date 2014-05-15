/**
 * 
 */
package com.hotel.backend.service;

import java.util.List;
import java.util.Map;

import com.hotel.backend.view.IDCView;

/**
 * @author chrzha
 *
 */
public interface IDCViewService {
	public List<IDCView> getIDCViewListPaged(Map<String, Integer> map);

}
