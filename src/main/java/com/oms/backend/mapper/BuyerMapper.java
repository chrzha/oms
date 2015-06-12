package com.oms.backend.mapper;

import com.oms.backend.entity.Buyer;
import org.apache.ibatis.session.RowBounds;

import java.util.List;
import java.util.Map;

public interface BuyerMapper {
    int deleteByPrimaryKey(Integer buyerId);

    int insert(Buyer record);

    int insertSelective(Buyer record);

    Buyer selectByPrimaryKey(Integer buyerId);
    
    List<Map<String, Object>> selectAll(RowBounds rowBounds);

    int updateByPrimaryKeySelective(Buyer record);

    int updateByPrimaryKey(Buyer record);
}