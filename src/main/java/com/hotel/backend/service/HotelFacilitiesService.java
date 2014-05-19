/**
 * 
 */
package com.hotel.backend.service;

import java.util.List;
import java.util.Map;

import com.hotel.backend.entity.Facilities;

/**
 * @author chrzha
 *
 */
public interface HotelFacilitiesService {
	
	public List<Facilities> getAllFacilitiesList();

	public List<Facilities> getFacilitiesListPaged(Map<String, Integer> map);

	public List<Facilities> getFacilitiesListByHotelId(String hotelId);

	public void deleteFacilitiesById(String facilitiesId);

	public Integer addFacilities(Facilities facilities);

	public void updateFacilities(Facilities facilities);

	public Integer getTotalCount();
	
	public void changeStatusById(Map<String, String> map);

}
