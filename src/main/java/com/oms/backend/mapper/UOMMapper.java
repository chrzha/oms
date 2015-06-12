package com.oms.backend.mapper;

import com.oms.backend.entity.UOM;

import java.util.List;

public interface UOMMapper {
	int deleteByPrimaryKey(Integer uomId);

	int insert(UOM record);

	int insertSelective(UOM record);

	UOM selectByPrimaryKey(Integer uomId);

	int updateByPrimaryKeySelective(UOM record);

	int updateByPrimaryKey(UOM record);

	List<UOM> selectAll();
}