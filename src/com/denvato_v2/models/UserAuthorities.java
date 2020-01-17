package com.denvato_v2.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "authorities")
public class UserAuthorities 
{
	@Id
	@Column(name = "username")
	private String username;
	
	@Column(name = "authority")
	private String authority = "ROLE_CUSTOMER";

	public UserAuthorities() 
	{
		//Default Constructor
	}

	public UserAuthorities(String username, String authority) 
	{
		this.username = username;
		this.authority = authority;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getAuthority() {
		return authority;
	}

	public void setAuthority(String authority) {
		this.authority = authority;
	}

	@Override
	public String toString() {
		return "UserAuthorities [username=" + username + ", authority=" + authority + "]";
	}
		
}
