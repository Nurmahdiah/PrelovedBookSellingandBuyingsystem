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
 * Servlet implementation class buyerCartAdd
 */
@WebServlet("/buyerCartAdd")
public class buyerCartAdd extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public buyerCartAdd() {
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		PrintWriter out = response.getWriter();
		
		if (request.getParameter("submit")!= null) {
			try {
				String date = request.getParameter("datecart");
				String status = request.getParameter("defaultstatus");
				String buyerid = request.getParameter("buyerid");
				String sellerid = request.getParameter("sellerid");
				int bookid = Integer.parseInt(request.getParameter("bookid"));
				int quantity = Integer.parseInt(request.getParameter("quantity"));
				int stock = Integer.parseInt(request.getParameter("stock"));
				double amount = Double.parseDouble(request.getParameter("amount")); 
			
				int currentstock = stock - quantity;
				double amountpay = quantity*amount;
				
				
				buyerCartModel buyercartmodel = new buyerCartModel();
				PrelovedBook prelovedbookmodel = new PrelovedBook();
				
				buyercartmodel.setCartdate(date);
				buyercartmodel.setCartstatus(status);
				buyercartmodel.setBuyerid(buyerid);
				buyercartmodel.setSellerid(sellerid);
				buyercartmodel.setBookid(bookid);
				buyercartmodel.setQuantity(quantity);
				buyercartmodel.setAmount(amountpay);
				
				prelovedbookmodel.setPbStock(currentstock);
				//prelovedbookmodel.setBookId(bookid);
				
				if (quantity > stock) {
	                
	                request.setAttribute("bookid", bookid);
	                
	                RequestDispatcher requestdispatcher = request.getRequestDispatcher("buyBook2.jsp");
	                requestdispatcher.include(request, response);
	                out.println( "<script>\n"
			        		   + "alert(\"Error : Sorry, Book stock is not enough !\");\n"
			        	+ "</script>");
	                out.flush();
				} else { 
				buyerCartDB buyercartdb = new buyerCartDB();
				
				String buyercart = buyercartdb.newCart(buyercartmodel, prelovedbookmodel);
				
				if(buyercart.equals("Cart Added")) 
				{
					
					HttpSession session = request.getSession();
					session.setAttribute("CartSuccessMsg", buyercartdb);
	                RequestDispatcher requestdispatcher = request.getRequestDispatcher("homePage.jsp");
	                requestdispatcher.forward(request, response);
				}
}
			}
			
			catch (ClassNotFoundException ex) {
	            Logger.getLogger(buyerCartAdd.class.getName()).log(Level.SEVERE, null, ex);
	      }
			
		}
		
	}

}
