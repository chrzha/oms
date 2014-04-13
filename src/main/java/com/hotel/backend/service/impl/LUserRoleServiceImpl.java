package com.hotel.backend.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.backend.mapper.LUserRoleMapper;
import com.hotel.backend.service.LUserRoleService;

@Service
public class LUserRoleServiceImpl implements LUserRoleService{
	
	@Autowired
	private LUserRoleMapper lUserRoleMapper;

	@Override
	public void insertLink(Map<String , String> map) {
		// TODO Auto-generated method stub
		
		lUserRoleMapper.insertLink(map);
		
		
	}

    /** (non-Javadoc)
     * @see com.hotel.backend.service.LUserRoleService#deleteLink(java.util.Map)
     */
    @Override
    public void deleteLink(Map<String, String> map) {
        // TODO Auto-generated method stub
        lUserRoleMapper.deleteLink(map);
    }

    /** (non-Javadoc)
     * @see com.hotel.backend.service.LUserRoleService#updateLink(java.util.Map)
     */
    @Override
    public void updateLink(Map<String, String> map) {
        // TODO Auto-generated method stub
        lUserRoleMapper.updateLink(map);
    }
	

}
