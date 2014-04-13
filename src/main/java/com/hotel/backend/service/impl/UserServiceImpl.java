package com.hotel.backend.service.impl;

import com.hotel.backend.entity.User;
import com.hotel.backend.mapper.UserMapper;
import com.hotel.backend.service.UserService;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * //TODO Description
 * <p>
 * Copyright (c) 2012 Acxiom Corporation. All Rights Reserved.
 * </p>
 * 
 * @author chrzha date: Mar 21, 2014
 *         <p>
 *         Last updated by chrzha date:Mar 21, 2014
 *         </p>
 */
@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private UserMapper userMpapper;

	/**
	 * (non-Javadoc)
	 * 
	 * @see com.hotel.backend.service.UserService#getUserById(java.lang.String)
	 */
	@Override
	public User getUserById(String userId) {
		// TODO Auto-generated method stub
		return userMpapper.getUserById(userId);
	}

	/**
	 * (non-Javadoc)
	 * 
	 * @see com.hotel.backend.service.UserService#getUserByUsername(java.lang.String)
	 */
	@Override
	public User getUserByUsername(String userName) {
		// TODO Auto-generated method stub
		return userMpapper.getUserByUsername(userName);
	}

	/**
	 * (non-Javadoc)
	 * 
	 * @see com.hotel.backend.service.UserService#getAllUser()
	 */
	@Override
	public List<User> getAllUser() {
		// TODO Auto-generated method stub
		return userMpapper.getAllUser();
	}

	/**
	 * (non-Javadoc)
	 * 
	 * @see com.hotel.backend.service.UserService#getUserTotalCount()
	 */
	@Override
	public Integer getUserTotalCount() {
		// TODO Auto-generated method stub
		return userMpapper.getUserTotalCount();
	}

	/**
	 * (non-Javadoc)
	 * 
	 * @see com.hotel.backend.service.UserService#updateUser(com.hotel.backend.entity.User)
	 */
	@Override
	public void updateUser(User user) {
		// TODO Auto-generated method stub
		userMpapper.updateUser(user);

	}

	/**
	 * (non-Javadoc)
	 * 
	 * @see com.hotel.backend.service.UserService#deleteUserById(java.lang.String)
	 */
	@Override
	public void deleteUserById(String userId) {
		// TODO Auto-generated method stub
		userMpapper.deleteUserById(userId);

	}

	/**
	 * (non-Javadoc)
	 * 
	 * @see com.hotel.backend.service.UserService#createUser(com.hotel.backend.entity.User)
	 */
	@Override
	public Integer createUser(User user) {
		return userMpapper.createUser(user);

	}

	@Override
	public Integer changePwdById(Map<String, String> map) {
		// TODO Auto-generated method stub
	
		return userMpapper.changePwdById(map);
	}

}
