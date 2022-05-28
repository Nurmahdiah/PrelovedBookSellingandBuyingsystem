package com.model;

public class RegisterModel {

	private String fName;
	private String lName;
	private String uname;
	private String pass;
	private String hpno; 
	private String street;
	private String city;
	private int postcode;
	private String state;
	private String emailaddr;
	
	public RegisterModel() {
		
	}
	
	public RegisterModel(String fName, String lName,  String emailaddr) {
		super();
		this.fName = fName;
		this.lName = lName;
		this.emailaddr = emailaddr;
	}
	
	public String getfName() {
		return fName;
	}
	public void setfName(String fName) {
		this.fName = fName;
	}
	public String getlName() {
		return lName;
	}
	public void setlName(String lName) {
		this.lName = lName;
	}
	public String getUname() {
		return uname;
	}
	public void setUname(String uname) {
		this.uname = uname;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getHpno() {
		return hpno;
	}
	public void setHpno(String hpno) {
		this.hpno = hpno;
	}
	public String getStreet() {
		return street;
	}
	public void setStreet(String street) {
		this.street = street;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public int getPostcode() {
		return postcode;
	}
	public void setPostcode(int postcode) {
		this.postcode = postcode;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getEmailaddr() {
		return emailaddr;
	}
	public void setEmailaddr(String emailaddr) {
		this.emailaddr = emailaddr;
	}
}
