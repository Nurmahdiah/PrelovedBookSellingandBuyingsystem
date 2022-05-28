package com.controller;

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

import com.model.RegisterModel;
import com.database.ProfileAccountDB;

/**
 * Servlet implementation class UpdateProfileBuyer
 */
@WebServlet("/UpdateProfileBuyer")
public class UpdateProfileBuyer extends HttpServlet {
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("update") != null) {
			
			try {
				String fname = "";
				String lname = "";
				String uname = "";
				String password  = "";
				String phoneno = "";
				String emailaddress = "";
				String street = "";
				String city = "";
				int postcode = 0;
				String state = "";
				
				if(request.getParameter("firstname") != null) {
					 fname = request.getParameter("firstname");
				}
				if(request.getParameter("lastname") != null) {
					 lname = request.getParameter("lastname");
				}
				if(request.getParameter("username") != null) {
					 uname = request.getParameter("username");
				}
				if(request.getParameter("password") != null) {
					 password = request.getParameter("password");
				}
				if(request.getParameter("phoneno") != null) {
					 phoneno = request.getParameter("phoneno");
				}
				if(request.getParameter("emailaddr") != null) {
					 emailaddress = request.getParameter("emailaddr");
				}
				if(request.getParameter("street") != null) {
					 street = request.getParameter("street");
				}
				if(request.getParameter("city") != null) {
					 city = request.getParameter("city");
				}
				if(Integer.parseInt(request.getParameter("postcode")) != 0) {
					 postcode = Integer.parseInt(request.getParameter("postcode"));
				}
				if(request.getParameter("state") != null) {
					 state = request.getParameter("state");
				}
				
				RegisterModel registermodel = new RegisterModel();
				
				registermodel.setfName(fname);
				registermodel.setlName(lname);
				registermodel.setUname(uname);
				registermodel.setPass(password);
				registermodel.setHpno(phoneno);
				registermodel.setEmailaddr(emailaddress);
				registermodel.setStreet(street);
				registermodel.setCity(city);
				registermodel.setPostcode(postcode);
				registermodel.setState(state);
				
				ProfileAccountDB profileaccountdb = new ProfileAccountDB();
				
				String updateprofile = profileaccountdb.buyerAccountUpdate(registermodel);
				
				if(updateprofile.equals("Profile Account Update Success")) {
					request.setAttribute("UpdateSuccessMsg", updateprofile);
					RequestDispatcher requestdispatcher = request.getRequestDispatcher("buyerAccount.jsp");
					requestdispatcher.forward(request, response);
				}
				else {
					request.setAttribute("UpdateErrorMsg", updateprofile);
	                RequestDispatcher requestdispatcher = request.getRequestDispatcher("buyerAccountUpdate.jsp");
	                requestdispatcher.include(request, response);
				}
				
			}
			catch (ClassNotFoundException ex) {
                Logger.getLogger(UpdateProfileBuyer.class.getName()).log(Level.SEVERE, null, ex);
            }
		}
	}

}
