/**
 * 
 */
package com.hotel.backend.mapper;

import java.util.Map;

/**
 * @author chrzha
 *
 */
public interface LHotelFacilitiesMapper {
	
    public void insertLink(Map<String, String> map);

    public void deleteLink(String facilitiesId);

    public void updateLink(Map<String, String> map);
    
    public void deleteLinkByHotelId(String hotelId);

}
