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
    <title>Seller Profile Account</title>
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
</style>

</head>
<body>
<!-- Navbar (sit on top) -->
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

<!-- Header with full-height image -->
<header class="w3-display-container w3-grayscale-min" id="home">
  <div class="w3-display-left w3-text-white" style="padding:48px">
 </div>
</header>

<div style="background-color:#ECE9D9;" class="body">
<div class="container">
<h4> <a href="landingPage.jsp">Seller</a> / <a href="sellerAccount.jsp">Profile Account </a>/ Update Profile Account</h4>
<br>
<div class="row gutters">
<div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
<div class="card h-100">
	<div class="card-body">
		<div class="account-settings">
			<div class="user-profile">
				<div class="user-avatar">
					<img src="avatars.jpg" alt="Maxwell Admin">
				</div>
							<%
	
	 if(request.getParameter("email") != null)
	 {
		 
		 String email = request.getParameter("email");
		 
		 String url = "jdbc:mysql://localhost:3307/PrelovedBookShop";
		 String uname = "root";
		 String pass = "";
		 
		 try
		 {
			 Class.forName("com.mysql.jdbc.Driver");
			 Connection connection = DriverManager.getConnection(url,uname, pass);
			 
			 PreparedStatement preparedstatement = null;
			 
			 preparedstatement = connection.prepareStatement("SELECT * FROM Seller WHERE emailAddress=?");
			 preparedstatement.setString(1, email);
			 ResultSet resultset = preparedstatement.executeQuery();
			 
			 while(resultset.next()){
				 
			 
		%> 
				<h5 class="user-name">Hello <%=resultset.getString("username") %> !</h5>
				<h6 class="user-email"><%=session.getAttribute("sellerLogin")%></h6>
			</div>
		</div>
	</div>
</div>
</div>
<div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
<div class="card h-100">
	<div class="card-body">
	<form action="UpdateProfileSeller" method="post" id="sellerAccount" onsubmit="return validate();">

		<div class="row gutters">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<h6 class="mb-2 text-primary">Personal Details</h6>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="firstname">First Name</label>
					<input type="text" class="form-control" id="firstname" name="firstname" value="<%=resultset.getString("firstName") %>">
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="lastname">Last Name</label>
					<input type="text" class="form-control" id="lastname" name="lastname" value="<%=resultset.getString("lastName") %>" >
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="username">Username</label>
					<input type="text" class="form-control" id="username" name="username" value="<%=resultset.getString("username") %>" >
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="password">Password</label>
					<input type="password" class="form-control" id="password" name="password" value="<%=resultset.getString("password") %>" readonly>
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="phoneno">Phone Number</label>
					<input type="text" class="form-control" id="phoneno" name="phoneno" value="<%=resultset.getString("phoneNo") %>" >
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="emailaddr">Email Address</label>
					<input type="text" class="form-control" id="emailaddr" name="emailaddr" value="<%=resultset.getString("emailAddress") %>" readonly>
				</div>
			</div>
		</div>
		<div class="row gutters">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<h6 class="mt-3 mb-2 text-primary">Address Details</h6>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="street">Street</label>
					<input type="text" class="form-control" id="street" name="street" value="<%=resultset.getString("street") %>" >
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="city">City</label>
					<input type="text" class="form-control" id="city" name="city" value="<%=resultset.getString("city") %>" >
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="postcode">Postcode</label>
					<input type="text" class="form-control" id="postcode" name="postcode" value="<%=resultset.getString("postcode") %>" >
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="state">State</label>
					<input type="text" class="form-control" id="state" name="state" value="<%=resultset.getString("state") %>" >
				</div>
			</div>
		</div>
		<div class="row gutters">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="text-right">
					<a href="sellerAccount.jsp"><button type="button" id="submit" name="cancel" class="btn btn-secondary">Cancel</button></a>
					<button type="submit" id="submit" name="update" class="btn btn-primary" onclick="return confirm('Are you sure you want to Update Account ?')">Update</button>
				</div>
			</div>
		</div>
		</form>
				<%} %>
	<%	}
		 catch(SQLException e)
		 {
	         e.printStackTrace();
	 	 }
	 }
	
	%>
	<div style="text-align:center;">
	<h3 style="color:red;">
	<%
	if(request.getAttribute("UpdateErrorMsg") != null){
		out.print(request.getAttribute("UpdateErrorMsg"));
	}
	
	%>
	</h3>
	</div>
	</div>
</div>
</div>
</div>
</div>
</div>
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