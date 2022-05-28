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


import com.model.shipmentModel;
import com.database.sellerOrderShipmentDB;
/**
 * Servlet implementation class sellerOrderShipmentUpdate
 */
@WebServlet("/sellerOrderShipmentUpdate")
public class sellerOrderShipmentUpdate extends HttpServlet {
	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

		PrintWriter out = response.getWriter();
		
		if(request.getParameter("update") != null) {
			try {
				String shippingNo = request.getParameter("shipNo");
				String shippingStatus = request.getParameter("shipStatus");
				String shippingDate = request.getParameter("shipDate");
				int orderId = Integer.parseInt(request.getParameter("orderId"));
				String sellerId = request.getParameter("sellerId");
				
				shipmentModel shipmentmodel = new shipmentModel();
				
				shipmentmodel.setShippingNo(shippingNo);
				shipmentmodel.setShippingStatus(shippingStatus);
				shipmentmodel.setShippingDate(shippingDate);
				shipmentmodel.setOrderId(orderId);
				shipmentmodel.setSellerId(sellerId);
				
				sellerOrderShipmentDB sellerordershipmentdb = new sellerOrderShipmentDB();
				
				String updateshipment = sellerordershipmentdb.updateShipment(shipmentmodel);
				
				if(updateshipment.equals("Shipment Order Update Success")){
					HttpSession session = request.getSession();
					session.setAttribute("ShipmentSuccessMsg", sellerordershipmentdb);
					session.setAttribute("ShipmentorderId", shipmentmodel.getOrderId());
					session.setAttribute("shipmentNo", shipmentmodel.getShippingNo());
					RequestDispatcher requestdispatcher = request.getRequestDispatcher("bookOrderII2.jsp");
					requestdispatcher.forward(request, response);
				}
				else {
					HttpSession session = request.getSession();
					session.setAttribute("ShipmentErrorMsg", sellerordershipmentdb);
	                RequestDispatcher requestdispatcher = request.getRequestDispatcher("bookOrderIIUpdate.jsp");
	                requestdispatcher.include(request, response);
	                out.println( "<script>\n"
			        		   + "alert(\"Error : Update Shipment Details Fail, Please Try Again !\");\n"
			        	       + "</script>");
	                out.flush();
				}
				
			}
			catch (ClassNotFoundException ex) {
                Logger.getLogger(sellerOrderShipmentUpdate.class.getName()).log(Level.SEVERE, null, ex);
            }
		}
	}
}


