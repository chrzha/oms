package com.hotel.backend.service;

import java.util.Map;

public interface LUserRoleService {

	public void insertLink(Map<String , String> map);
	
    public void deleteLink(String userId);

    public void updateLink(Map<String, String> map);
}
