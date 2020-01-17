package com.denvato_v2.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.denvato_v2.models.User;
import com.denvato_v2.models.UserAuthorities;
import com.denvato_v2.models.UserDAO;

@Service
public class UserServiceImpl implements UserService
{
	@Autowired
	private UserDAO userDAO;

	@Override
	@Transactional
	public List<User> getAllUsers() 
	{
		
		return userDAO.getAllUsers();
	}

	@Override
	@Transactional
	public User getUser(String username) 
	{
		
		return userDAO.getUser(username);
	}

	@Override
	public void deleteUser(int id)
	{
		
	}

	@Override
	@Transactional
	public void saveUser(User user, UserAuthorities userAuthorities)
	{
		userDAO.saveUser(user,userAuthorities);
	}
	
	
}
