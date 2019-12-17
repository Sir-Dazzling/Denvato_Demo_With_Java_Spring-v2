package com.denvato_v2.models;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAOImpl implements ProductDAO 
{
	//Injecting the Session Factory
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Product> getTrendingProducts()
	{
		//Getting the current Hibernate Session
		Session session = sessionFactory.getCurrentSession();
		
		//Creating a Query
		Query<Product> query = session.createQuery("from Product where trending=1 order by rating DESC",Product.class);
		
		//Executing the Query and getting the result list
		List<Product> products = query.getResultList();
		
		//returning the results
		return products;
	}
}
