package com.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.model.LoginModel;

public class LoginDB {

	public String sellerLogin(LoginModel login) throws ClassNotFoundException{
		
		String email = login.getEmail();
		String pass = login.getPassword();
		
		String emailDB = "";
		String passwordDB = "";
		
		String url = "jdbc:mysql://localhost:3307/PrelovedBookShop";
		String uname = "root";
		String password = "";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection(url, uname, password);
			
			PreparedStatement preparedstatement = null;
			
			preparedstatement = connection.prepareStatement("SELECT * FROM Seller WHERE emailAddress=? AND password=?");
			preparedstatement.setString(1, email);
			preparedstatement.setString(2, pass);
			ResultSet resultset = preparedstatement.executeQuery();
			
			while(resultset.next()) {
				
				emailDB = resultset.getString("emailAddress");
				passwordDB = resultset.getString("password");
				
				if(email.equals(emailDB) && pass.equals(passwordDB)) {
					return "Seller Successfully Login";
				}
				preparedstatement.close();
				connection.close();
			}
		}
		catch(SQLException e){
            e.printStackTrace();
        } 
        return "Invalid Login";
		
	}
	
	public String buyerLogin(LoginModel login) throws ClassNotFoundException{
		
		String email = login.getEmail();
		String pass = login.getPassword();
		
		String emailDB = "";
		String passwordDB = "";
		
		String url = "jdbc:mysql://localhost:3307/PrelovedBookShop";
		String uname = "root";
		String password = "";
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection(url, uname, password);
			
			PreparedStatement preparedstatement = null;
			
			preparedstatement = connection.prepareStatement("SELECT * FROM Buyer WHERE emailAddress=? AND password=?");
			preparedstatement.setString(1, email);
			preparedstatement.setString(2,  pass);
			ResultSet resultset = preparedstatement.executeQuery();
			
			while(resultset.next()) {
				
				emailDB = resultset.getString("emailAddress");
				passwordDB = resultset.getString("password");
				
				if(email.equals(emailDB) && pass.equals(passwordDB)) {
					return "Buyer Successfully Login";
				}
				preparedstatement.close();
				connection.close();
			}
		}
		catch(SQLException e){
            e.printStackTrace();
        } 
        return "Invalid Login";
	}
	public void retrieveUser(LoginModel login) throws ClassNotFoundException{
		
		String email = login.getEmail();
		
		String url = "dbc:mysql://localhost:3307/PrelovedBookShop";
		String uname = "root";
		String password = "";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection(url, uname, password);
			Statement statement = connection.createStatement();
			ResultSet resultset = statement.executeQuery("SELECT * FROM Seller WHERE emailAddress='"+email+"'");
		}
		catch(SQLException e){
            e.printStackTrace();
        }
        
	}
}
