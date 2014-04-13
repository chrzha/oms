package com.hotel.backend.service;

import java.util.List;
import java.util.Map;

import com.hotel.backend.view.UserView;

public interface UserViewService {

	public List<UserView> getUserViewList();
	public UserView getUserViewByUserName(String userName);
	public UserView getUserViewByUserId(String userId);
	public void updateUserViewById(Map<String , String> map);
	public List<UserView> getOperatorUserViewList(String hotelId);
}
