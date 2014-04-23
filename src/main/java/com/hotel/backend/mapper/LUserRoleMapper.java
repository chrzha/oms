package com.hotel.backend.mapper;

import java.util.Map;

public interface LUserRoleMapper {
	
    public void insertLink(Map<String, String> map);

    public void deleteLink(String userId);

    public void updateLink(Map<String, String> map);
	

}
