package com.oms.backend.mapper;

import com.oms.backend.entity.SupTyp;
import com.oms.backend.entity.SupTypKey;

public interface SupTypMapper {
    int deleteByPrimaryKey(SupTypKey key);

    int insert(SupTyp record);

    int insertSelective(SupTyp record);

    SupTyp selectByPrimaryKey(SupTypKey key);

    int updateByPrimaryKeySelective(SupTyp record);

    int updateByPrimaryKey(SupTyp record);
}