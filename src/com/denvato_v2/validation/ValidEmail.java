package com.denvato_v2.validation;

import static java.lang.annotation.ElementType.ANNOTATION_TYPE;
import static java.lang.annotation.ElementType.FIELD;
import static java.lang.annotation.ElementType.METHOD;
import static java.lang.annotation.RetentionPolicy.RUNTIME;

import java.lang.annotation.Documented;
import java.lang.annotation.Retention;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

//Interface Code to validate Email entered by user in registration form.
@Target({ METHOD, FIELD, ANNOTATION_TYPE })
@Retention(RUNTIME)
/*@Repeatable(List.class)*/
@Documented
@Constraint(validatedBy = com.denvato_v2.validation.ValidEmailConstraintValidator.class)
public @interface ValidEmail 
{
	String message() default "This is not a valid email address";

	Class<?>[] groups() default { };

	Class<? extends Payload>[] payload() default { };

	int min() default 5;
}
