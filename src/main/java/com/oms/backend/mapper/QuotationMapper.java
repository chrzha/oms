package com.oms.backend.mapper;

import com.oms.backend.entity.Quotation;

public interface QuotationMapper {
    int deleteByPrimaryKey(Integer quotId);

    int insert(Quotation record);

    int insertSelective(Quotation record);

    Quotation selectByPrimaryKey(Integer quotId);

    int updateByPrimaryKeySelective(Quotation record);

    int updateByPrimaryKey(Quotation record);
}