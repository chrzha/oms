package com.oms.backend.service;

import com.oms.backend.entity.PaginationTableInfo;
import com.oms.backend.entity.Material;

import java.util.List;
import java.util.Map;

public interface MaterialService {

	List<Map<String, Object>> selectAll(PaginationTableInfo pti);

	int selectAllCount(PaginationTableInfo pti);

	int insert(Material record);

	Material selectByPrimaryKey(Integer materialId);

	int deleteByPrimaryKey(Integer materialId);
	
	int deleteByPrimaryKeys(List<Integer> materialIds);

	int updateByPrimaryKey(Material record);
}
