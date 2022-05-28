package com.database;


import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.model.PrelovedBook;

import jakarta.servlet.http.Part;

public class PrelovedBookSeller {

	
	public String sellerInsertPrelovedBook(PrelovedBook prelovedbookmodel) throws ClassNotFoundException{
	
	
		
		String btitle = prelovedbookmodel.getPbTitle();
		String bauthor = prelovedbookmodel.getPbTitle();
		int yearpublished = prelovedbookmodel.getYearPublished();
		String bcond = prelovedbookmodel.getPbCondition();
		String isbncode = prelovedbookmodel.getIsbncode();
		String bgenre = prelovedbookmodel.getPbGenre();
		Part bpict = prelovedbookmodel.getBase64Image();
		if( bpict != null) {
			try {
				InputStream bpicture = bpict.getInputStream();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		double bprice = prelovedbookmodel.getPbPrice();
		int bstock = prelovedbookmodel.getPbStock();
		String status = prelovedbookmodel.getPbStatus();
		String selleremail = prelovedbookmodel.getSellerEmail();
		String synopsis = prelovedbookmodel.getPbsinopsis();
		
		String url = "jdbc:mysql://localhost:3307/PrelovedBookShop";
		String uname = "root";
		String pass = "";
		String InsertQuery = "INSERT INTO PrelovedBook (bookTitle, bookAuthor, yearPublished, bookCondition, isbnCode, bookGenre, bookPict, price, stock, status, sellerEmail, synopsis) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";


		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection(url,uname, pass);
			PreparedStatement preparedstatement = null;
			
			preparedstatement = connection.prepareStatement(InsertQuery);
			preparedstatement.setString(1, btitle);
			preparedstatement.setString(2, bauthor);
			preparedstatement.setInt(3, yearpublished);
			preparedstatement.setString(4, bcond);
			preparedstatement.setString(5, isbncode);
			preparedstatement.setString(6, bgenre);
			preparedstatement.setBlob(7, (Blob) bpict);
			preparedstatement.setDouble(8, bprice);
			preparedstatement.setInt(9, bstock);
			preparedstatement.setString(10, status);
			preparedstatement.setString(11, selleremail);
			preparedstatement.setString(12, synopsis);
			
			preparedstatement.executeUpdate();
			preparedstatement.close();
			connection.close();
			
			return "Add Preloved Book Success";
			
		}
		catch(SQLException e){
            e.printStackTrace();
        }
		return "Add Preloved Book Fail";
	}
	
	public String sellerUpdatePrelovedBook(PrelovedBook prelovedbookmodel) throws ClassNotFoundException{
		
		String btitle = prelovedbookmodel.getPbTitle();
		String bauthor = prelovedbookmodel.getPbTitle();
		int yearpublished = prelovedbookmodel.getYearPublished();
		String bcond = prelovedbookmodel.getPbCondition();
		String isbncode = prelovedbookmodel.getIsbncode();
		String bgenre = prelovedbookmodel.getPbGenre();
		Part bpict = prelovedbookmodel.getBase64Image();
		double bprice = prelovedbookmodel.getPbPrice();
		int bstock = prelovedbookmodel.getPbStock();
		String status = prelovedbookmodel.getPbStatus();
		String selleremail = prelovedbookmodel.getSellerEmail();
		String synopsis = prelovedbookmodel.getPbsinopsis();
		
		//define variables for database connection
		String url = "jdbc:mysql://localhost:3307/PrelovedBookShop";
		String uname = "root";
		String pass = "";
		String UpdateQuery = "UPDATE PrelovedBook SET bookTitle=?, bookAuthor=?, yearPublished=?, bookCondition=?, isbnCode=?, bookGenre=?, bookPict=?, price=?, stock=?, status=?, sellerEmail=?, synopsis=? WHERE Id=?";
	
		try {
			Class.forName("com.mysql.jdbc.Driver");
			Connection connection = DriverManager.getConnection(url,uname, pass);
			
			PreparedStatement preparedstatement = null;
			
			preparedstatement = connection.prepareStatement(UpdateQuery);
			preparedstatement.setString(1, btitle);
			preparedstatement.setString(2, bauthor);
			preparedstatement.setInt(3, yearpublished);
			preparedstatement.setString(4, bcond);
			preparedstatement.setString(5, isbncode);
			preparedstatement.setString(6, bgenre);
		    preparedstatement.setBlob(7, (Blob) bpict);
			preparedstatement.setDouble(8, bprice);
			preparedstatement.setInt(9, bstock);
			preparedstatement.setString(10, status);
			preparedstatement.setString(11, selleremail);
			preparedstatement.setString(12, synopsis);
			
			preparedstatement.executeUpdate();
			preparedstatement.close();
			connection.close();
			
			return "Update Preloved Book Succcess";
			
		}
		catch(SQLException e){
            e.printStackTrace();
		}
		return "Update Preloved Book Fail";
	}
}
