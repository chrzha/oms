package com.oms.backend.mapper;

import com.oms.backend.entity.MaterialType;

import java.util.List;

public interface MaterialTypeMapper {
	int deleteByPrimaryKey(Integer matTypeId);

	int insert(MaterialType record);

	int insertSelective(MaterialType record);

	MaterialType selectByPrimaryKey(Integer matTypeId);

	int updateByPrimaryKeySelective(MaterialType record);

	int updateByPrimaryKey(MaterialType record);

	List<MaterialType> selectAll();
}