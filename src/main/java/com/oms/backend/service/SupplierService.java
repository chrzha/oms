package com.oms.backend.service;

import com.oms.backend.entity.PaginationTableInfo;
import com.oms.backend.entity.Supplier;
import com.oms.backend.entity.SupplierRank;
import com.oms.backend.entity.SupplierType;

import java.util.List;
import java.util.Map;

public interface SupplierService {
    
    List<Map<String, Object>> selectAllSuppliers(PaginationTableInfo pti);

	int insert(Supplier supplier);

	int updateByPrimaryKey(Supplier supplier);

	int deleteByPrimaryKey(Integer supplierId);

	Supplier selectByPrimaryKey(Integer supplierId);

	List<SupplierType> getAllSupplierTypes();

	List<SupplierRank> getAllSupplierRanks();

	int SupplierQuantity(PaginationTableInfo pti);
}
