package com.denvato_v2.controllers;

import java.util.List;

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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.denvato_v2.models.Product;
import com.denvato_v2.models.User;
import com.denvato_v2.models.UserAuthorities;
import com.denvato_v2.services.ProductService;
import com.denvato_v2.services.UserService;

@Controller
@RequestMapping("/admin")
public class AdminController 
{
	@Autowired
	private ProductService productService;
	
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
	
	@GetMapping("/home")
	public String showAdminPage() 
	{
		return "admin-home";
	}
	
	@GetMapping("/productsList")
	public String listProducts(Model model) 
	{
		//Getting all Products from DAO
		List<Product> products = productService.getAllProductsAsAdmin();
		
		//Adding products to the model
		model.addAttribute("products",products);
		
		return "list-products";
	}
	
	@GetMapping("showFormForAddingProduct")
	public String showFormForAddingProduct(Model model) 
	{
		//Creating attribute to bind form data
		Product product = new Product();
		model.addAttribute("product",product);
		
		return "product-form";
	}
	
	@PostMapping("/saveProduct")
	public String saveProduct(@ModelAttribute("product") Product product) 
	{
		//Saving the product
		productService.saveProduct(product);
		
		return "redirect:/admin/productsList";
	}
	
	@GetMapping("/showFormForProductUpdate")
	public String productUpdateForm(@RequestParam("productId")int id, Model model) 
	{
		//Getting product from database
		Product product = productService.getProduct(id);
		

		//Setting Customer as a model attribute to pre populate the form
		model.addAttribute("product",product);
		
		//Send over to our form
		return "product-form";
	}
	
	@GetMapping("/deleteProduct")
	public String deleteProduct(@RequestParam("productId") int id) 
	{
		//Deleting the Customer
		productService.deleteProduct(id);
		
		return "redirect:/admin/productsList";
	}
	
	//Directing Admin to User List
	@GetMapping("/usersList")
	public String listUsers(Model model) 
	{
		//Getting all users from DAO
		List<User> users = userService.getAllUsers();
		
		//Adding users to the model
		model.addAttribute("users",users);
		
		return "list-users";
	}
	
	@GetMapping("showFormForAddingUser")
	public String showFormForAddingUser(Model model) 
	{
		//Creating attribute to bind form data
		User user = new User();
		model.addAttribute("user",user);
		
		return "user-form";
	}
	
	@PostMapping("/saveUser")
	public String saveUser(@Valid @ModelAttribute("user") User user,BindingResult bindingResult) 
	{
		if(bindingResult.hasErrors()) 
		{
			return "user-form";
		}
		else 
		{
			UserAuthorities userAuthorities = new UserAuthorities(user.getUsername(),"ROLE_CUSTOMER");
			
			//Saving the User
			userService.saveUser(user, userAuthorities);
			
			return "redirect:/admin/usersList";
		}
			
	}
	
	@PostMapping("/saveAdminUser")
	public String saveAdminUser( @ModelAttribute("user") User user) 
	{
			//Saving the User
			userService.saveUser(user, null);
			
			return "redirect:/admin/usersList";
	}
	
	@GetMapping("/showFormForUserUpdate")
	public String userUpdateForm(@RequestParam("username")String username, Model model) 
	{
		//Getting user from database
		User user = userService.getUser(username);
		
		//Setting Customer as a model attribute to pre populate the form
		model.addAttribute("user",user);
		
		//Send over to our form
		return "user-form";
	}
	
	
}
