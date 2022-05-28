package com.controller;

import com.model.LoginModel;
import com.database.ForgetPasswordDB;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class ForgetPasswordSeller
 */
@WebServlet("/ForgetPasswordSeller")
public class ForgetPasswordSeller extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("reset") != null) {
			try {
				
				String email = request.getParameter("email");
				String password = request.getParameter("password");
				
				PrintWriter out = response.getWriter();
				
				LoginModel loginmodel = new LoginModel();
				loginmodel.setEmail(email);
				loginmodel.setPassword(password);
				
				ForgetPasswordDB forgetpassworddb = new ForgetPasswordDB();
				
				String resetpassword = forgetpassworddb.sellerResetPassword(loginmodel);
				
				if(resetpassword.equals("PASSWORD RESET SUCCESS")) {
					request.setAttribute("ResetSuccessMsg", forgetpassworddb);
					RequestDispatcher requestdispatcher = request.getRequestDispatcher("sellerLogin.jsp");
					requestdispatcher.forward(request, response);
					
				
				}
				else {
					request.setAttribute("ResetErrorMsg", forgetpassworddb);
					RequestDispatcher requestdispatcher = request.getRequestDispatcher("sellerforgetPassword.jsp");
					requestdispatcher.include(request, response);
					out.println( "<script>\n"
			        		   + "alert(\"Error : Password Reset Unsuccessful !\");\n"
			        	+ "</script>");
					out.flush();
					
				}
				
				
			}
			catch (ClassNotFoundException ex) {
                Logger.getLogger(ForgetPasswordSeller.class.getName()).log(Level.SEVERE, null, ex);
            }
		}
	}

}
