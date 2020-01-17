package com.denvato_v2.models;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAOImpl implements UserDAO 
{
	//Injecting the Session Factory
	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private PasswordEncoder passwordEncoder;
	
	@Override
	public List<User> getAllUsers() 
	{
		//Getting the current Hibernate Session
		Session session = sessionFactory.getCurrentSession();
		
		//Creating a Query
		Query<User> query = session.createQuery("from User order by username",User.class);
		
		//Executing the query and getting the result list
		List<User> users = query.getResultList();
	
		return users;
	}

	@Override
	public User getUser(String username) 
	{
		//Getting current Hibernate Session
		Session session = sessionFactory.getCurrentSession();
		
		//Retrieving from Database using the primary Key
		User user = session.get(User.class, username);
		
		return user;
	}

	@Override
	public void saveUser(User user, UserAuthorities userAuthorities) 
	{
		//Getting current Hibernate Session
		Session session = sessionFactory.getCurrentSession();
			
		//Encoding/Encrypting Password with BCrypt
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		
		//Saving/Updating the Customer
		session.saveOrUpdate(user);
		session.saveOrUpdate(userAuthorities);
		
		System.out.println("Done!!!");
	}
	
	@Override
	public void saveUser(User user) 
	{
		//Getting current Hibernate Session
		Session session = sessionFactory.getCurrentSession();
		
		//Encoding/Encrypting Password with BCrypt
		user.setPassword(passwordEncoder.encode(user.getPassword()));
		//Saving/Updating the Customer
		session.saveOrUpdate(user);
		
		System.out.println("Done!!!");
	}
	
	@Override
	public void deleteUser(int id) 
	{
		User user  = new User();
		user.getUserAuthorities().getAuthority();
	}

	
}
