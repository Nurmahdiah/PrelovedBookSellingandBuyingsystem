package com.database;

import com.model.LoginModel;
import java.sql.*;
import java.sql.DriverManager;

public class ForgetPasswordDB {
	
	public String sellerResetPassword(LoginModel login) throws ClassNotFoundException{
		String email = login.getEmail();
		String password = login.getPassword();
		
		String url = "jdbc:mysql://localhost:3307/PrelovedBookShop";
		String uname = "root";
		String pass = "";
		
		String SelectQuery = "SELECT * FROM Seller WHERE emailAddress='"+email+"'";
		String UpdateQuery = "UPDATE Seller SET password='"+password+"' WHERE emailAddress='"+email+"'";
		

		try {
			
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection(url, uname, pass);
			
			Statement statement = connection.createStatement();
			ResultSet resultset = statement.executeQuery(SelectQuery);
			
			while(resultset.next()) {
				
				statement.executeUpdate(UpdateQuery);
				
				return "PASSWORD RESET SUCCESS";
				
			}
			resultset.close();
			connection.close();
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return "Please Try Again";
	}
	public String buyerResetPassword(LoginModel login) throws ClassNotFoundException{
		String email = login.getEmail();
		String password = login.getPassword();
		
		String url = "jdbc:mysql://localhost:3307/PrelovedBookShop";
		String uname = "root";
		String pass = "";
		
		String SelectQuery = "SELECT * FROM Buyer WHERE emailAddress='"+email+"'";
		String UpdateQuery = "UPDATE Buyer SET password='"+password+"' WHERE emailAddress='"+email+"'";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection(url, uname, pass);
			
			Statement statement = connection.createStatement();
			ResultSet resultset = statement.executeQuery(SelectQuery);
			
			while(resultset.next()) {
				
				statement.executeUpdate(UpdateQuery);
				
				return "PASSWORD RESET SUCCESS";
			}
			resultset.close();
			connection.close();
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return "Please Try Again";
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
