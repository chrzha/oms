package com.oms.backend.service.impl;

import com.oms.backend.mapper.BuyerMapper;
import com.oms.backend.entity.Buyer;
import com.oms.backend.service.BuyerService;
import com.oms.backend.utility.Utilities;
import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;

@Service
public class BuyerServiceImpl implements BuyerService {

    @Autowired
    private BuyerMapper buyerMapper;

    /*
     * (non-Javadoc)
     * @see com.haohe.srm.service.BuyerService#selectAll()
     */
    @Override
    public List<Map<String, Object>> selectAll(int offset, int limit) {
        RowBounds rowBounds = new RowBounds(offset,limit);
        return Utilities.camelcase(buyerMapper.selectAll(rowBounds));
    }

    /* (non-Javadoc)
     * @see com.haohe.srm.service.BuyerService#insert(com.haohe.srm.model.Buyer)
     */
    @Override
    public int insert(Buyer buyer) {
        return buyerMapper.insert(buyer);
    }

    /* (non-Javadoc)
     * @see com.haohe.srm.service.BuyerService#selectByPrimaryKey(java.lang.Integer)
     */
    @Override
    public Buyer selectByPrimaryKey(Integer buyerId) {
        return buyerMapper.selectByPrimaryKey(buyerId);
    }

    /* (non-Javadoc)
     * @see com.haohe.srm.service.BuyerService#deleteByPrimaryKey(java.lang.Integer)
     */
    @Override
    public int deleteByPrimaryKey(Integer buyerId) {
        return buyerMapper.deleteByPrimaryKey(buyerId);
    }

    /* (non-Javadoc)
     * @see com.haohe.srm.service.BuyerService#updateByPrimaryKey(com.haohe.srm.model.Buyer)
     */
    @Override
    public int updateByPrimaryKey(Buyer record) {
        return buyerMapper.updateByPrimaryKey(record);
    }

}
