package com.denvato_v2.controllers;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.denvato_v2.models.User;
import com.denvato_v2.models.UserAuthorities;
import com.denvato_v2.services.UserService;

@Controller
public class RegistrationController 
{
	@Autowired
	private UserService userService;
	
	//Adding an InitBinder ... to trim input Strings;
	@InitBinder
	public void initBinder(WebDataBinder dataBinder) 
	{
		//Removing leading and trailing whitespaces.
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
			
		//resolve issue for validation
		dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}
	
	//To display User Registration Page
	@GetMapping("/showRegistrationPage")
	public String showRegistrationPage(Model model) 
	{
		model.addAttribute("user", new User());
		return "register";
	}
	
	//To Process User Registration Form
	@PostMapping("/processRegistrationForm")
	public String processRegistrationForm(@Valid @ModelAttribute("user") User user, BindingResult bindingResult) 
	{
		if(bindingResult.hasErrors()) 
		{
			return "register";
		}
		else 
		{
			UserAuthorities userAuthorities = new UserAuthorities(user.getUsername(),"ROLE_CUSTOMER");
			
			//Saving the User
			userService.saveUser(user, userAuthorities);
			
			return "login";
		}
	}
}
