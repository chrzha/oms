package com.oms.backend.mapper;

import com.oms.backend.entity.InquiryOrder;

public interface InquiryOrderMapper {
    int deleteByPrimaryKey(Integer inqId);

    int insert(InquiryOrder record);

    int insertSelective(InquiryOrder record);

    InquiryOrder selectByPrimaryKey(Integer inqId);

    int updateByPrimaryKeySelective(InquiryOrder record);

    int updateByPrimaryKeyWithBLOBs(InquiryOrder record);

    int updateByPrimaryKey(InquiryOrder record);
}