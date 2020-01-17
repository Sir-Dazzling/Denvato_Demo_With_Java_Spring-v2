package com.denvato_v2.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CartController 
{
	@GetMapping("/check_out")
	public String showCheckoutPage() 
	{
		return "checkout";
	}
	
	@GetMapping("/pay")
	public String showPaymentPage() 
	{
		return "payment";
	}
}
