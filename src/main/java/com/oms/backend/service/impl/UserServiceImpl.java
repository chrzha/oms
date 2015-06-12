package com.oms.backend.service.impl;

import com.oms.backend.entity.User;
import com.oms.backend.mapper.UserMapper;
import com.oms.backend.service.UserService;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMpapper;

	/**
	 * (non-Javadoc)
	 * 
	 * @see com.oms.backend.service.UserService#getUserById(java.lang.String)
	 */
	@Override
	public User getUserById(String userId) {
		// TODO Auto-generated method stub
		return userMpapper.getUserById(userId);
	}

	/**
	 * (non-Javadoc)
	 * 
	 * @see com.oms.backend.service.UserService#getUserByUsername(java.lang.String)
	 */
	@Override
	public User getUserByUsername(String userName) {
		// TODO Auto-generated method stub
		return userMpapper.getUserByUsername(userName);
	}


	/**
	 * (non-Javadoc)
	 * 
	 * @see com.oms.backend.service.UserService#updateUser(com.oms.backend.entity.User)
	 */
	@Override
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		userMpapper.updateUser(user);

	}

	@Override
	public Integer changePwdById(Map<String, String> map) {
		// TODO Auto-generated method stub
	
		return userMpapper.changePwdById(map);
	}


}
