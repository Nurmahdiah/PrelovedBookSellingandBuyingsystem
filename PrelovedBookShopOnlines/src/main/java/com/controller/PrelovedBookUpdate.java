package com.controller;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.util.logging.Level;
import java.util.logging.Logger;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import com.model.PrelovedBook;
import com.database.PrelovedBookSeller;
import com.database.PrelovedBookDB;
/**
 * Servlet implementation class PrelovedBookUpdate
 */
@SuppressWarnings("serial")
@WebServlet("/PrelovedBookUpdate")
@MultipartConfig(maxFileSize = 16177216) //1.5 mb
public class PrelovedBookUpdate extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String bookid = request.getParameter("id");
		
		String UpdateQuery = "UPDATE PrelovedBook SET bookTitle=?, bookAuthor=?, yearPublished=?, bookCondition=?, isbnCode=?, bookGenre=?, price=?, stock=?, status=? WHERE Id='"+bookid+"'";

		PrintWriter out = response.getWriter();
		int result = 0;
		String booktitle = request.getParameter("title");
		String bookauthor = request.getParameter("author");
		int yearpublished = Integer.parseInt(request.getParameter("yearpublished"));
		String bookcondition = request.getParameter("condition");
		String isbncode = request.getParameter("isbncode");
		String bookgenre = request.getParameter("genre");
		double bookprice = Double.parseDouble(request.getParameter("price"));
		int bookstock = Integer.parseInt(request.getParameter("stock"));
		String bookstatus = request.getParameter("status");
				
		try {
			Connection connection = PrelovedBookDB.getConnection();
			PreparedStatement preparedstatement = connection.prepareStatement(UpdateQuery);
						
						
			preparedstatement.setString(1, booktitle);
			preparedstatement.setString(2, bookauthor);
			preparedstatement.setInt(3, yearpublished);
			preparedstatement.setString(4, bookcondition);
			preparedstatement.setString(5, isbncode);
			preparedstatement.setString(6, bookgenre);
			preparedstatement.setDouble(7, bookprice);
			preparedstatement.setInt(8, bookstock);
			preparedstatement.setString(9, bookstatus);
		
						
			result = preparedstatement.executeUpdate();
						
			if(result > 0) {
				response.sendRedirect("bookDetails.jsp?id="+bookid);
			}
			else {
				response.sendRedirect("updateBook.jsp?message=Some+Error+Occured");
			}
		}
		catch(Exception e) {
			out.println(e);
		}
	}		
}
