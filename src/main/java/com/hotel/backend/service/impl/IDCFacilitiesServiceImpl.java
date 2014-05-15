/**
 * 
 */
package com.hotel.backend.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.backend.mapper.IDCFacilitiesMapper;
import com.hotel.backend.service.IDCFacilitiesService;
import com.hotel.backend.view.IDCFacilities;

/**
 * @author chrzha
 *
 */
@Service
public class IDCFacilitiesServiceImpl implements IDCFacilitiesService{
	
	@Autowired
	private IDCFacilitiesMapper idcFacilitiesMapper;

	@Override
	public List<IDCFacilities> getIDCFacilitiesListPaged(
			Map<String, Integer> map) {
		// TODO Auto-generated method stub
		return idcFacilitiesMapper.getIDCFacilitiesListPaged(map);
	}

}
