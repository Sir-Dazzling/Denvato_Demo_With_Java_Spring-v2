package com.denvato_v2.validation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class ValidEmailConstraintValidator implements ConstraintValidator<ValidEmail, String> 
{
	private int min;

	@Override
	public void initialize(ValidEmail constraintAnnotation) 
	{
		min = constraintAnnotation.min();
	}

	@Override
	public boolean isValid(String email, ConstraintValidatorContext context) 
	{
		
		if(email.length() >= min) 
		{
			return true;
		}
		else 
		{
			return false;
		}
		
	}
	
	
}
