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
<title>Cart Update</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>

<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}

body, html {
  height: 100%;
  line-height: 1.8;
}

/* Full height image header */
.bgimg-1 {
  background-position: center;
  background-size: cover;
  background-image: url("background.jpg");
  min-height: 100%;
}

.w3-bar .w3-button {
  padding: 16px;
}
a:hover, a:visited, a:link, a:active
{
    text-decoration: none;
}
</style>

</head>


<!-- Navbar (sit on top) -->
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


<body style="background-color:#F1F5FF;">
<section class="pt-5 pb-5">
  <div  style="padding-top:91px; padding-bottom:348px;" class="container">
    <div class="row w-100">
        <div class="col-lg-12 col-md-12 col-12">
            <h4 class="display-5 mb-2 text-left"><a href="homePage.jsp">Buyer</a> / Shopping Cart</h4>
            <br>
            <form action="buyerCartUpdate" method="post">
            <table id="shoppingCart" class="table table-condensed table-responsive">
                <thead>
                    <tr>
                        <th style="width:60%">Product</th>
                        <th style="width:12%">Price</th>
                        <th style="width:8%">Quantity</th>
                        <th style="width:12%">Amount</th>
                        <th style="width:8%"></th>
                    </tr>
                </thead>
                <%
	 String idorder = request.getParameter("orderid");	
                
	 String url = "jdbc:mysql://localhost:3307/PrelovedBookShop";
	 String uname = "root";
	 String pass = "";
	 
	 try{
		 Class.forName("com.mysql.jdbc.Driver");
		 Connection connection = DriverManager.getConnection(url,uname, pass);
		 
		 PreparedStatement preparedstatement = null;
		 
		 preparedstatement = connection.prepareStatement("SELECT Orders.*, PrelovedBook.* FROM Orders INNER JOIN PrelovedBook ON Orders.bookId=PrelovedBook.Id WHERE Orders.buyerEmailAddress='"+session.getAttribute("buyerLogin")+"' AND Orders.status='cartunpaid' AND (Orders.orderId='"+idorder+"' OR Orders.orderId='"+request.getAttribute("orderid")+"' )");
		 
		 ResultSet resultset = preparedstatement.executeQuery();
		 
		 while(resultset.next()){
	 
	%>
                <tbody>
                
                    <tr>
                        <td data-th="Product">
                            <div class="row">
                                <div class="col-md-3 text-left">
                                    <img src="viewImage4.jsp?id=<%=resultset.getString("Id")%>" alt="<%=resultset.getString("bookTitle")%>" class="img-fluid d-none d-md-block rounded mb-2 shadow ">
                                </div>
                                <div class="col-md-9 text-left mt-sm-2">
                                    <h4><%=resultset.getString("bookTitle")%> </h4>
                                    <p class="font-weight-light"><%=resultset.getString("bookAuthor")%></p>
                                    <a href="cartpay.jsp?orderid=<%=resultset.getString("orderId")%>"><button class="btn btn-danger" type=button id="pay" name="pay">Pay</button></a>
                                </div>
                            </div>
                        </td>
                        <td data-th="Price"><%=resultset.getString("price")%>
                       <input type="hidden" name="price" id="price" value="<%=resultset.getString("price")%>">
                       <input type="hidden" name="bookid" id="bookid" value="<%=resultset.getString("Id")%>">
                        </td>
                        <td data-th="Quantity">
                        <input type="hidden" name="orderid" id="orderid" value="<%=resultset.getString("orderId")%>">
                        <input type="hidden" name="stock" id="stock" value="<%=resultset.getString("stock")%>">
                            <input type="number" id="quantity"  min="1" step="1" name="quantity" class="form-control form-control-lg text-center" value="<%=resultset.getString("quantity")%>" >
                        </td>
                        <td data-th="amount">RM <%= resultset.getString("amount")%></td>
                        <td class="actions" data-th="">
                        <div class="text-center">
                                <a href="buyerCartDelete.jsp?idorder=<%=resultset.getString("orderId")%>"><button type="button" name="delete" id="delete" class="btn btn-white border-secondary bg-white btn-md mb-2" onclick="return confirm('Are you sure you want to delete this book from your cart ?')"><i class="fa fa-trash"></i></button></a>
                        		<div style="padding-bottom:8px;"><button  type="submit" name="update" id="update" class="btn btn-primary"><i class="fa fa-save" onclick="return confirm('Are you sure you want to make an update ?')"></i></button> </div>
                        		<a href="cart.jsp"><button type="button" name="cancel" id="cancel" class="btn btn-danger"><i class="fa fa-close"></i></button></a>
                        </div>
                        </td>
                    </tr>
                    

                </tbody>

            </table></form>
         
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

        </div>
    </div>
    <div class="row mt-4 d-flex align-items-center">
     
        <div class="col-sm-6 mb-3 mb-m-1 order-md-1 text-md-left">
            <a href="homePage.jsp">
                <i class="fa fa-arrow-left mr-2"></i> Continue Shopping</a>
        </div>
    </div>
</div>
</section>

<script type="text/javascript">
//Toggle between showing and hiding the sidebar when clicking the menu icon
var mySidebar = document.getElementById("mySidebar");

function w3_open() {
  if (mySidebar.style.display === 'block') {
    mySidebar.style.display = 'none';
  } else {
    mySidebar.style.display = 'block';
  }
}

// Close the sidebar with the close button
function w3_close() {
    mySidebar.style.display = "none";
}

function ValidateEmail(inputText)
{
var mailformat = /^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/;
if(inputText.value.match(mailformat))
{
alert("Valid email address!");
document.form1.text1.focus();
return true;
}
else
{
alert("You have entered an invalid email address!");
document.form1.text1.focus();
return false;
}
}
</script>
</body>
<footer style="color:white; background-color:#455DAD" class="w3-center">
  <p class=""> &copy; Preloved Book Shop | 2021 Version</p>
</footer>
</html>