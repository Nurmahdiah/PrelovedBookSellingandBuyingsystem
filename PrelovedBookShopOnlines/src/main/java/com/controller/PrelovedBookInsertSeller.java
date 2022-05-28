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
 * Servlet implementation class PrelovedBookInsertSeller
 */
@SuppressWarnings("serial")
@WebServlet("/PrelovedBookInsertSeller")
@MultipartConfig(maxFileSize = 16177216) //1.5 mb
public class PrelovedBookInsertSeller extends HttpServlet {

	PrintWriter out;
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String InsertQuery = "INSERT INTO PrelovedBook (bookTitle, bookAuthor, yearPublished, bookCondition, isbnCode, bookGenre, bookPict, price, stock, status, sellerEmail, synopsis) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";

		if(request.getParameter("insert") != null) {
			try {
				
				out = response.getWriter();
				int result = 0;
				String booktitle = request.getParameter("title");
				String bookauthor = request.getParameter("author");
				int yearpublished = Integer.parseInt(request.getParameter("yearpublished"));
				String bookcondition = request.getParameter("condition");
				String isbncode = request.getParameter("isbncode");
				String bookgenre = request.getParameter("genre");
				Part part = request.getPart("image");
				double bookprice = Double.parseDouble(request.getParameter("price"));
				int bookstock = Integer.parseInt(request.getParameter("stock"));
				String bookstatus = "available";
				String selleremail = request.getParameter("emailseller");
				String sinopsis = request.getParameter("synopsis");
				
				if(part != null) {
					try {
						Connection connection = PrelovedBookDB.getConnection();
						PreparedStatement preparedstatement = connection.prepareStatement(InsertQuery);
						InputStream inputstream = part.getInputStream();
						
						preparedstatement = connection.prepareStatement(InsertQuery);
						preparedstatement.setString(1, booktitle);
						preparedstatement.setString(2, bookauthor);
						preparedstatement.setInt(3, yearpublished);
						preparedstatement.setString(4, bookcondition);
						preparedstatement.setString(5, isbncode);
						preparedstatement.setString(6, bookgenre);
						preparedstatement.setBlob(7, inputstream);
						preparedstatement.setDouble(8, bookprice);
						preparedstatement.setInt(9, bookstock);
						preparedstatement.setString(10, bookstatus);
						preparedstatement.setString(11, selleremail);
						preparedstatement.setString(12, sinopsis);
		
						
						result = preparedstatement.executeUpdate();
						
						if(result > 0) {
							response.sendRedirect("newShop.jsp");
						}
						else {
							response.sendRedirect("addbook.jsp?message=Some+Error+Occured");
						}
					}
					catch(Exception e) {
						out.println(e);
					}
				}
			}
			catch(Exception e) {
				out.println(e);
			}
		}
	}
}
				/* PrelovedBook prelovedbookmodel = new PrelovedBook();
				
				prelovedbookmodel.setPbTitle(booktitle);
				prelovedbookmodel.setPbAuthor(bookauthor);
				prelovedbookmodel.setYearPublished(yearpublished);
				prelovedbookmodel.setPbCondition(bookcondition);
				prelovedbookmodel.setIsbncode(isbncode);
				prelovedbookmodel.setPbGenre(bookgenre);
				prelovedbookmodel.setPbPict(part);
				prelovedbookmodel.setPbPrice(bookprice);
				prelovedbookmodel.setPbStock(bookstock);
				prelovedbookmodel.setPbStatus(bookstatus);
				
				PrelovedBookSeller prelovedbookdb = new PrelovedBookSeller();
				
				String insertprelovedbook = prelovedbookdb.sellerInsertPrelovedBook(prelovedbookmodel);
				
				if(insertprelovedbook.equals("Add Preloved Book Success")) {
					
					request.setAttribute("InsertSuccessMsg", insertprelovedbook);
					RequestDispatcher requestdispatcher = request.getRequestDispatcher("newShop.jsp");
					requestdispatcher.forward(request, response);
				}
				else {
					request.setAttribute("InsertErrorMsg", insertprelovedbook);
	                RequestDispatcher requestdispatcher = request.getRequestDispatcher("addbook.jsp");
	                requestdispatcher.include(request, response);
				}
				
				
			}
			
		**/
