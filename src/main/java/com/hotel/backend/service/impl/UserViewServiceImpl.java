package com.hotel.backend.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hotel.backend.mapper.UserViewMapper;
import com.hotel.backend.service.UserViewService;
import com.hotel.backend.view.UserView;

@Service
public class UserViewServiceImpl implements UserViewService {
	
	@Autowired
	private UserViewMapper userViewMapper;

	@Override
	public List<UserView> getUserViewList() {
		// TODO Auto-generated method stub
		return userViewMapper.getUserViewList();
	}

	@Override
	public UserView getUserViewByUserName(String userName) {
		// TODO Auto-generated method stub
		return userViewMapper.getUserViewByUserName(userName);
	}

	@Override
	public UserView getUserViewByUserId(String userId) {
		// TODO Auto-generated method stub
		return userViewMapper.getUserViewByUserId(userId);
	}

	@Override
	public void updateUserViewById(Map<String, String> map) {
		// TODO Auto-generated method stub
		userViewMapper.updateUserViewById(map);
		
	}

	@Override
	public List<UserView> getOperatorUserViewList(String hotelId) {
		// TODO Auto-generated method stub
		return userViewMapper.getOperatorUserViewList(hotelId);
	}

}
