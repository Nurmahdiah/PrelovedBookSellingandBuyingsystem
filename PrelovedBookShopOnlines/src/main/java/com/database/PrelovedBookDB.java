package com.database;

import java.sql.Connection;
import java.sql.DriverManager;

public class PrelovedBookDB {

	static String url = "jdbc:mysql://localhost:3307/PrelovedBookShop";
	static String uname = "root";
	static String pass = "";
	
	public static Connection getConnection() {
		Connection connection = null;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			connection = DriverManager.getConnection(url,uname,pass);
			
			
		}
		catch(Exception e) {
			System.out.println(e);
			e.printStackTrace();
		}
		return connection;
	}
}
