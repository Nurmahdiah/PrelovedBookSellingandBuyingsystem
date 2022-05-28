<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <!--  This file has been downloaded from bootdey.com @bootdey on twitter -->
    <!--  All snippets are MIT license http://bootdey.com/license -->
    <title>Buy Now</title>
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

.w3-bar .w3-button {
  padding: 16px;
}
img{
height: 100%;
width: 100%;
}
td,th{
padding: 10px 25px;
}
a:hover, a:visited, a:link, a:active
{
    text-decoration: none;
}
</style>

</head>
<body>
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

<!-- Header with full-height image -->
<header class="w3-display-container w3-grayscale-min" id="home">
  <div class="w3-display-left w3-text-white" style="padding:48px">
 </div>
</header>
<%
	 String bookid = "";
	 
	 if(request.getParameter("id") != null){
		 bookid = request.getParameter("id");
	 }
	 else if(request.getParameter("id") == null){
		 bookid = (String)request.getAttribute("id");
	 }
	 else{
		 return;
	 }

	 String url = "jdbc:mysql://localhost:3307/PrelovedBookShop";
	 String uname = "root";
	 String pass = "";
	 
	 try{
		 Class.forName("com.mysql.jdbc.Driver");
		 Connection connection = DriverManager.getConnection(url,uname, pass);
		 
		 PreparedStatement preparedstatement = null;
		 
		 preparedstatement = connection.prepareStatement("SELECT * FROM PrelovedBook WHERE Id='"+bookid+"' OR Id='"+request.getAttribute("bookid")+"'");
		 
		 ResultSet resultset = preparedstatement.executeQuery();
		 
		 while(resultset.next()){
	 
	%>
<div style="background-color:#F1F5FF;" class="body">
<div class="container">
<h4><a href="homePage.jsp">Buyer</a> / Preloved Book Details</h4>
<br>
<div class="row gutters">
<div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12">
<div class="card h-100">
	<div class="card-body">
		<div class="account-settings">
		<h5 class="user-name"><b>Title : </b><%=resultset.getString("bookTitle")%></h5>
		<br>
				<div class="user-avatar">
					<img src="viewImage3.jsp?id=<%=request.getAttribute("bookid")%>" alt="booktitle">
					<br><br>
					<%=resultset.getString("synopsis")%>
			</div>
		</div>
	</div>
</div>
</div>

<div class="col-xl-8 col-lg-8 col-md-12 col-sm-12 col-12">
<div class="card h-100">
	<div class="card-body">
		<table class="responsive">
			<tr><th>Title</th><td><%=resultset.getString("bookTitle")%></td></tr>
			<tr><th>Book Author</th><td><%=resultset.getString("bookAuthor")%></td></tr>
			<tr><th>Year Published</th><td><%=resultset.getString("yearPublished")%></td></tr>
			<tr><th>Book Condition</th><td><%=resultset.getString("bookCondition")%></td></tr>
			<tr><th>ISBN Code</th><td><%=resultset.getString("isbnCode")%></td></tr>
			<tr><th>Genre</th><td><%=resultset.getString("bookGenre")%></td></tr>
			<tr><th>Price</th><td><%=resultset.getString("price")%></td></tr>
			<tr><th>Status</th><td><%=resultset.getString("status")%></td></tr>
			<tr><th>Stock</th><td><%=resultset.getString("stock")%></td></tr>
		</table>
		<div class="row gutters" style="padding-top:25px;">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="text-center">
					<a href="homePage.jsp"><button type="button" id="submit" name="submit" class="btn btn-secondary">Cancel</button></a>
					<a href="bookCart.jsp?id=<%=resultset.getString("Id")%>"><button type="button" id="submit" name="submit" class="btn btn-primary">Add to Cart</button></a>
					<a href="buyBookII.jsp?id=<%=resultset.getString("Id")%>"><button type="button" id="submit" name="submit" class="btn btn-primary">Buy Now</button></a>
				</div>
			</div>
		</div>
	</div>
</div>
</div>
</div>
</div>
</div>
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
<style type="text/css">
.body {
    margin: 0;
    padding-top: 140px;
    color: #2e323c;
    background: #f5f6fa;
    position: relative;
    height: 100%;
}
.account-settings .user-profile {
    margin: 0 0 1rem 0;
    padding-bottom: 1rem;
    text-align: center;
}
.account-settings .user-profile .user-avatar {
    margin: 0 0 1rem 0;
}
.account-settings .user-profile .user-avatar img {
    width: 90px;
    height: 90px;
    -webkit-border-radius: 100px;
    -moz-border-radius: 100px;
    border-radius: 100px;
}
.account-settings .user-profile h5.user-name {
    margin: 0 0 0.5rem 0;
}
.account-settings .user-profile h6.user-email {
    margin: 0;
    font-size: 0.8rem;
    font-weight: 400;
    color: #9fa8b9;
}
.account-settings .about {
    margin: 2rem 0 0 0;
    text-align: center;
}
.account-settings .about h5 {
    margin: 0 0 15px 0;
    color: #007ae1;
}
.account-settings .about p {
    font-size: 0.825rem;
}
.form-control {
    border: 1px solid #cfd1d8;
    -webkit-border-radius: 2px;
    -moz-border-radius: 2px;
    border-radius: 2px;
    font-size: .825rem;
    background: #ffffff;
    color: #2e323c;
}

.card {
    background: #ffffff;
    -webkit-border-radius: 5px;
    -moz-border-radius: 5px;
    border-radius: 5px;
    border: 0;
    margin-bottom: 1rem;
}


</style>

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
<!-- Footer -->
<footer style="color:white; background-color:#455DAD" class="w3-center">
  <p class=""> &copy; Preloved Book Shop | 2021 Version</p>
</footer>
</html>