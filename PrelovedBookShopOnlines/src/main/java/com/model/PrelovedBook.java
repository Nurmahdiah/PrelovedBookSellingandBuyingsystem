package com.model;

import jakarta.servlet.http.Part;

public class PrelovedBook {

	private int bookId;
	private String pbTitle;
	private String pbAuthor;
	private int yearPublished;
	private String pbCondition;
	private String isbncode;
	private String pbGenre;
	private Part base64Image;
	private double pbPrice;
	private int pbStock;
	private String pbStatus;
	private String sellerEmail;
	private String pbsinopsis;
	
	private byte[] image;
	
	public Part getBase64Image() {
		return base64Image;
	}
	public void setBase64Image(Part base64Image) {
		this.base64Image = base64Image;
	}
	public byte[] getImage() {
		return image;
	}
	public void setImage(byte[] image) {
		this.image = image;
	}
	public int getBookId() {
		return bookId;
	}
	public void setBookId(int bookId) {
		this.bookId = bookId;
	}
	public String getPbTitle() {
		return pbTitle;
	}
	public void setPbTitle(String pbTitle) {
		this.pbTitle = pbTitle;
	}
	public String getPbAuthor() {
		return pbAuthor;
	}
	public void setPbAuthor(String pbAuthor) {
		this.pbAuthor = pbAuthor;
	}
	public int getYearPublished() {
		return yearPublished;
	}
	public void setYearPublished(int yearPublished) {
		this.yearPublished = yearPublished;
	}
	public String getPbCondition() {
		return pbCondition;
	}
	public void setPbCondition(String pbCondition) {
		this.pbCondition = pbCondition;
	}
	public String getIsbncode() {
		return isbncode;
	}
	public void setIsbncode(String isbncode) {
		this.isbncode = isbncode;
	}
	public String getPbGenre() {
		return pbGenre;
	}
	public void setPbGenre(String pbGenre) {
		this.pbGenre = pbGenre;
	}
	public double getPbPrice() {
		return pbPrice;
	}
	public void setPbPrice(double pbPrice) {
		this.pbPrice = pbPrice;
	}
	public int getPbStock() {
		return pbStock;
	}
	public void setPbStock(int pbStock) {
		this.pbStock = pbStock;
	}
	public String getPbStatus() {
		return pbStatus;
	}
	public void setPbStatus(String pbStatus) {
		this.pbStatus = pbStatus;
	}
	public String getPbsinopsis() {
		return pbsinopsis;
	}
	public void setPbsinopsis(String pbsinopsis) {
		this.pbsinopsis = pbsinopsis;
	}
	public String getSellerEmail() {
		return sellerEmail;
	}
	public void setSellerEmail(String sellerEmail) {
		this.sellerEmail = sellerEmail;
	}
}
