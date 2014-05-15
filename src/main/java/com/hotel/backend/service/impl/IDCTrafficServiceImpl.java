/**
 * 
 */
package com.hotel.backend.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.backend.mapper.IDCTrafficMapper;
import com.hotel.backend.service.IDCTrafficService;
import com.hotel.backend.view.IDCTraffic;

/**
 * @author chrzha
 *
 */
@Service
public class IDCTrafficServiceImpl implements IDCTrafficService{
	
	@Autowired
	private IDCTrafficMapper idcTrafficMapper;

	@Override
	public List<IDCTraffic> getIDCTrafficListPaged(Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return idcTrafficMapper.getIDCTrafficListPaged(map);
	}
	

}
