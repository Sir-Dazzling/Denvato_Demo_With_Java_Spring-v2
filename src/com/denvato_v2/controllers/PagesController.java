package com.denvato_v2.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.denvato_v2.models.Product;
import com.denvato_v2.services.ProductService;

@Controller
public class PagesController 
{
	@Autowired
	private ProductService productService;
	
	@GetMapping("/")
	public String showIndexPage(Model model) 
	{
		//Getting Products from DAO
		List<Product> products = productService.getTrendingProducts();
		
		//Adding products to the model
		model.addAttribute("products",products);	
		return "home";
	}
	
	//Link to display all Products Page
	@GetMapping("/allProducts")
	public String showAllProducts(Model model) 
	{
		try 
		{
			//Retrieving from the Database
			List<Product> products = productService.getAllProducts();
			
			//Adding products to the model
			model.addAttribute("products", products);
		} 
		catch(DataAccessException e) 
		{
			return "error";
		}
		
		return "all-products";
	}
	
	//Link to display all Mens Products Page
	@GetMapping("/showMens")
	public String showAllMens(Model model) 
	{
		try 
		{
			//Retrieving from the Database
			List<Product> products = productService.getMens();
			
			//Adding products to the model
			model.addAttribute("products", products);
		} 
		catch(DataAccessException e) 
		{
			return "error";
		}
		
		return "all-products";
	}
	
	//Link to display all Womens Products Page
	@GetMapping("/showWomens")
	public String showAllWomens(Model model) 
	{
		try 
		{
			//Retrieving from the Database
			List<Product> products = productService.getWomens();
			
			//Adding products to the model
			model.addAttribute("products", products);
		} 
		catch(DataAccessException e) 
		{
			return "error";
		}
		
		return "all-products";
	}
	
	//Link to display all Jerseys 
	@GetMapping("/showJerseys")
	public String showAllJerseys(Model model) 
	{
		try 
		{
			//Retrieving from the Database
			List<Product> products = productService.getJerseys();
			
			//Adding products to the model
			model.addAttribute("products", products);
		} 
		catch(DataAccessException e) 
		{
			return "error";
		}
		
		return "all-products";
	}
	
	//Link to display all Sneakers
	@GetMapping("/showSneakers")
	public String showAllSneakers(Model model)
	{
		try 
		{
			//Retrieving from the Database
			List<Product> products = productService.getSneakers();
			
			//Addig products to the model
			model.addAttribute("products", products);
		} 
		catch(DataAccessException e)
		{
			return "error";
		}
		
		return "all-products";
	}
	
	//Link to display all Caps and HeadWears
	@GetMapping("/showCapsAndHeadwears")
	public String showAllCapsAndHeadwears(Model model)
	{
		try 
		{
			//Retrieving from the Database
			List<Product> products = productService.getCapsAndHeadwears();
				
			//Adding products to the model
			model.addAttribute("products", products);
		} 
		catch(DataAccessException e)
		{
			return "error";
		}
			
		return "all-products";
	}
	
	//Link to display all Watches
	@GetMapping("/showWatches")
	public String showAllWatches(Model model)
	{
		try 
		{
			//Retrieving from the Database
			List<Product> products = productService.getWatches();
				
			//Adding products to the model
			model.addAttribute("products", products);
		} 
		catch(DataAccessException e)
		{
			return "error";
		}
			
		return "all-products";
	}
	
	//Link to display Access Denied Page
	@GetMapping("/access-denied")
	public String showAcessDenied() 
	{
		return "access-denied";
	}
}
