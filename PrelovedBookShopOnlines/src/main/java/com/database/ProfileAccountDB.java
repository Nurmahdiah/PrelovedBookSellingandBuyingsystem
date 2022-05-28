package com.database;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import com.model.RegisterModel;
import com.mysql.cj.Session;


public class ProfileAccountDB {
	
	public String sellerAccountUpdate(RegisterModel registermodel) throws ClassNotFoundException{
		
		String fname = registermodel.getfName();
		String lname = registermodel.getlName();
		String username = registermodel.getUname();
		String password = registermodel.getPass();
		String hpno = registermodel.getHpno();
		String street = registermodel.getStreet();
		String city = registermodel.getCity();
		int postcode = registermodel.getPostcode();
		String state = registermodel.getState();
		String email = registermodel.getEmailaddr();
		
		//define variables for database connection
		String url = "jdbc:mysql://localhost:3307/PrelovedBookShop";
		String uname = "root";
		String pass = "";
		String UpdateQuery = "UPDATE Seller SET firstName=?,lastName=?,username=?,password=?,phoneNo=?,street=?,city=?,postcode=?,state=? WHERE emailAddress=?";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection(url,uname, pass);
			
			PreparedStatement preparedstatement = null;
			
			preparedstatement = connection.prepareStatement(UpdateQuery);
			
			preparedstatement.setString(1,fname);
			preparedstatement.setString(2, lname);
			preparedstatement.setString(3, username);
			preparedstatement.setString(4, password);
			preparedstatement.setString(5, hpno);
			preparedstatement.setString(6, street);
			preparedstatement.setString(7, city);
			preparedstatement.setInt(8, postcode);
			preparedstatement.setString(9, state);
			preparedstatement.setString(10, email);
			
			preparedstatement.executeUpdate();
			
			preparedstatement.close();
			
			connection.close();
			
			return "Profile Account Update Success";
		}
		catch(SQLException e){
            e.printStackTrace();
        }
		return "Profile Account Update Fail";
			
	}
	
public String buyerAccountUpdate(RegisterModel registermodel) throws ClassNotFoundException{
		
		
		String fname = registermodel.getfName();
		String lname = registermodel.getlName();
		String username = registermodel.getUname();
		String password = registermodel.getPass();
		String hpno = registermodel.getHpno();
		String street = registermodel.getStreet();
		String city = registermodel.getCity();
		int postcode = registermodel.getPostcode();
		String state = registermodel.getState();
		String email = registermodel.getEmailaddr();
		
		//define variables for database connection
		String url = "jdbc:mysql://localhost:3307/PrelovedBookShop";
		String uname = "root";
		String pass = "";
		String UpdateQuery = "UPDATE Buyer SET firstName=?,lastName=?,username=?,password=?,phoneNo=?,street=?,city=?,postcode=?,state=? WHERE emailAddress=?";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection(url,uname, pass);
			
			PreparedStatement preparedstatement = null;
			
			preparedstatement = connection.prepareStatement(UpdateQuery);
			
			preparedstatement.setString(1,fname);
			preparedstatement.setString(2, lname);
			preparedstatement.setString(3, username);
			preparedstatement.setString(4, password);
			preparedstatement.setString(5, hpno);
			preparedstatement.setString(6, street);
			preparedstatement.setString(7, city);
			preparedstatement.setInt(8, postcode);
			preparedstatement.setString(9, state);
			preparedstatement.setString(10, email);
			
			preparedstatement.executeUpdate();
			
			preparedstatement.close();
			
			connection.close();
			
			return "Profile Account Update Success";
		}
		catch(SQLException e){
            e.printStackTrace();
        }
		return "Profile Account Update Fail";
			
	}
}
