package com.oms.backend.mapper;

import com.oms.backend.entity.Supplier;
import org.apache.ibatis.session.RowBounds;

import java.util.List;
import java.util.Map;

public interface SupplierMapper {
    int deleteByPrimaryKey(Integer supplierId);

    int insert(Supplier record);

    int insertSelective(Supplier record);

    Supplier selectByPrimaryKey(Integer supplierId);

    int updateByPrimaryKeySelective(Supplier record);

    int updateByPrimaryKey(Supplier record);
    
    List<Map<String, Object>> selectAllSuppliers(Map<String, String> paramMap, RowBounds rowBounds);

	int selectTotalCount(Map<String, String> paramMap);
}