package net.codejava;

import java.util.ArrayList;
import java.util.List;

import com.model.RegisterModel;
//import com.model.RegisterModel;
//import com.paypal.api.payments.Address;
import com.paypal.api.payments.Amount;
import com.paypal.api.payments.Details;
import com.paypal.api.payments.Item;
import com.paypal.api.payments.ItemList;
import com.paypal.api.payments.Links;
import com.paypal.api.payments.Payer;
import com.paypal.api.payments.PayerInfo;
import com.paypal.api.payments.Payment;
import com.paypal.api.payments.PaymentExecution;
import com.paypal.api.payments.RedirectUrls;
import com.paypal.api.payments.ShippingAddress;
import com.paypal.api.payments.Transaction;
import com.paypal.base.rest.APIContext;
import com.paypal.base.rest.PayPalRESTException;

public class PaymentServices {

	private static final String CLIENT_ID = "AXoAncs-9xbyFAZyhqw8hmtuVwiQf4jUpQanpmAkW9MdAWE2L6J02v0AlsSDWapkNbvOOoGuUWrkSI9y";
	private static final String CLIENT_SECRET = "EDbGsE5fkm4m39HI6KCMBCd-m1s9XgmG4bjQuIiD_IzdjIX80McLjHaKIpCTqxgRbrBHHudaRsymBLBM";
	private static final String MODE = "sandbox";
	
	public String authorizePayment(RegisterModel register, OrderDetail orderDetail) throws PayPalRESTException {
		
		Payer payer = getPayerInformation(register);
		RedirectUrls redirectUrls = getRedirectUrls();
		List<Transaction> listTransaction = getTransactionInformation(orderDetail);
		
		Payment requestPayment = new Payment();
		requestPayment.setTransactions(listTransaction);
		requestPayment.setRedirectUrls(redirectUrls);
		requestPayment.setPayer(payer);
		requestPayment.setIntent("authorize");
		
		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
		Payment approvedPayment = requestPayment.create(apiContext);
		
		System.out.println(approvedPayment);
		
		return getApprovalLink(approvedPayment);
	}
	
	public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
	    return Payment.get(apiContext, paymentId);
	}
	
	public Payment executePayment(String paymentId, String payerId)
	        throws PayPalRESTException {
	    PaymentExecution paymentExecution = new PaymentExecution();
	    paymentExecution.setPayerId(payerId);
	 
	    Payment payment = new Payment().setId(paymentId);
	 
	    APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
	 
	    return payment.execute(apiContext, paymentExecution);
	}
	
	private Payer getPayerInformation(RegisterModel register) {
		
		String firstname = register.getfName();
		String lastname = register.getlName();
		String email = register.getEmailaddr();
		
		
		Payer payer = new Payer();
		payer.setPaymentMethod("paypal");
		
		PayerInfo payerInfo = new PayerInfo();
		payerInfo.setFirstName(firstname)
				 .setLastName(lastname)
				 .setEmail(email);
		
		payer.setPayerInfo(payerInfo);
		
		return payer;
	}
	
	/*private ShippingAddress getShippingAddress(ShippingAddress shippingAddress) {
		
		ShippingAddress shippingAddress = new ShippingAddress();
		shippingAddress.setLine1(CLIENT_ID)
		
		return shippingaddress;
	}*/
	
	private RedirectUrls getRedirectUrls() {
		RedirectUrls redirectUrls = new RedirectUrls();
		redirectUrls.setCancelUrl("http://localhost:8080/PrelovedBookShopOnline/cancel.jsp"); //return to cancel jsp
		redirectUrls.setReturnUrl("http://localhost:8080/PrelovedBookShopOnline/review_payment"); //continue with payment
	
		return redirectUrls;
	
	}
	private List<Transaction> getTransactionInformation (OrderDetail orderDetail){
		
		Details details = new Details();
		details.setShipping(orderDetail.getShipping());
		details.setSubtotal(orderDetail.getSubtotal());
		
		Amount amount = new Amount();
		amount.setCurrency("MYR");
		amount.setTotal(orderDetail.getTotal());
		amount.setDetails(details);
		
		Transaction transaction = new Transaction();
		transaction.setAmount(amount);
		transaction.setDescription(orderDetail.getProductName());
		
		ItemList itemList = new ItemList();
		List<Item> items = new ArrayList<>();
		
		Item item = new Item();
		item.setCurrency("MYR");
		item.setName(orderDetail.getProductName());
		item.setPrice(orderDetail.getSubtotal());
		item.setQuantity("1");
		
		items.add(item);
		itemList.setItems(items);
		transaction.setItemList(itemList);
		
		List<Transaction> listTransaction = new ArrayList<>();
		listTransaction.add(transaction);
		
		return listTransaction;
		
	}
	
	private String getApprovalLink(Payment approvedPayment) {
		List<Links> links = approvedPayment.getLinks();
		String approvalLink = null;
		
		for (Links link : links) {
			if (link.getRel().equalsIgnoreCase("approval_url")) {
				approvalLink = link.getHref();
				break;
			}
		}
		
		return approvalLink;
	}
	
	


	
	



}
