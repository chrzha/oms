/**
 * 
 */
package com.hotel.backend.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.backend.entity.ApplyInfo;
import com.hotel.backend.mapper.ApplyAdminMapper;
import com.hotel.backend.service.ApplyAdminService;

/**
 * @author chrzha
 *
 */
@Service
public class ApplyAdminServiceImpl implements ApplyAdminService{
	
	@Autowired
	private ApplyAdminMapper applyAdminMapper;

	@Override
	public List<ApplyInfo> getAllApplyList() {
		// TODO Auto-generated method stub
		return applyAdminMapper.getAllApplyList();
	}

	@Override
	public Integer getTotalCount() {
		// TODO Auto-generated method stub
		return applyAdminMapper.getTotalCount();
	}

	@Override
	public List<ApplyInfo> getApplyListByHotelId(String hotelId) {
		// TODO Auto-generated method stub
		return applyAdminMapper.getApplyListByHotelId(hotelId);
	}

	@Override
	public void deleteApplyById(Integer id) {
		// TODO Auto-generated method stub
		applyAdminMapper.deleteApplyById(id);
	}

	@Override
	public Integer addApply(ApplyInfo applyInfo) {
		// TODO Auto-generated method stub
		return applyAdminMapper.addApply(applyInfo);
	}

	@Override
	public void updateApply(ApplyInfo applyInfo) {
		// TODO Auto-generated method stub
		applyAdminMapper.updateApply(applyInfo);
		
	}

}
