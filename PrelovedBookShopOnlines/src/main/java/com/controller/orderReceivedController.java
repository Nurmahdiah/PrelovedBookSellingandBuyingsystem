package com.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.database.sellerOrderShipmentDB;
import com.model.shipmentModel;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class orderReceivedController
 */
@WebServlet("/orderReceived")
public class orderReceivedController extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public orderReceivedController() {
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
PrintWriter out = response.getWriter();
		
		if(request.getParameter("delivered") != null) {
			try {
				
				String shippingStatus = request.getParameter("shipStatus");
				int orderId = Integer.parseInt(request.getParameter("orderId"));
				
				shipmentModel shipmentmodel = new shipmentModel();
				
				
				shipmentmodel.setShippingStatus(shippingStatus);
				shipmentmodel.setOrderId(orderId);
				
				sellerOrderShipmentDB sellerordershipmentdb = new sellerOrderShipmentDB();
				
				String updateshipment = sellerordershipmentdb.updateShipmentReceived(shipmentmodel);
				
				if(updateshipment.equals("Shipment Order Update Success")){
					HttpSession session = request.getSession();
					session.setAttribute("ShipmentSuccessMsg", sellerordershipmentdb);
					RequestDispatcher requestdispatcher = request.getRequestDispatcher("purchaseList.jsp");
					requestdispatcher.forward(request, response);
				}
				else {
					HttpSession session = request.getSession();
					session.setAttribute("ShipmentErrorMsg", sellerordershipmentdb);
	                RequestDispatcher requestdispatcher = request.getRequestDispatcher("purchaseList.jsp");
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
