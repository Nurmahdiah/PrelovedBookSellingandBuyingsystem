package com.controller;

import com.model.LoginModel;
import com.database.LoginDB;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;

import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginControllerSeller
 */
@WebServlet("/LoginControllerSeller")
public class LoginControllerSeller extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			
			try {
				String email = request.getParameter("email");
				String password = request.getParameter("password");
				
				LoginModel login = new LoginModel();
				
				PrintWriter out = response.getWriter();
				
				login.setEmail(email);
				login.setPassword(password);
				
				LoginDB logindb = new LoginDB();
				
				String authorizeLogin = logindb.sellerLogin(login);
				
				if(authorizeLogin.equals("Seller Successfully Login")) {
					HttpSession session = request.getSession();
					session.setAttribute("sellerLogin", login.getEmail());
					
					RequestDispatcher requestdispatcher = request.getRequestDispatcher("newShop.jsp");
					requestdispatcher.forward(request, response);
					
				}
				else {
					request.setAttribute("errorLogin", authorizeLogin);
					
					RequestDispatcher requestdispatcher = request.getRequestDispatcher("sellerLogin.jsp");
					requestdispatcher.include(request, response);
					out.println( "<script>\n"
			        		   + "alert(\"Error : Invalid Email or Password !\");\n"
			        	+ "</script>");
					out.flush();
				}
			}
			catch (ClassNotFoundException ex) {
               Logger.getLogger(LoginControllerSeller.class.getName()).log(Level.SEVERE, null, ex);
            }
		}
	

}
