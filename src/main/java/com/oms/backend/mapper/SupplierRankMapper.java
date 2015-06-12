package com.oms.backend.mapper;

import com.oms.backend.entity.SupplierRank;

import java.util.List;

public interface SupplierRankMapper {
    int deleteByPrimaryKey(Integer supRankId);

    int insert(SupplierRank record);

    int insertSelective(SupplierRank record);

    SupplierRank selectByPrimaryKey(Integer supRankId);

    int updateByPrimaryKeySelective(SupplierRank record);

    int updateByPrimaryKey(SupplierRank record);

	List<SupplierRank> selectAllSupplierRanks();
}