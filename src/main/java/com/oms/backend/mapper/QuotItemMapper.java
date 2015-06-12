package com.oms.backend.mapper;

import com.oms.backend.entity.QuotItem;

public interface QuotItemMapper {
    int deleteByPrimaryKey(Integer quotItemId);

    int insert(QuotItem record);

    int insertSelective(QuotItem record);

    QuotItem selectByPrimaryKey(Integer quotItemId);

    int updateByPrimaryKeySelective(QuotItem record);

    int updateByPrimaryKey(QuotItem record);
}