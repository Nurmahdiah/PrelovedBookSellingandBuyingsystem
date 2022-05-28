package com.controller;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class viewImage
 */
@WebServlet("/viewImage")
public class viewImage extends HttpServlet {
	private static final long serialVersionUID = 1L;

    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String url = "jdbc:mysql://localhost:3307/PrelovedBookShop";
		 String uname = "root";
		 String pass = "";
		 
		 try{
			 Class.forName("com.mysql.jdbc.Driver");
			 Connection connection = DriverManager.getConnection(url,uname, pass);
			 
			 PreparedStatement preparedstatement = null;
			 
			 HttpSession session = request.getSession(false);
			 preparedstatement = connection.prepareStatement("SELECT * FROM PrelovedBook WHERE sellerEmail='"+session.getAttribute("sellerLogin")+"'");
			 ResultSet resultset = preparedstatement.executeQuery();
			 
			 while(resultset.next()){
				 Blob blob = resultset.getBlob("bookPict");
			     byte byteArray[] = blob.getBytes(1, (int)blob.length());
			     response.setContentType("image/gif");
			     OutputStream os = response.getOutputStream();
			     os.write(byteArray);
			     os.flush();
			     os.close();
			     
		 
			 } 
			 
			 preparedstatement.close();
			 connection.close();
		 }				
			catch(SQLException e)
			 {
		         e.printStackTrace();
		 	 } catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	}

}
