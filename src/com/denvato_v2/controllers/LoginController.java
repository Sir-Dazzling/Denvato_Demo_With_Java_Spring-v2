package com.denvato_v2.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController 
{
	@GetMapping("/showLoginPage")
	public String showLoginPage() 
	{
		return "login";
	}
	
}
