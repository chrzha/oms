package com.oms.backend.service;

import com.oms.backend.entity.User;

import java.util.List;
import java.util.Map;

public interface UserService {
	public User getUserById(String userId);
	public User getUserByUsername(String userName);
	public void updateUser(User user);
	public Integer changePwdById(Map<String, String> map);
}

