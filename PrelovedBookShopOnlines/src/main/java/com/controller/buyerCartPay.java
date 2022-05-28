package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.database.buyerOrderDB;
import com.model.buyerOrder;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class buyerCartPay
 */
@WebServlet("/buyerCartPay")
public class buyerCartPay extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public buyerCartPay() {
        // TODO Auto-generated constructor stub
    }
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	PrintWriter out = response.getWriter();
		
	
		String fname = request.getParameter("firstname");
		String lname = request.getParameter("lastname");
		String date = request.getParameter("dateorder");
		String status = request.getParameter("defaultstatus");
		String buyerid = request.getParameter("buyerid");
		String sellerid = request.getParameter("selleremail");
		String orderid = request.getParameter("orderid");
		String booktitle = request.getParameter("booktitle");
		String countrybuyer = request.getParameter("country");
		int bookid = Integer.parseInt(request.getParameter("bookid"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		double price = Double.parseDouble(request.getParameter("price")); 

		double amountpay = quantity*price;
		double shippingpaysemenanjung = 0;
		double shippingpaysabah = 0;
		double shippingpaysarawak = 0;
		
		if( quantity >=1 && quantity <=3) {
			shippingpaysemenanjung = 4.00;
			shippingpaysabah = 5.50;
			shippingpaysarawak = 5.50;
		}
		else if ( quantity >=4 && quantity <=9) {
			shippingpaysemenanjung = 5.00;
			shippingpaysabah = 6.50;
			shippingpaysarawak = 6.50;
		}
		else{
			shippingpaysemenanjung = 6.00;
			shippingpaysabah = 7.50;
			shippingpaysarawak = 7.50;
		}
		
		double totalpaysemenanjung  = amountpay+shippingpaysemenanjung;
		double totalpaysabah = amountpay+shippingpaysabah;
		double totalpaysarawak = amountpay+shippingpaysarawak;
		
		
		if(request.getParameter("pay") != null){
				
			
				HttpSession session = request.getSession();
				request.setAttribute("bookTitle", booktitle);
				request.setAttribute("amountToPay", amountpay);
				request.setAttribute("bookid", bookid);
				request.setAttribute("firstname", fname);
				request.setAttribute("lastname", lname);
				request.setAttribute("email", buyerid);
				request.setAttribute("orderid", orderid);
				session.setAttribute("orderidsession", orderid);
				session.setAttribute("bookidsession", bookid);
				request.setAttribute("country", countrybuyer);
				
				if ( !countrybuyer.equals("Sabah") && !countrybuyer.equals("Sarawak")) {
				
					request.setAttribute("totalsemenanjung", totalpaysemenanjung);
					request.setAttribute("shippingsemenanjung", shippingpaysemenanjung);
					RequestDispatcher requestdispatcher = request.getRequestDispatcher("paymentCartBuyer.jsp");
					requestdispatcher.forward(request, response);
					
				}
				else if ( countrybuyer.equals("Sabah")) {
				
					request.setAttribute("totalsabah", totalpaysabah);
					request.setAttribute("shippingsabah", shippingpaysabah);
					RequestDispatcher requestdispatcher2 = request.getRequestDispatcher("paymentCartBuyer2.jsp");
					requestdispatcher2.forward(request, response);
				}
				else if( !countrybuyer.equals("Sabah") && countrybuyer.equals("Sarawak")) {
					
					request.setAttribute("totalsarawak", totalpaysarawak);
					request.setAttribute("shippingsarawak", shippingpaysarawak);
					RequestDispatcher requestdispatcher3 = request.getRequestDispatcher("paymentCartBuyer3.jsp");
					requestdispatcher3.forward(request, response);
				}
		}
		else 
		{
			HttpSession session = request.getSession();
		    RequestDispatcher requestdispatcher = request.getRequestDispatcher("cart.jsp");
		    requestdispatcher.include(request, response);
		    out.println( "<script>\n"
		    		   + "alert(\"Error : Payment Fail, Please Try Again !\");\n"
		    	+ "</script>");
		    out.flush();
		}
		
	}

}
