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
<html lang="en">
<head>
<meta charset="utf-8">
<title>Payments</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>

<style>
a:hover, a:visited, a:link, a:active
{
    text-decoration: none;
}
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}

body, html {
  height: 100%;
  line-height: 1.8;
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

<div class="w3-top">
  <div class="w3-bar w3-white w3-card" id="myNavbar">
    <!-- Right-sided navbar links -->
    <div class="w3-right w3-hide-small">
      <a href="homePage.jsp" class="w3-bar-item w3-button"><i class="fa fa-home w3-margin-right"></i> Home</a>
      <a href="buyerAccount.jsp" class="w3-bar-item w3-button"><i class="fa fa-user w3-margin-right"></i> Profile Account</a>
      <a href="cart.jsp" class="w3-bar-item w3-button"><i class="fa fa-shopping-cart w3-margin-right"></i> Cart</a>
      <a href="purchaseList.jsp" class="w3-bar-item w3-button"><i class="fa fa-money w3-margin-right"></i> Purchase</a>
      <a class="w3-bar-item w3-button" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fa fa-cog w3-margin-right"></i>
        </a> <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="mainPage.jsp">Logout</a>
        </div>
          </div>
    <!-- Hide right-floated links on small screens and replace them with a menu icon -->

    <a href="javascript:void(0)" class="w3-bar-item w3-button w3-right w3-hide-large w3-hide-medium" onclick="w3_open()">
      <i class="fa fa-bars"></i>
    </a>
  </div>
</div>

<!-- Sidebar on small screens when clicking the menu icon -->
<nav class="w3-sidebar w3-bar-block w3-black w3-card w3-animate-left w3-hide-medium w3-hide-large" style="display:none" id="mySidebar">
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-bar-item w3-button w3-large w3-padding-16">Close</a>
  <a href="homePage.jsp" onclick="w3_close()" class="w3-bar-item w3-button"><i class="fa fa-home w3-margin-right"></i> Home</a>
  <a href="buyerAccount.jsp" onclick="w3_close()" class="w3-bar-item w3-button"><i class="fa fa-user w3-margin-right"></i> Profile Account</a>
  <a href="cart.jsp" onclick="w3_close()" class="w3-bar-item w3-button"><i class="fa fa-shopping-cart w3-margin-right"></i> Cart</a>
  <a href="purchaseList.jsp" onclick="w3_close()" class="w3-bar-item w3-button"><i class="fa fa-money w3-margin-right"></i> Purchase</a>  
  <a href="mainPage.jsp" onclick="w3_close()" class="w3-bar-item w3-button"> <i class="fa fa-cog w3-margin-right"></i>Logout</a> 
</nav>

<!-- Header with full-height image -->
<header class="w3-display-container w3-grayscale-min" id="home">
  <div class="w3-display-left w3-text-white" style="padding:48px">
 </div>
</header>

<body>
<div style="background-color:#F1F5FF;" class="body">
<div class="container">
<h4><a href="homePage.jsp">Buyer</a> / Payment Checkout</h4>
<br>

    <div class="row">
        <div class="col-md-2 order-md-1">
           <img src="viewImage6.jsp?id=<%=request.getAttribute("bookid")%>" alt="<%=request.getAttribute("bookTitle")%>" class="img-fluid d-none d-md-block rounded mb-2 shadow ">
        
        </div>
        
        <div class="col-md-8 order-md-1">
            <div class="card h-100">
            <div class="card-body">
            
            <form action="authorize_payment" method="post">
            
            <h5 class="">Payment Details </h5>
            <hr class="mb-4">
                <div class="row">
                <div class="mb-4">
                        <label for="product">Product (Preloved Book): </label>
                        <input type="text" class="form-control" id="product" name="product" value="<%=request.getAttribute("bookTitle")%>" readonly>
                </div>
                </div>
                <div class="row">
                <div class="mb-4">
                        <label for="subtotal">Sub Total: </label>
                        <input type="text" class="form-control" id="subtotal" name="subtotal" value="<%=request.getAttribute("amountToPay")%>" readonly>
                </div>
                </div>
                <div class="row">
                <div class="mb-4">
                    <label for="shippingfee">Shipping Fee: </label>
                    <input type="text" class="form-control" id="shippingfee" name="shippingfee"  value="<%=request.getAttribute("shippingsemenanjung")%>"readonly >
                </div>
                </div>
                <div class="row">
                <div class="mb-4">
                        <label for="totalfee">Total</label>
                        <input type="text" class="form-control" id="totalfee" name="totalfee" value="<%=request.getAttribute("totalsemenanjung")%>" readonly>
                </div>  
                </div>
                
                <input type="hidden" id="firstName" name="firstName" value="<%=request.getAttribute("firstname")%>">
   			    <input type="hidden" id="lastname" name="lastname" value="<%=request.getAttribute("lastname")%>">
                <input type="hidden" id="emailbuyer" name="emailbuyer" value="<%=request.getAttribute("email")%>">
                           
          <%
		
	 String url = "jdbc:mysql://localhost:3307/PrelovedBookShop";
	 String uname = "root";
	 String pass = "";
	 
	 try{
		 Class.forName("com.mysql.jdbc.Driver");
		 Connection connection = DriverManager.getConnection(url,uname, pass);
		 
		 PreparedStatement preparedstatement = null;
		 
		 preparedstatement = connection.prepareStatement("SELECT * FROM Orders WHERE buyerEmailAddress='"+session.getAttribute("buyerLogin")+"' AND bookId='"+request.getAttribute("bookid")+"'");
		 
		 ResultSet resultset = preparedstatement.executeQuery();
		 
		 while(resultset.next()){
	 
	%>
             <a href="buyerOrderCancel.jsp?id=<%=resultset.getString("orderId")%>"><button class="btn btn-secondary" type="button" name="cancel" id="cancel">Cancel</button></a>
   			 <input type="hidden" id="orderid" name="orderid" value="<%=resultset.getString("orderId")%>">
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
                <hr class="mb-4">
                 
               <button class="btn btn-danger" type="submit" name="submit" id="submit">Continue to Checkout</button>
               
            </form>
            <br>

            </div></div>
        </div>
    </div>
    </div>
    </div>
    <script>
    (function () {
    	  'use strict'

    	  window.addEventListener('load', function () {
    	    // Fetch all the forms we want to apply custom Bootstrap validation styles to
    	    var forms = document.getElementsByClassName('needs-validation')

    	    // Loop over them and prevent submission
    	    Array.prototype.filter.call(forms, function (form) {
    	      form.addEventListener('submit', function (event) {
    	        if (form.checkValidity() === false) {
    	          event.preventDefault()
    	          event.stopPropagation()
    	        }
    	        form.classList.add('was-validated')
    	      }, false)
    	    })
    	  }, false)
    	}())
    	
    </script>
    </body>
<footer style="color:white; background-color:#455DAD" class="w3-center">
  <p class=""> &copy; Preloved Book Shop | 2021 Version</p>
</footer>
</html>