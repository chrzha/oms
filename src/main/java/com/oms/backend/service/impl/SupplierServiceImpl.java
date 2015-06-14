package com.oms.backend.service.impl;

import com.oms.backend.mapper.SupplierMapper;
import com.oms.backend.mapper.SupplierRankMapper;
import com.oms.backend.mapper.SupplierTypeMapper;
import com.oms.backend.entity.PaginationTableInfo;
import com.oms.backend.entity.Supplier;
import com.oms.backend.entity.SupplierRank;
import com.oms.backend.entity.SupplierType;
import com.oms.backend.service.SupplierService;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class SupplierServiceImpl implements SupplierService {
    
    @Autowired
    private SupplierMapper supplierMapper;
    
    @Autowired
    private SupplierTypeMapper supplierTypeMapper;
    
    @Autowired
    private SupplierRankMapper supplierRankMapper;

    /* (non-Javadoc)
     * @see com.haohe.srm.service.BuyerService#selectAll()
     */
    @Override
    public List<Map<String, Object>> selectAllSuppliers(PaginationTableInfo pti) {

		return null;
    }

	@Override
	public int insert(Supplier supplier) {
		return supplierMapper.insert(supplier);
	}

	@Override
	public int updateByPrimaryKey(Supplier supplier) {
		return supplierMapper.updateByPrimaryKey(supplier);
	}

	@Override
	public int deleteByPrimaryKey(Integer supplierId) {
		return supplierMapper.deleteByPrimaryKey(supplierId);
	}

	@Override
	public Supplier selectByPrimaryKey(Integer supplierId) {
		return supplierMapper.selectByPrimaryKey(supplierId);
	}

	@Override
	public List<SupplierType> getAllSupplierTypes() {
		return supplierTypeMapper.selectAllSupplierTypes();
	}

	@Override
	public List<SupplierRank> getAllSupplierRanks() {
		return supplierRankMapper.selectAllSupplierRanks();
	}

	@Override
	public int SupplierQuantity(PaginationTableInfo pti) {
		
		return 0;
	}

}
