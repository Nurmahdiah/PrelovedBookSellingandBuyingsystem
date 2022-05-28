package com.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.model.RegisterModel;

public class RegisterDB {
	public String sellerRegister(RegisterModel register) throws ClassNotFoundException{
		
		
		String firstname = register.getfName();
		String lastname = register.getlName();
		String username = register.getUname();
		String password = register.getPass();
		String hpno = register.getHpno();
		String street = register.getStreet();
		String city = register.getCity();
		int postcode = register.getPostcode();
		String state = register.getState();
		String email = register.getEmailaddr();
		
		//define variables for database connection
		String url = "jdbc:mysql://localhost:3307/PrelovedBookShop";
		String uname = "root";
		String pass = "";
		String InsertQuery = "INSERT INTO Seller (firstName, lastName, username, password, phoneNo, street, city, postcode, state, emailAddress) VALUES (?,?,?,?,?,?,?,?,?,?)";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection(url,uname, pass);
			PreparedStatement preparedstatement = null;
			
			preparedstatement = connection.prepareStatement(InsertQuery);
			preparedstatement.setString(1, firstname);
			preparedstatement.setString(2, lastname);
			preparedstatement.setString(3, username);
			preparedstatement.setString(4, password);
			preparedstatement.setString(5, hpno);
			preparedstatement.setString(6,  street);
			preparedstatement.setString(7, city);
			preparedstatement.setInt(8, postcode);
			preparedstatement.setString(9, state);
			preparedstatement.setString(10, email);
			
			preparedstatement.executeUpdate();
			preparedstatement.close();
			connection.close();
			
			return "PAYMENT REQUIRED";
		
			
		}
		catch(SQLException e){
            e.printStackTrace();
        }
		return "SELLER ACCOUNT REGISTRATION FAIL";
			
	}
	
	public String buyerRegister(RegisterModel register) throws ClassNotFoundException{
		
		
		String firstname = register.getfName();
		String lastname = register.getlName();
		String username = register.getUname();
		String password = register.getPass();
		String hpno = register.getHpno();
		String street = register.getStreet();
		String city = register.getCity();
		int postcode = register.getPostcode();
		String state = register.getState();
		String email = register.getEmailaddr();
		
		//define variables for database connection
		String url = "jdbc:mysql://localhost:3307/PrelovedBookShop";
		String uname = "root";
		String pass = "";
		String InsertQuery = "INSERT INTO Buyer (firstName, lastName, username, password, phoneNo, street, city, postcode, state, emailAddress) VALUES (?,?,?,?,?,?,?,?,?,?)";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection(url, uname, pass);
			PreparedStatement preparedstatement = null;
			
			preparedstatement = connection.prepareStatement(InsertQuery);
			preparedstatement.setString(1, firstname);
			preparedstatement.setString(2, lastname);
			preparedstatement.setString(3, username);
			preparedstatement.setString(4, password);
			preparedstatement.setString(5, hpno);
			preparedstatement.setString(6,  street);
			preparedstatement.setString(7, city);
			preparedstatement.setInt(8, postcode);
			preparedstatement.setString(9, state);
			preparedstatement.setString(10, email);
			
			preparedstatement.executeUpdate();
			preparedstatement.close();
			connection.close();
			
			return "SUCCESSFULLY REGISTER AS BUYER";
		
			
		}
		catch(SQLException e){
            e.printStackTrace();
        }
		return "BUYER ACCOUNT REGISTRATION FAIL";
			
	}
}
