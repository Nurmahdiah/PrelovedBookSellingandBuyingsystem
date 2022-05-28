package com.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.model.shipmentModel;

public class sellerOrderShipmentDB {

	public String addShipment (shipmentModel shipmentmodel) throws ClassNotFoundException{
		
		//int shipmentId = shipmentmodel.getShipmentId();
		String shippingNo = shipmentmodel.getShippingNo();
		String shippingStatus = shipmentmodel.getShippingStatus();
		String shippingDate = shipmentmodel.getShippingDate();
		int orderId = shipmentmodel.getOrderId();
		String sellerId = shipmentmodel.getSellerId();
		
		
		//define variables for database connection
		String url = "jdbc:mysql://localhost:3307/PrelovedBookShop";
		String uname = "root";
		String pass = "";
		String insertQuery = "INSERT INTO Shipment (shippingNo,shippingStatus,shippingDate,orderId,sellerEmailAddress) VALUES (?, ?, ?, ?, ?)";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection(url, uname, pass);
			PreparedStatement preparedstatement = null;
			
			preparedstatement = connection.prepareStatement(insertQuery);
			
			preparedstatement.setString(1, shippingNo);
			preparedstatement.setString(2, shippingStatus);
			preparedstatement.setString(3, shippingDate);
			preparedstatement.setInt(4, orderId);
			preparedstatement.setString(5, sellerId);
			
			preparedstatement.executeUpdate();
			
			preparedstatement.close();
			
			connection.close();
			
			return "Shipment Details Added";
			
		
		}
		catch(SQLException e){
            e.printStackTrace();
        }
		return "Shipment Details Adding Fails";
	}
	
	public String updateShipment(shipmentModel shipmentmodel) throws ClassNotFoundException{
		
		int shipmentId = shipmentmodel.getShipmentId();
		String shippingNo = shipmentmodel.getShippingNo();
		String shippingStatus = shipmentmodel.getShippingStatus();
		String shippingDate = shipmentmodel.getShippingDate();
		int orderId = shipmentmodel.getOrderId();
		
		//define variables for database connection
		String url = "jdbc:mysql://localhost:3307/PrelovedBookShop";
		String uname = "root";
		String pass = "";
		String UpdateQuery = "UPDATE Shipment SET shippingNo=?, shippingStatus=?, shippingDate=? WHERE orderId=?";
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection(url,uname, pass);
			
			PreparedStatement preparedstatement = null;
			
			preparedstatement = connection.prepareStatement(UpdateQuery);
			
			preparedstatement.setString(1, shippingNo);
			preparedstatement.setString(2, shippingStatus);
			preparedstatement.setString(3, shippingDate);
			preparedstatement.setInt(4, orderId);
			
			preparedstatement.executeUpdate();
			
			preparedstatement.close();
			
			connection.close();
			
			return "Shipment Order Update Success";
		}
		catch(SQLException e){
            e.printStackTrace();
        }
		return "Shipment Order Update Fail";
		
	}
	
public String updateShipmentReceived(shipmentModel shipmentmodel) throws ClassNotFoundException{
		
		
		String shippingStatus = shipmentmodel.getShippingStatus();
		int orderId = shipmentmodel.getOrderId();
		
		//define variables for database connection
		String url = "jdbc:mysql://localhost:3307/PrelovedBookShop";
		String uname = "root";
		String pass = "";
		String UpdateQuery = "UPDATE Shipment SET shippingStatus=? WHERE orderId=?";
		
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection(url,uname, pass);
			
			PreparedStatement preparedstatement = null;
			
			preparedstatement = connection.prepareStatement(UpdateQuery);
			
			preparedstatement.setString(1, shippingStatus);
			preparedstatement.setInt(2, orderId);
			
			preparedstatement.executeUpdate();
			
			preparedstatement.close();
			
			connection.close();
			
			return "Shipment Order Update Success";
		}
		catch(SQLException e){
            e.printStackTrace();
        }
		return "Shipment Order Update Fail";
		
	}
}
