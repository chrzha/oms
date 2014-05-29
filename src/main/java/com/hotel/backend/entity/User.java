/*
 * Copyright (C), Acxiom Corporation  
 * FileName: User.java
 * Author:   chrzha
 * Date:     Jan 23, 2014 4:35:38 PM
 * Description: 
 * History: 
 * <author>      <time>      <version>    <desc>
 *
 */
package com.hotel.backend.entity;

/**
 * ��Simple Functional Description��<br>
 * ��Functional Description��
 * 
 * @author chrzha
 * @see
 * @since
 */
public class User {

	private String userId;
	private String userName;
	private String userPassword;
	private String email;
	private String phone;
	private String description;
	private String status;
	private String hotelId;
	private String flag;

	public String getFlag() {
		return flag;
	}

	public void setFlag(String flag) {
		this.flag = flag;
	}

	/**
	 * @return the userId
	 */
	public String getUserId() {
		return userId;
	}

	/**
	 * @param userId
	 *            the userId to set
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}

	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}

	/**
	 * @param userName
	 *            the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}

	/**
	 * @return the userPassword
	 */
	public String getUserPassword() {
		return userPassword;
	}

	/**
	 * @param userPassword
	 *            the userPassword to set
	 */
	public void setUserPassword(String userPassword) {
		this.userPassword = userPassword;
	}

	/**
	 * @return the email
	 */
	public String getEmail() {
		return email;
	}

	/**
	 * @param email
	 *            the email to set
	 */
	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the phone
	 */
	public String getPhone() {
		return phone;
	}

	/**
	 * @param phone
	 *            the phone to set
	 */
	public void setPhone(String phone) {
		this.phone = phone;
	}

	/**
	 * @return the description
	 */
	public String getDescription() {
		return description;
	}

	/**
	 * @param description
	 *            the description to set
	 */
	public void setDescription(String description) {
		this.description = description;
	}

	/**
	 * @return the statu
	 */
	public String getStatus() {
		return status;
	}

	/**
	 * @param statu
	 *            the statu to set
	 */
	public void setStatus(String status) {
		this.status = status;
	}

	/**
	 * @return the hotelId
	 */
	public String getHotelId() {
		return hotelId;
	}

	/**
	 * @param hotelId
	 *            the hotelId to set
	 */
	public void setHotelId(String hotelId) {
		this.hotelId = hotelId;
	}

}
