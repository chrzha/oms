package com.oms.backend.service.impl;

import com.oms.backend.mapper.MaterialMapper;
import com.oms.backend.entity.PaginationTableInfo;
import com.oms.backend.entity.Material;
import com.oms.backend.service.MaterialService;
import com.oms.backend.utility.Utilities;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Service
public class MaterialServiceImpl implements MaterialService {

    @Override
    public List<Map<String, Object>> selectAll(PaginationTableInfo pti) {
        return null;
    }

    @Override
    public int selectAllCount(PaginationTableInfo pti) {
        return 0;
    }

    @Override
    public int insert(Material record) {
        return 0;
    }

    @Override
    public Material selectByPrimaryKey(Integer materialId) {
        return null;
    }

    @Override
    public int deleteByPrimaryKey(Integer materialId) {
        return 0;
    }

    @Override
    public int deleteByPrimaryKeys(List<Integer> materialIds) {
        return 0;
    }

    @Override
    public int updateByPrimaryKey(Material record) {
        return 0;
    }
}
