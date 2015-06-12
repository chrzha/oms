package com.oms.backend.mapper;

import com.oms.backend.entity.SupplierType;

import java.util.List;

public interface SupplierTypeMapper {
    int deleteByPrimaryKey(Integer supTypeId);

    int insert(SupplierType record);

    int insertSelective(SupplierType record);

    SupplierType selectByPrimaryKey(Integer supTypeId);

    int updateByPrimaryKeySelective(SupplierType record);

    int updateByPrimaryKey(SupplierType record);

	List<SupplierType> selectAllSupplierTypes();
}