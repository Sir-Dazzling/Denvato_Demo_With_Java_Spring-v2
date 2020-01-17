package com.denvato_v2.models;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.denvato_v2.validation.ValidEmail;

@Entity
@Table(name = "users")
public class User 
{
	@Id
	@Column(name = "username")
	@NotNull(message="Your Username is required")
	@Size(min=5,max=15, message="Username must be between 5 and 15 characters long")
	private String username;
	
	@Column(name = "password")
	@NotNull
	@Size(min=5,max=100, message="Password must be between 5 and 100 characters long")
	private String password;
	
	@Column(name = "firstname")
	@NotNull
	@Size(min = 1, message = "is required")
	private String firstName;
	
	@Column(name = "lastname")
	@NotNull
	@Size(min = 1, message = "is required")
	private String lastName;
	
	@Column(name = "email")
	@ValidEmail(min = 6)
	private String email;
	
	@Column(name = "gender")
	private String gender;
	
	@Column(name = "phoneno")
	@NotNull(message = "is required")
	@Size(min = 11, max = 11, message = "Must be Exactly 11 digits")
	private String phoneno;
	
	@Column(name = "enabled")
	private boolean enabled = true;
	
	@OneToOne(cascade = CascadeType.ALL)
	@JoinColumn(name = "username")
	private UserAuthorities userAuthorities;

	public User() 
	{
		//Default Constructor
	}

	public User(String username, String password, String firstName, String lastName, String email, String gender,
			String phoneno, Boolean enabled) 
	{
		this.username = username;
		this.password = password;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.gender = gender;
		this.phoneno = phoneno;
		this.enabled = enabled;
	}


	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhoneno() {
		return phoneno;
	}

	public void setPhoneno(String phoneno) {
		this.phoneno = phoneno;
	}

	
	public boolean isEnabled() {
		return enabled;
	}

	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}

	public UserAuthorities getUserAuthorities() {
		return userAuthorities;
	}

	public void setUserAuthorities(UserAuthorities userAuthorities) {
		this.userAuthorities = userAuthorities;
	}

	@Override
	public String toString() {
		return "User [username=" + username + ", password=" + password + ", firstName=" + firstName + ", lastName="
				+ lastName + ", email=" + email + ", gender=" + gender + ", phoneno=" + phoneno + ", enabled=" + enabled
				+ ", userAuthorities=" + userAuthorities + "]";
	}
	
	
}
