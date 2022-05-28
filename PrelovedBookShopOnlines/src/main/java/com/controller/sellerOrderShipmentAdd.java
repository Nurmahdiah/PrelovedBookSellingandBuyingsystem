package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import com.database.sellerOrderShipmentDB;
import com.model.shipmentModel;

/**
 * Servlet implementation class sellerOrderShipmentAdd
 */
@WebServlet("/sellerOrderShipmentAdd")
public class sellerOrderShipmentAdd extends HttpServlet {
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	
	PrintWriter out = response.getWriter();
		
		
			try {
				String shippingNo = request.getParameter("shipNo");
				String shippingStatus = request.getParameter("shipStatus");
				String shippingDate = request.getParameter("shipDate");
				int orderId = Integer.parseInt(request.getParameter("orderId"));
				String sellerId = request.getParameter("sellerId");
				//int shipmentId = Integer.parseInt(request.getParameter("shipmentId"));
				
				shipmentModel shipmentmodel = new shipmentModel();
				
				shipmentmodel.setShippingNo(shippingNo);
				shipmentmodel.setShippingStatus(shippingStatus);
				shipmentmodel.setShippingDate(shippingDate);
				shipmentmodel.setOrderId(orderId);
				shipmentmodel.setSellerId(sellerId);
				//shipmentmodel.setShipmentId(shipmentId);
				
				sellerOrderShipmentDB sellerordershipmentdb = new sellerOrderShipmentDB();
				
				String updateshipment = sellerordershipmentdb.addShipment(shipmentmodel);
				
				if(updateshipment.equals("Shipment Details Added")){
					HttpSession session = request.getSession();
					session.setAttribute("ShipmentSuccessMsg", sellerordershipmentdb);
					request.setAttribute("orderIdNo", shipmentmodel.getOrderId());
					request.setAttribute("shipmentNo", shipmentmodel.getShippingNo());
					RequestDispatcher requestdispatcher = request.getRequestDispatcher("bookOrderII.jsp");
					requestdispatcher.forward(request, response);
				}
				else {
					HttpSession session = request.getSession();
					session.setAttribute("ShipmentErrorMsg", sellerordershipmentdb);
	                RequestDispatcher requestdispatcher = request.getRequestDispatcher("bookOrderIIAdd.jsp");
	                requestdispatcher.include(request, response);
	                out.println( "<script>\n"
			        		   + "alert(\"Error : Adding Shipment Details Fail, Please Try Again !\");\n"
			        	+ "</script>");
	                out.flush();
				}
				
			}
			catch (ClassNotFoundException ex) {
                Logger.getLogger(sellerOrderShipmentAdd.class.getName()).log(Level.SEVERE, null, ex);
            }
		
	}

}
