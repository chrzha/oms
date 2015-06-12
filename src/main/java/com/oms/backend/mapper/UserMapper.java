package com.oms.backend.mapper;

import com.oms.backend.entity.User;

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

public interface UserMapper {
	public User getUserById(String userId);
	public User getUserByUsername(String userName);
	public void updateUser(User user);
	public Integer changePwdById(Map<String, String> map);
}

