package com.hotel.backend.mapper;

import java.util.Map;

/**
 * //TODO Description
 * <p>
 * Copyright (c) 2012 Acxiom Corporation. All Rights Reserved.
 * </p>
 * 
 * @author chrzha date: Apr 2, 2014
 *         <p>
 *         Last updated by chrzha date:Apr 2, 2014
 *         </p>
 */

public interface LHotelMktMapper {
    
    public void insertLink(Map<String, String> map);

    public void deleteLink(Map<String, String> map);

    public void updateLink(Map<String, String> map);
    
    public void deleteLinkByHotelId(String hotelId);

}

