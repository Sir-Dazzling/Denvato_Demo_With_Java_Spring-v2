package com.denvato_v2.services;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.denvato_v2.models.Product;
import com.denvato_v2.models.ProductDAO;

@Service
public class ProductServiceImpl implements ProductService 
{
	//Injecting Product DAO
	@Autowired
	private ProductDAO productDAO;

	@Override
	@Transactional
	public List<Product> getTrendingProducts() 
	{
		
		return productDAO.getTrendingProducts();
	}

	@Override
	@Transactional
	public List<Product> getAllProducts() 
	{
		
		return productDAO.getAllProducts();
	}
	
	
	
	@Override
	@Transactional
	public List<Product> getAllProductsAsAdmin() 
	{
		return productDAO.getAllProductsAsAdmin();
	}

	@Override
	@Transactional
	public Product getProduct(int id) 
	{
		
		return productDAO.getProduct(id);
	}

	@Override
	@Transactional
	public void saveProduct(Product product) 
	{
		productDAO.saveProduct(product);
		
	}

	@Override
	@Transactional
	public void deleteProduct(int id) 
	{
		productDAO.deleteProduct(id);
	}
	
	@Override
	@Transactional
	public List<Product> getMens() 
	{
		return productDAO.getMens();
	}
	
	@Override
	@Transactional
	public List<Product> getWomens() 
	{
		// TODO Auto-generated method stub
		return productDAO.getWomens();
	}
	
	@Override
	@Transactional
	public List<Product> getJerseys() 
	{
		return productDAO.getJerseys();
	}
	
	@Override
	@Transactional
	public List<Product> getSneakers() 
	{
		return productDAO.getSneakers();
	}

	@Override
	@Transactional
	public List<Product> getCapsAndHeadwears() 
	{
		return productDAO.getCapsAndHeadwears();
	}

	@Override
	@Transactional
	public List<Product> getWatches() 
	{
		return productDAO.getWatches();
	}

}
