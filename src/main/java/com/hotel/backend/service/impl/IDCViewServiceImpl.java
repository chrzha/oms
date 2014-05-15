/**
 * 
 */
package com.hotel.backend.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.backend.mapper.IDCViewMapper;
import com.hotel.backend.service.IDCViewService;
import com.hotel.backend.view.IDCView;

/**
 * @author chrzha
 *
 */
@Service
public class IDCViewServiceImpl implements IDCViewService{

	@Autowired
	private IDCViewMapper idcViewMapper;
	@Override
	public List<IDCView> getIDCViewListPaged(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return idcViewMapper.getIDCViewListPaged(map);
	}

}
