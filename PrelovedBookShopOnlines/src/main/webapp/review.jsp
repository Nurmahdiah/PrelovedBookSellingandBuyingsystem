<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page import = "java.io.*,java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Review Payment</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>

<style type="text/css">
    table { border: 0; }
    table td { padding: 5px; }
    a:hover, a:visited, a:link, a:active
{
    text-decoration: none;
}
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}

body, html {
  height: 100%;
  line-height: 1.8;
    margin: 0;
    padding-top: 30px;
    color: #2e323c;
    background: #f5f6fa;
    position: relative;
    height: 100%;
}
.body {
    padding-top: 140px;
    padding-bottom: 100px;
}
.w3-bar .w3-button {
  padding: 16px;
}
</style>
</head>
<body>

<div style="background-color:#F1F5FF;">
<div align="center" style="background-color:#F1F5FF;">
    <h1>Please Review Before Paying</h1>
    <form action="ExecutePaymentServletPay" method="post">
    <table>
        <tr>
            <td colspan="2"><b>Transaction Details:</b></td>
            <td>
                <input type="hidden" name="paymentId" value="${param.paymentId}" />
                <input type="hidden" name="PayerID" value="${param.PayerID}" />
            </td>
        </tr>
        <tr>
            <td>Description:</td>
            <td>${transaction.description}</td>
        </tr>
        <tr>
            <td>Subtotal:</td>
            <td>${transaction.amount.details.subtotal} MYR</td>
        </tr>
        <tr>
            <td>Shipping:</td>
            <td>${transaction.amount.details.shipping} MYR</td>
        </tr>
        <tr>
            <td>Total:</td>
            <td>${transaction.amount.total} MYR</td>
        </tr>
        <tr><td><br/></td></tr>
        <tr>
            <td colspan="2"><b>Payer Information:</b></td>
        </tr>
        <tr>
            <td>First Name:</td>
            <td>${payer.firstName}</td>
        </tr>
        <tr>
            <td>Last Name:</td>
            <td>${payer.lastName}</td>
        </tr>
        <tr>
            <td>Email:</td>
            <td>${payer.email}</td>
        </tr>
        <tr><td><br/></td></tr>
        <tr>
            <td colspan="2"><b>Shipping Address:</b></td>
        </tr>
        <tr>
            <td>Recipient Name:</td>
            <td>${shippingAddress.recipientName}</td>
        </tr>
        <tr>
            <td>Line 1:</td>
            <td>${shippingAddress.line1}</td>
        </tr>
        <tr>
            <td>City:</td>
            <td>${shippingAddress.city}</td>
        </tr>
        <tr>
            <td>State:</td>
            <td>${shippingAddress.state}</td>
        </tr>
        <tr>
            <td>Country Code:</td>
            <td>${shippingAddress.countryCode}</td>
        </tr>
        <tr>
            <td>Postal Code:</td>
            <td>${shippingAddress.postalCode}</td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                               <%
		
	 String url = "jdbc:mysql://localhost:3307/PrelovedBookShop";
	 String uname = "root";
	 String pass = "";
	 
	 try{
		 Class.forName("com.mysql.jdbc.Driver");
		 Connection connection = DriverManager.getConnection(url,uname, pass);
		 
		 PreparedStatement preparedstatement = null;
		 
		 preparedstatement = connection.prepareStatement("SELECT * FROM Orders WHERE buyerEmailAddress='"+session.getAttribute("buyerLogin")+"' AND bookId='"+session.getAttribute("bookidsession")+"'");
		 
		 ResultSet resultset = preparedstatement.executeQuery();
		 
		 while(resultset.next()){
	 
	%>
   		<input type="hidden" name="orderidno" id="orderidno" value="<%=resultset.getString("orderId")%>">
   	    <input type="hidden" name="totalfee" id="totalfee" value="${transaction.amount.total}">
   		<input type="hidden" name="orderidnodb" id="orderidnodb" value="<%=session.getAttribute("orderiddb")%>">
   		
     <%	
		 } 
		 
		 preparedstatement.close();
		 connection.close();
	 }				
		catch(SQLException e)
		 {
	         e.printStackTrace();
	 	 }
	 
	%>
                <button type="submit" id="submit" name="submit" class="btn btn-danger">Pay Now</button>
            </td>
        </tr>    
    </table>
	
    </form>
</div>
</div>
<div style="">
</div>
</body>
</html>