package net.codejava;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class paymentDB {
	
public String newPayment (OrderDetail orderdetailmodel) throws ClassNotFoundException{
		
		
		
		String paymentamount = orderdetailmodel.getTotal();
		int orderid = orderdetailmodel.getOrderId();

		
		//define variables for database connection 
		
		String url = "jdbc:mysql://localhost:3307/PrelovedBookShop";
		String uname = "root";
		String pass = "";
		String insertQuery = "INSERT INTO Payment (paymentAmount, Idorder) VALUES (?, ?)";
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection(url, uname, pass);
			PreparedStatement preparedstatement = null;
			
			preparedstatement = connection.prepareStatement(insertQuery);
			preparedstatement.setString(1, paymentamount);
			preparedstatement.setInt(2, orderid);
			
			preparedstatement.executeUpdate();
			preparedstatement.close();
			connection.close();
			
			return "Payment Added";
			
			
		}
		catch(SQLException e) {
			e.printStackTrace();
		}
		return "Payment Fail";
	}

}
