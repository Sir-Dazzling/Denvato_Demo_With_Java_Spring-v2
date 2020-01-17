package com.denvato_v2.services;

import java.util.List;

import com.denvato_v2.models.User;
import com.denvato_v2.models.UserAuthorities;

public interface UserService 
{
	public List<User> getAllUsers();

	public User getUser(String username);

	public void deleteUser(int id);
	
	public void saveUser(User user, UserAuthorities userAuthorities);

}
