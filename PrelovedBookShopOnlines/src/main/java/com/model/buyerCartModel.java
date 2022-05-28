package com.model;

public class buyerCartModel {

	private String cartdate;
	private String cartstatus;
	private String buyerid;
	private String sellerid;
	private int orderid;
	private int bookid;
	private int quantity;
	private double amount;
	
	public buyerCartModel() {
		
	}

	public String getCartdate() {
		return cartdate;
	}

	public void setCartdate(String cartdate) {
		this.cartdate = cartdate;
	}

	public String getCartstatus() {
		return cartstatus;
	}

	public void setCartstatus(String cartstatus) {
		this.cartstatus = cartstatus;
	}

	public String getBuyerid() {
		return buyerid;
	}

	public void setBuyerid(String buyerid) {
		this.buyerid = buyerid;
	}

	public String getSellerid() {
		return sellerid;
	}

	public void setSellerid(String sellerid) {
		this.sellerid = sellerid;
	}

	public int getOrderid() {
		return orderid;
	}

	public void setOrderid(int orderid) {
		this.orderid = orderid;
	}

	public int getBookid() {
		return bookid;
	}

	public void setBookid(int bookid) {
		this.bookid = bookid;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}
	
}
