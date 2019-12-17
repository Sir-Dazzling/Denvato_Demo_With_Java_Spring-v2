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
	ProductDAO productDAO;

	@Override
	@Transactional
	public List<Product> getTrendingProducts() 
	{
		
		return productDAO.getTrendingProducts();
	}

}
