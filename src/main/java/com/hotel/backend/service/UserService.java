package com.hotel.backend.service;

import com.hotel.backend.entity.User;

import java.util.List;
import java.util.Map;

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

public interface UserService {
	public User getUserById(String userId);
	public User getUserByUsername(String userName);
	public List<User> getAllUser();
	public Integer getUserTotalCount();
	public void updateUser(User user);
	public void deleteUserById(String userId);
	public Integer createUser(User user);
	public Integer changePwdById(Map<String, String> map);
	public User getAdminByFoodId(String foodId);

}

