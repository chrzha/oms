package com.oms.backend.service.impl;

import com.oms.backend.mapper.UOMMapper;
import com.oms.backend.entity.UOM;
import com.oms.backend.service.UOMService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class UOMServiceImpl implements UOMService {

	@Autowired
	private UOMMapper uOMMapper;

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.haohe.srm.service.materialTypeService#selectAll()
	 */
	@Override
	public List<UOM> selectAll() {
		return uOMMapper.selectAll();
	}

}
