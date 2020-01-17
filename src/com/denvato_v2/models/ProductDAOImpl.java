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
	
	
	//Getting All products from Database
	@Override
	public List<Product> getAllProducts() 
	{
		//Getting The current Hibernate Session
		Session session = sessionFactory.getCurrentSession();
			
		//Creating a Query
		Query<Product> query = session.createQuery("from Product order by rating DESC",Product.class);
			
		//Executing the Query and getting the result List
		List<Product> products = query.getResultList();
			
		//Returning the results
		return products;
	}
	
	@Override
	public List<Product> getAllProductsAsAdmin()
	{
		//Getting The current Hibernate Session
		Session session = sessionFactory.getCurrentSession();
					
		//Creating a Query
		Query<Product> query = session.createQuery("from Product order by product_name ",Product.class);
					
		//Executing the Query and getting the result List
		List<Product> products = query.getResultList();
					
		//Returning the results
		return products;
	}



	//Getting all Trending products from Database
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
	
	@Override
	public Product getProduct(int id) 
	{
		//Getting Current Hibernate Session
		Session session = sessionFactory.getCurrentSession();
				
		//Retrieving from Database using the primary Key
		Product product = session.get(Product.class, id);
		
		return product;
	}

	@Override
	public void saveProduct(Product product) 
	{
		//Getting current Hibernate Session
		Session session = sessionFactory.getCurrentSession();
				
		//Saving/Updating the Customer
		session.saveOrUpdate(product);
		
	}

	@Override
	public void deleteProduct(int id) 
	{
		//Getting Current Hibernate Session
		Session session = sessionFactory.getCurrentSession();
		
		//Deleting from Database using the primary key
		Query query = session.createQuery("delete from Product where id=:productId");
		query.setParameter("productId", id).executeUpdate();	
	}
	
	//Getting all Mens products from Database
	@Override
	public List<Product> getMens() 
	{
		// Getting the current Hibernate Session
		Session session = sessionFactory.getCurrentSession();
		
		//Creating a Query
		Query<Product> query = session.createQuery("from Product where category='Mens' order by rating DESC",Product.class);
		
		//Executing the Query and getting the result list
		List<Product> products = query.getResultList();
		
		//Returning the results
		
		return products;
	}
	
	@Override
	public List<Product> getWomens() 
	{
		// Getting the current Hibernate Session
		Session session = sessionFactory.getCurrentSession();
				
		//Creating a Query
		Query<Product> query = session.createQuery("from Product where category='Womens' order by rating DESC",Product.class);
				
		//Executing the Query and getting the result list
		List<Product> products = query.getResultList();
				
		//Returning the results		
		return products;
	}

	@Override
	public List<Product> getJerseys() 
	{
		// Getting the current Hibernate Session
		Session session = sessionFactory.getCurrentSession();
		
		//Creating a Query
		Query<Product> query = session.createQuery("from Product where category='Jerseys' order by rating DESC",Product.class);
		
		//Executing the Query and getting the result list
		List<Product> products = query.getResultList();
		
		//Returning the results
		return products;
	}
	
	@Override
	public List<Product> getSneakers() 
	{
		//Getting the current Hibernate Session
		Session session = sessionFactory.getCurrentSession();
		
		//Creating a Query
		Query<Product> query = session.createQuery("from Product where category='Sneakers' order by rating DESC",Product.class);
		
		//Executing the Query and getting the result list
		List<Product> products = query.getResultList();
		
		//Returning the results
		return products;
	}

	@Override
	public List<Product> getCapsAndHeadwears() 
	{
		//Getting the current Hibernate Session
		Session session = sessionFactory.getCurrentSession();
				
		//Creating a Query
		Query<Product> query = session.createQuery("from Product where category='Caps_Headwears' order by rating DESC",Product.class);
				
		//Executing the Query and getting the result list
		List<Product> products = query.getResultList();
				
		//Returning the results
		return products;
	}

	@Override
	public List<Product> getWatches() 
	{
		//Getting the current Hibernate Session
		Session session = sessionFactory.getCurrentSession();
				
		//Creating a Query
		Query<Product> query = session.createQuery("from Product where category='Watches' order by rating DESC",Product.class);
				
		//Executing the Query and getting the result list
		List<Product> products = query.getResultList();
				
		//Returning the results
		return products;
	}

	


}
