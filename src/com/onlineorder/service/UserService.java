package com.onlineorder.service;

import java.sql.SQLException;

import com.onlineorder.domain.User;

public interface UserService {
		
	public boolean register(User user);
	
	//user active
	public boolean active(String activeCode);

	public boolean checkUsername(String username);

	public User login(String username, String password) throws SQLException;

	public User getUser(String uid);
}
