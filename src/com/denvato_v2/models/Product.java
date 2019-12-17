package com.denvato_v2.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "product")
public class Product 
{
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "id")
	private int id;
	
	@Column(name = "product_name")
	private String productName;
	
	@Column(name = "category")
	private String category;
	
	@Column(name = "price")
	private double price;
	
	@Column(name = "stock_quantity")
	private int stockQuantity;
	
	@Column(name = "rating")
	private int rating;
	
	@Column(name = "imageUrl")
	private String imageUrl;
	
	@Column(name = "trending")
	private boolean trending;

	public Product() 
	{
		//Default Constructor
	}


	public Product(String productName, String category, double price, int stockQuantity, int rating, String imageUrl,
			boolean trending) 
	{
		this.productName = productName;
		this.category = category;
		this.price = price;
		this.stockQuantity = stockQuantity;
		this.rating = rating;
		this.imageUrl = imageUrl;
		this.trending = trending;
	}

	
	
	public int getId() {
		return id;
	}


	public void setId(int id) {
		this.id = id;
	}


	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public double getPrice() {
		return price;
	}


	public void setPrice(double price) {
		this.price = price;
	}


	public int getStockQuantity() {
		return stockQuantity;
	}


	public void setStockQuantity(int stockQuantity) {
		this.stockQuantity = stockQuantity;
	}


	public int getRating() {
		return rating;
	}


	public void setRating(int rating) {
		this.rating = rating;
	}


	public String getImageUrl() {
		return imageUrl;
	}


	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}


	public boolean isTrending() {
		return trending;
	}


	public void setTrending(boolean trending) {
		this.trending = trending;
	}


	@Override
	public String toString() {
		return "Product [id=" + id + ", productName=" + productName + ", category=" + category + ", price=" + price
				+ ", stockQuantity=" + stockQuantity + ", rating=" + rating + ", imageUrl=" + imageUrl + ", trending="
				+ trending + "]";
	}
	
}
