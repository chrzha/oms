package com.oms.backend.service.impl;

import com.oms.backend.mapper.GenderMapper;
import com.oms.backend.entity.Gender;
import com.oms.backend.service.GenderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class GenderServiceImpl implements GenderService {
    
    @Autowired
    private GenderMapper genderMapper;

    /* (non-Javadoc)
     * @see com.haohe.srm.service.BuyerService#selectAll()
     */
    @Override
    public List<Gender> selectAll() {
        return genderMapper.selectAll();
    }

}
