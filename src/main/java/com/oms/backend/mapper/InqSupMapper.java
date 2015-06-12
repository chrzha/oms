package com.oms.backend.mapper;

import com.oms.backend.entity.InqSup;
import com.oms.backend.entity.InqSupKey;

public interface InqSupMapper {
    int deleteByPrimaryKey(InqSupKey key);

    int insert(InqSup record);

    int insertSelective(InqSup record);

    InqSup selectByPrimaryKey(InqSupKey key);

    int updateByPrimaryKeySelective(InqSup record);

    int updateByPrimaryKey(InqSup record);
}