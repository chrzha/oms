/**
 * 
 */
package com.hotel.backend.mapper;

import java.util.List;

import com.hotel.backend.entity.ApplyInfo;

/**
 * @author chrzha
 *
 */
public interface ApplyAdminMapper {
	public List<ApplyInfo> getAllApplyList();
	public Integer getTotalCount();
	public List<ApplyInfo> getApplyListByHotelId(String hotelId);
	public void deleteApplyById(Integer id);
	public Integer addApply(ApplyInfo applyInfo);
	public void updateApply(ApplyInfo applyInfo);

}
