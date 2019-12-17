package com.denvato_v2.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
		
		return "index";
	}
}
