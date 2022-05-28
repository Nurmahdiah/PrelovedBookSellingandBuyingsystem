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
    <title>Book Orders</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Roboto:300,400&display=swap" rel="stylesheet">

    <!-- Style -->
    <link rel="stylesheet" href="css/style.css">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>

<style>
body,h1,h2,h3,h4,h5,h6,p {font-family: "Raleway", sans-serif}

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
</style>

</head>
<body>
<!-- Navbar (sit on top) -->
<div class="w3-top">
  <div class="w3-bar w3-white w3-card" id="myNavbar">
    <!-- Right-sided navbar links -->
    <div class="w3-right w3-hide-small">
      <a href="sellerAccount.jsp" class="w3-bar-item w3-button"><i class="fa fa-user w3-margin-right"></i> Profile Account</a>
      <a href="newShop.jsp" class="w3-bar-item w3-button"><i class="fa fa-book w3-margin-right"></i> Preloved Book</a>
      <a href="bookOrders.jsp" class="w3-bar-item w3-button"><i class="fa fa-envelope w3-margin-right"></i> Orders</a>
      <a class="w3-bar-item w3-button" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
      <i class="fa fa-envelope w3-margin-right"></i> Reports
      </a> 
      <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          	<a class="dropdown-item" href="report.jsp">Monthly Sales Report</a>
          	<a class="dropdown-item" href="reportAnnual.jsp">Annual Sales Report</a>
          	<a class="dropdown-item" href="bookreport2.jsp">Book Sales Report</a>
      </div>
      <a href="mainPage.jsp" class="w3-bar-item w3-button"><i class="fa fa-cog w3-margin-right"></i>Logout</a>
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

<div style="background-color:#ECE9D9;" class="body">
<div class="container">
<h4><a href="newShop.jsp">Seller</a> / Preloved Book Order List</h4>
<br>
<div class="row gutters">

<div class="col-xl-12 col-lg-12 col-md-15 col-sm-15 col-15">
<div class="card h-100">
	<div style="padding-left:20px;" class="card-body">
		<div class="row gutters">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<h6 class="mb-2 text-primary">Preloved Book Order List</h6>
			</div>
			<div class="table-responsive">

        <table class="table table-striped custom-table">
          <thead>
            <tr>
              <th scope="col">Order Number</th>
              <th scope="col">Order Date</th>
              <th scope="col">Payment Status</th>
              <th scope="col"></th>
            </tr>
          </thead>
             <%
		
	 String url = "jdbc:mysql://localhost:3307/PrelovedBookShop";
	 String uname = "root";
	 String pass = "";
	 
	 try{
		 Class.forName("com.mysql.jdbc.Driver");
		 Connection connection = DriverManager.getConnection(url,uname, pass);
		 
		 PreparedStatement preparedstatement = null;
		 
		 preparedstatement = connection.prepareStatement("SELECT * FROM Orders WHERE sellerEmailAddress='"+session.getAttribute("sellerLogin")+"' AND status='paid'");
		 
		 ResultSet resultset = preparedstatement.executeQuery();
	 
	%> 
          <tbody>
      <% while(resultset.next()){ %>
            <tr scope="row">
              <td><%=resultset.getString("orderId")%></td>
              <td><%=resultset.getString("date")%></td>
              <td><%=resultset.getString("status")%></td>
              <td><a href="bookOrderII.jsp?orderid=<%=resultset.getString("orderId")%>">View Order Details</a></td>
			</tr> 
			<%} //outer part for end of while loop
         preparedstatement.close();
		 connection.close();
	 }		//end for try		
		catch(SQLException e)
		 {
	         e.printStackTrace();
	 	 } %>
			</tbody>
		</table> 
      </div>
		</div>
		
		
	</div>
</div>
</div>
</div>
</div>
</div>

<style type="text/css">
a:hover, a:visited, a:link, a:active
{
    text-decoration: none;
}
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

<script>
// Modal Image Gallery
function onClick(element) {
  document.getElementById("img01").src = element.src;
  document.getElementById("modal01").style.display = "block";
  var captionText = document.getElementById("caption");
  captionText.innerHTML = element.alt;
}


// Toggle between showing and hiding the sidebar when clicking the menu icon
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