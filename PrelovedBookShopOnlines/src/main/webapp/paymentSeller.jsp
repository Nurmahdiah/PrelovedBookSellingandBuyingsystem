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
    padding-bottom: 300px;
    background-image: url("bgi.png");
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
      <a href="sellerAccount.jsp" class="w3-bar-item w3-button"><i class="fa fa-user w3-margin-right"></i> Profile Account</a>
      <a href="newShop.jsp" class="w3-bar-item w3-button"><i class="fa fa-book w3-margin-right"></i> Preloved Book</a>
      <a href="bookOrders.jsp" class="w3-bar-item w3-button"><i class="fa fa-envelope w3-margin-right"></i> Orders</a>
      <a href="report.jsp" class="w3-bar-item w3-button"><i class="fa fa-envelope w3-margin-right"></i> Reports</a>
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

<!-- Side bar on small screens when clicking the menu icon -->
<nav class="w3-sidebar w3-bar-block w3-black w3-card w3-animate-left w3-hide-medium w3-hide-large" style="display:none" id="mySidebar">
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-bar-item w3-button w3-large w3-padding-16">Close</a>
  <a href="sellerAccount.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-margin-right"> Profile Account</a>
  <a href="newShop.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-margin-right"> Preloved Book</a>
  <a href="bookOrders.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-margin-right"> Orders</a>
  <a href="report.jsp" onclick="w3_close()" class="w3-bar-item w3-button w3-margin-right"> Reports</a>
  <a class="w3-bar-item w3-button" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fa fa-cog w3-margin-right"></i>
  </a> <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          	<a class="dropdown-item" href="mainPage.jsp.jsp">Logout</a>
       </div>
</nav>

<!-- Header with full-height image -->
<header class="w3-display-container w3-grayscale-min" id="home">
  <div class="w3-display-left w3-text-white" style="padding:48px">
 </div>
</header>

<body>
<div style="background-color:#ECE9D9;" class="body">
<div class="container">
<h4><a href="sellerRegister.jsp">Account Registration</a> / Payment</h4>
<br>
    <div class="row">
        <div class="col-md-12 order-md-1">
            <form class="needs-validation" METHOD="POST" novalidate="">
            <div class="card h-100">
            <div class="card-body">
                <h4 class="mb-3">Payment</h4>
                <div class="d-block my-3">
                    <div class="custom-control custom-radio">
                        <input id="credit" name="paymentMethod" type="radio" class="custom-control-input" checked="" required="">
                        <label class="custom-control-label" for="credit">Credit card</label>
                    </div>
                    <div class="custom-control custom-radio">
                        <input id="debit" name="paymentMethod" type="radio" class="custom-control-input" required="">
                        <label class="custom-control-label" for="debit">Debit card</label>
                    </div>
                    <div class="custom-control custom-radio">
                        <input id="paypal" name="paymentMethod" type="radio" class="custom-control-input" required="">
                        <label class="custom-control-label" for="paypal">PayPal</label>
                    </div>
                    <div class="custom-control custom-radio">
                        <input id="online" name="paymentMethod" type="radio" class="custom-control-input" required="">
                        <label class="custom-control-label" for="online">Online Banking</label>
                    </div>                  
                </div>
                <hr class="mb-4">
                <div class="row">
                    <div class="col-md-6 mb-3">
                        <label for="cc-name">Name on card</label>
                        <input type="text" class="form-control" id="cc-name" placeholder="" value="Nur Hana Adam" required="">
                        <small class="text-muted">Full name as displayed on card</small>
                        <div class="invalid-feedback"> Name on card is required </div>
                    </div>
                    <div class="col-md-6 mb-3">
                        <label for="cc-number">Credit card number</label>
                        <input type="text" class="form-control" id="cc-number" placeholder="" value="4890 5689 2301 2922" required="">
                        <div class="invalid-feedback"> Credit card number is required </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-md-3 mb-3">
                        <label for="cc-expiration">Expiration</label>
                        <input type="text" class="form-control" id="cc-expiration" placeholder="ex: 04/2021" value="04/2026" required="">
                        <div class="invalid-feedback"> Expiration date required </div>
                    </div>
                    <div class="col-md-3 mb-3">
                        <label for="cc-cvv">CVV</label>
                        <input type="text" class="form-control" id="cc-cvv" placeholder="ex: 597" value="598" required="">
                        <div class="invalid-feedback"> Security code required </div>
                    </div>
                </div>
                <button class="btn btn-danger"  name="button_register" type="submit">Continue to Pay</button>
                </div></div>
            </form>
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