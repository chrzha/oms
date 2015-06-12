package com.oms.backend.service.impl;

import com.oms.backend.mapper.MaterialTypeMapper;
import com.oms.backend.entity.MaterialType;
import com.oms.backend.service.MaterialTypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MaterialTypeServiceImpl implements MaterialTypeService {

	@Autowired
	private MaterialTypeMapper materialTypeMapper;

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.haohe.srm.service.materialTypeService#selectAll()
	 */
	@Override
	public List<MaterialType> selectAll() {
		return materialTypeMapper.selectAll();
	}

}
