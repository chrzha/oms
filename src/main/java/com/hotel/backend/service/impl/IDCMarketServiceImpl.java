/**
 * 
 */
package com.hotel.backend.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.backend.mapper.IDCMarketMapper;
import com.hotel.backend.service.IDCMarketService;
import com.hotel.backend.view.IDCMarket;

/**
 * @author chrzha
 *
 */
@Service
public class IDCMarketServiceImpl implements IDCMarketService{
	
	@Autowired
	private IDCMarketMapper idcMarketMapper;
	

	@Override
	public List<IDCMarket> getIDCMarketListPaged(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return idcMarketMapper.getIDCMarketListPaged(map);
	}

}
