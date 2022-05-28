package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.database.buyerCartDB;
import com.model.buyerCartModel;
import com.model.PrelovedBook;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class buyerCartUpdate
 */
@WebServlet("/buyerCartUpdate")
public class buyerCartUpdate extends HttpServlet {

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		PrintWriter out = response.getWriter();
		
		if (request.getParameter("update")!= null) {
			try {
				int bookid  = Integer.parseInt(request.getParameter("bookid"));
				int quantity = Integer.parseInt(request.getParameter("quantity"));
				double amount = Double.parseDouble(request.getParameter("price")); 
				int orderid = Integer.parseInt(request.getParameter("orderid"));
				int stock = Integer.parseInt(request.getParameter("stock"));
			
				int currentstock = stock - quantity;
				double amountpay = quantity*amount;
				
				buyerCartModel buyercartmodel = new buyerCartModel();
				PrelovedBook prelovedbookmodel = new PrelovedBook();
				
				buyercartmodel.setQuantity(quantity);
				buyercartmodel.setAmount(amountpay);
				buyercartmodel.setOrderid(orderid);
				
				prelovedbookmodel.setPbStock(currentstock);
				prelovedbookmodel.setBookId(bookid);
			
				if (quantity > stock) {
	                
	                request.setAttribute("bookid", bookid);
	                request.setAttribute("orderid", orderid);
	                RequestDispatcher requestdispatcher = request.getRequestDispatcher("cartdetails.jsp");
	                requestdispatcher.include(request, response);
	                out.println( "<script>\n"
			        		   + "alert(\"Error : Sorry, Book stock is not enough !\");\n"
			        	+ "</script>");
	                out.flush();
				}
				else {
				buyerCartDB buyercartdb = new buyerCartDB();
				
				String updatecart = buyercartdb.updateCart(buyercartmodel, prelovedbookmodel);
				
				if(updatecart.equals("Cart Updated")) 
				{
					
					HttpSession session = request.getSession();
					session.setAttribute("CartSuccessMsg", buyercartdb);
	                RequestDispatcher requestdispatcher = request.getRequestDispatcher("cartdetails.jsp");
	                requestdispatcher.forward(request, response);
				}
			}
			}
			catch (ClassNotFoundException ex) {
	            Logger.getLogger(buyerCartUpdate.class.getName()).log(Level.SEVERE, null, ex);
	      }
			
		}
	}

}
