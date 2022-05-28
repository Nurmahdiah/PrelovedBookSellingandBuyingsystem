package net.codejava;

import com.model.RegisterModel;
import java.io.IOException;

import com.paypal.base.rest.PayPalRESTException;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/authorize_payment")
public class AuthorizePaymentServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public AuthorizePaymentServlet() {
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		HttpSession session = request.getSession();
		
		String fname = request.getParameter("firstName");
		String lname = request.getParameter("lastname");
		String email = request.getParameter("emailbuyer");
		String product = request.getParameter("product");
		String subtotal = request.getParameter("subtotal");
		String shipping = request.getParameter("shippingfee");
		String total = request.getParameter("totalfee");
		float totals = Float.parseFloat(total);
		int orderid = Integer.parseInt(request.getParameter("orderid"));
		
		session.setAttribute("totalsdb", totals);
		session.setAttribute("orderiddb", orderid);
		
		RegisterModel register = new RegisterModel(fname, lname, email);
		OrderDetail orderDetail = new OrderDetail(orderid, product, subtotal, shipping, total);
		
		try {
			PaymentServices paymentServices = new PaymentServices();
			String approvalLink = paymentServices.authorizePayment(register,orderDetail);
			
			response.sendRedirect(approvalLink);
		
		} catch (PayPalRESTException ex) {
			ex.printStackTrace();
			request.setAttribute("errorMessage", "Invalid Payment Details");
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

}
