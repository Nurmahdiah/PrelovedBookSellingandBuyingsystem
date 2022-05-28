package com.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.model.buyerCartModel;
import com.model.PrelovedBook;

public class buyerCartDB {

	public String newCart (buyerCartModel buyercartmodel, PrelovedBook prelovedbook) throws ClassNotFoundException{
		
		
		String cartdate = buyercartmodel.getCartdate();
		String cartstatus = buyercartmodel.getCartstatus();
		String buyerid = buyercartmodel.getBuyerid();
		String sellerid = buyercartmodel.getSellerid();
		int quantity = buyercartmodel.getQuantity();
		double amount = buyercartmodel.getAmount();
		int bookid = buyercartmodel.getBookid();
		
		int stock = prelovedbook.getPbStock();
		//String bookids = prelovedbook.getBookId();
		
		//define variables for database connection 
		
		String url = "jdbc:mysql://localhost:3307/PrelovedBookShop";
		String uname = "root";
		String pass = "";
		String insertQuery = "INSERT INTO Orders (date, status, quantity, amount, bookId, buyerEmailAddress, sellerEmailAddress) VALUES (?, ?, ?, ?, ?, ?, ?)";
		String updateQuery = "UPDATE PrelovedBook SET stock=? WHERE Id=?";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection(url, uname, pass);
			PreparedStatement preparedstatement = null;
			
			//insert
			preparedstatement = connection.prepareStatement(insertQuery);
			preparedstatement.setString(1, cartdate);
			preparedstatement.setString(2, cartstatus);
			preparedstatement.setInt(3, quantity);
			preparedstatement.setDouble(4, amount);
			preparedstatement.setInt(5, bookid);
			preparedstatement.setString(6, buyerid);
			preparedstatement.setString(7, sellerid);
			
			
			preparedstatement.executeUpdate();
			preparedstatement.close();
			//update
			
			PreparedStatement preparedstatement2 = null;
			preparedstatement2 = connection.prepareStatement(updateQuery);
			preparedstatement2.setInt(1, stock);
			preparedstatement2.setInt(2, bookid);
			
			preparedstatement2.executeUpdate();
			preparedstatement2.close();
			
			connection.close();
			
			
			return "Cart Added";
			
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return "Cart Fail";
	}
	public String updateCart (buyerCartModel buyercartmodel, PrelovedBook prelovedbookmodel) throws ClassNotFoundException{
		
	    int quantity = buyercartmodel.getQuantity();
		double amount = buyercartmodel.getAmount();
		int orderId = buyercartmodel.getOrderid();
		int bookid = prelovedbookmodel.getBookId();
		int stock = prelovedbookmodel.getPbStock();
		
		//define variables for database connection 
		
		String url = "jdbc:mysql://localhost:3307/PrelovedBookShop";
		String uname = "root";
		String pass = "";
		String updateQuery = "Update Orders SET quantity=?, amount=? WHERE orderId=?";
		String updateQuery2 = "UPDATE PrelovedBook SET stock=? WHERE Id=?";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection(url, uname, pass);
			PreparedStatement preparedstatement = null;
			
			//update order
			preparedstatement = connection.prepareStatement(updateQuery);
			
			preparedstatement.setInt(1, quantity);
			preparedstatement.setDouble(2, amount);
			preparedstatement.setInt(3, orderId);
			
			preparedstatement.executeUpdate();
			preparedstatement.close();
			
			//update book stock 
			
			PreparedStatement preparedstatement2 = null;
			preparedstatement2 = connection.prepareStatement(updateQuery2);
			preparedstatement2.setInt(1, stock);
			preparedstatement2.setInt(2, bookid);
			
			preparedstatement2.executeUpdate();
			preparedstatement2.close();
			connection.close();
			
			return "Cart Updated";
			
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return "Cart Update Fail";
	}
}
