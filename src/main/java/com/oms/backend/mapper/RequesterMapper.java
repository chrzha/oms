package com.oms.backend.mapper;

import com.oms.backend.entity.Requester;

public interface RequesterMapper {
    int deleteByPrimaryKey(Integer requesterId);

    int insert(Requester record);

    int insertSelective(Requester record);

    Requester selectByPrimaryKey(Integer requesterId);

    int updateByPrimaryKeySelective(Requester record);

    int updateByPrimaryKey(Requester record);
}