package com.denvato_v2.models;

import java.util.List;

public interface UserDAO
{
	public List<User> getAllUsers();
	
	public User getUser(String username);
	
	public void saveUser(User user, UserAuthorities userAuthorities);
	
	public void deleteUser(int id);

	void saveUser(User user);
}
