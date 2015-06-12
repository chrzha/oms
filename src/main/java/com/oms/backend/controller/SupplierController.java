package com.oms.backend.controller;

import com.oms.backend.entity.PaginationTableInfo;
import com.oms.backend.entity.Supplier;
import com.oms.backend.entity.SupplierRank;
import com.oms.backend.entity.SupplierType;
import com.oms.backend.service.SupplierService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.HashMap;
import java.util.List;
import java.util.Map;


/**
 * This is the FE call entry.
 * FE call these web service and get data to display in UI
 */ 
@Controller
@RequestMapping("supplier")
public class SupplierController { 
	
	@Autowired
    private SupplierService supplierService;
	
	@RequestMapping(value="/view/main", method= RequestMethod.GET )
	public String viewMain(){
		 return "supplier_main";
	}
     
	@ResponseBody
	@RequestMapping(value="list", method= RequestMethod.GET, produces="application/json" )
	public Map<String, Object> list(PaginationTableInfo pti){
		
		List<Map<String,Object>> rows = supplierService.selectAllSuppliers(pti);
		
		int total = supplierService.SupplierQuantity(pti); 
		
		Map<String, Object> retMap = new HashMap<String, Object>();
		retMap.put("total", total);
		retMap.put("rows", rows);

		return retMap;
	}
	
	@RequestMapping(value = "/create", method = RequestMethod.POST)
	public String create(Supplier supplier) {
		if (null == supplier.getSupplierId()) {
			supplierService.insert(supplier);
		} else {
			supplierService.updateByPrimaryKey(supplier);
		}

		return "supplier_main";
	}

	@ResponseBody
	@RequestMapping(value = "/retrieve/{supplierId}", method = RequestMethod.GET)
	public Supplier retrieve(@PathVariable("supplierId") Integer supplierId) {
		Supplier supplier = supplierService.selectByPrimaryKey(supplierId);

		return supplier;
	}

	@RequestMapping(value = "/delete/{supplierId}", method = RequestMethod.GET)
	public String delete(@PathVariable("supplierId") String supplierId) {
		supplierService.deleteByPrimaryKey(Integer.valueOf(supplierId));

		return "supplier_main";
	}
	
	@ResponseBody
	@RequestMapping(value = "types", method = RequestMethod.GET, produces = "application/json")
	public List<SupplierType> getAllSupplierTypes() {
		List<SupplierType> supplierTypeList = supplierService.getAllSupplierTypes();
		
		return supplierTypeList;
	}
	
	@ResponseBody
	@RequestMapping(value = "ranks", method = RequestMethod.GET, produces = "application/json")
	public List<SupplierRank> getAllSupplierRanks() {
		List<SupplierRank> supplierRankList = supplierService.getAllSupplierRanks();
		
		return supplierRankList;
	}
	 
}
