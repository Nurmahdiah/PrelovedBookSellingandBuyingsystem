package com.controller;

import com.model.RegisterModel;
import com.database.RegisterDB;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.annotation.WebServlet;

/**
 * Servlet implementation class RegisterBuyer
 */
@WebServlet("/RegisterBuyerBuyBook")
public class RegisterBuyerBuyBook extends HttpServlet {
	private static final long serialVersionUID = 1L;

    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		
		try {
			String fname = request.getParameter("firstname");
			String lname = request.getParameter("lastname");
			String uname = request.getParameter("username");
			String pass = request.getParameter("password");
			String hpno = request.getParameter("phoneno");
			String street = request.getParameter("street");
			String city = request.getParameter("city");
			int postcode = Integer.parseInt(request.getParameter("postcode"));
			String state = request.getParameter("state");
			String email = request.getParameter("email");
			String bookid = request.getParameter("id");
			
			
			RegisterModel registermodel = new RegisterModel();
			
			registermodel.setfName(fname);
			registermodel.setlName(lname);
			registermodel.setUname(uname);
			registermodel.setPass(pass);
			registermodel.setHpno(hpno);
			registermodel.setStreet(street);
			registermodel.setCity(city);
			registermodel.setPostcode(postcode);
			registermodel.setState(state);
			registermodel.setEmailaddr(email);
			
			RegisterDB registerdb = new RegisterDB();
			
			String registerbuyer = registerdb.buyerRegister(registermodel);
			
			if(registerbuyer.equals("SUCCESSFULLY REGISTER AS BUYER")) {
				HttpSession session = request.getSession();
				session.setAttribute("RegisterSuccessMsg", registerdb);
				session.setAttribute("uname", registermodel.getUname());
				request.setAttribute("id", bookid);
                RequestDispatcher requestdispatcher = request.getRequestDispatcher("buyerLoginBuyBook.jsp");
                requestdispatcher.forward(request, response);
				
			}
			else {
				HttpSession session = request.getSession();
				session.setAttribute("RegisterErrorMsg", registerdb);
                RequestDispatcher requestdispatcher = request.getRequestDispatcher("buyerRegisterBuyBook.jsp");
                requestdispatcher.include(request, response);
                out.println( "<script>\n"
		        		   + "alert(\"Error : Registration Fail, Please Try Again !\");\n"
		        	+ "</script>");
                out.flush();
				
			}
		}
		catch (ClassNotFoundException ex) {
            Logger.getLogger(RegisterBuyerBuyBook.class.getName()).log(Level.SEVERE, null, ex);
      }
	}

}
