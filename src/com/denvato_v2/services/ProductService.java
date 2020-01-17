package com.denvato_v2.services;

import java.util.List;


import com.denvato_v2.models.Product;

public interface ProductService 
{
	public List<Product> getTrendingProducts();
	
	public List<Product> getAllProducts();
	
	public List<Product> getAllProductsAsAdmin();
	
	public List<Product> getMens();
	
	public List<Product> getWomens();
	
	public List<Product> getJerseys();
	
	public List<Product> getSneakers();
	
	public List<Product> getCapsAndHeadwears();
	
	public List<Product> getWatches();

	public Product getProduct(int id);

	public void saveProduct(Product product);

	public void deleteProduct(int id);	
}
