package com.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.model.PrelovedBook;
import com.model.buyerOrder;

public class buyerOrderDB {
	
	public String newOrder (buyerOrder buyerordermodel, PrelovedBook prelovedbook) throws ClassNotFoundException{
		
		
		String orderdate = buyerordermodel.getOrderDate();
		String orderstatus = buyerordermodel.getOrderStatus();
		String buyerid = buyerordermodel.getBuyerId();
		String sellerid = buyerordermodel.getSellerId();
		int quantity = buyerordermodel.getQuantity();
		double amount = buyerordermodel.getAmount();
		int bookid = buyerordermodel.getBookId();
		
		int stock = prelovedbook.getPbStock();
		
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
			preparedstatement.setString(1, orderdate);
			preparedstatement.setString(2, orderstatus);
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
			
			return "Order Added";
			
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return "Order Fail";
	}
	

}
