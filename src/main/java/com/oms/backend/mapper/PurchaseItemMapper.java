package com.oms.backend.mapper;

import com.oms.backend.entity.PurchaseItem;

public interface PurchaseItemMapper {
    int deleteByPrimaryKey(Integer purItemId);

    int insert(PurchaseItem record);

    int insertSelective(PurchaseItem record);

    PurchaseItem selectByPrimaryKey(Integer purItemId);

    int updateByPrimaryKeySelective(PurchaseItem record);

    int updateByPrimaryKey(PurchaseItem record);
}