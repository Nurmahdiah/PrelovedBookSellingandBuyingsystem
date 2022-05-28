package net.codejava;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.PayPalRESTException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 * Servlet implementation class ExecutePaymentServlet
 */
@WebServlet("/ExecutePaymentServletPay")
public class ExecutePaymentServletPay extends HttpServlet {
	private static final long serialVersionUID = 1L;

    /**
     * Default constructor. 
     */
    public ExecutePaymentServletPay() {
        super();
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		HttpSession session = request.getSession();
		
		String paymentId = request.getParameter("paymentId");
        String payerId = request.getParameter("PayerID");
        String orderid = request.getParameter("orderidno");	
         
		float totals = Float.parseFloat(request.getParameter("totalfee"));
		
		int orderidno = Integer.parseInt(request.getParameter("orderidnodb"));
		
		OrderDetail orderdetails = new OrderDetail();
		orderdetails.setOrderId(orderidno);
		orderdetails.setTotal(totals);
		
		paymentDB paymentdbnew = new paymentDB();
		try {
			String newpaymentdata = paymentdbnew.newPayment(orderdetails);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		try {
         String status = "paid";
       	 String url = "jdbc:mysql://localhost:3307/PrelovedBookShop";
       	 String uname = "root";
       	 String pass = "";
       	 String updateQuery = "UPDATE Orders SET status=? WHERE buyerEmailAddress='"+session.getAttribute("buyerLogin")+"' AND (orderId='"+orderid+"' OR orderId='"+session.getAttribute("orderiddb")+"' ) ";
       	
       	 
       	 try{
       		 Class.forName("com.mysql.jdbc.Driver");
       		 Connection connection = DriverManager.getConnection(url,uname, pass);
       		 
       		 PreparedStatement preparedstatement = null;
       		 
       		 preparedstatement = connection.prepareStatement(updateQuery);	
       		 
       		 preparedstatement.setString(1, status);

       		 
       		 preparedstatement.executeUpdate();
       		 
       		 
       	     preparedstatement.close();
       		 connection.close();
       	 }
       	 catch(SQLException | ClassNotFoundException e) {
       			e.printStackTrace();
       		}
       	 
            PaymentServices paymentServices = new PaymentServices();
            Payment payment = paymentServices.executePayment(paymentId, payerId);
             
            PayerInfo payerInfo = payment.getPayer().getPayerInfo();
            Transaction transaction = payment.getTransactions().get(0);
             
            request.setAttribute("payer", payerInfo);
            request.setAttribute("transaction", transaction);          
 
            request.getRequestDispatcher("receipt.jsp").forward(request, response);
             
        } catch (PayPalRESTException ex) {
            request.setAttribute("errorMessage", "Could not execute payment");
            ex.printStackTrace();
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }
	
	

}
