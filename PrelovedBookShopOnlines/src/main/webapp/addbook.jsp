<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">

    <title>Add Preloved Book</title>
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
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}

body, html {
  height: 100%;
  line-height: 1.8;
  background-color:#ECE9D9;
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
<div class="container">
<form action="PrelovedBookInsertSeller" method="POST" id="addBook" enctype="multipart/form-data">
<div class="row gutters">
<div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
<div class="card h-100">
	<div class="card-body">
		<div class="account-settings">
			<div class="user-profile">
				<!-- <div class="user-avatar">
					<img src="https://bootdey.com/img/Content/avatar/avatar7.png" alt="Maxwell Admin">
				</div> -->
				
				<div class="form-group">
					<label for="image">Preloved Book Image</label>
					<input type="file"  accept="image/jpeg image/png" name="image" id="file"  onchange="loadFile(event)" class="form-control">
					<br>
				    <img id="output" width="200" /></div>
				    <br><br>
				<label for="synopsis">Book's Short Synopsis</label>
					<textarea rows="10" cols="10" class="form-control" id="synopsis" name="synopsis" placeholder="ex: This book is about ... " ></textarea>
			</div>
		</div>
	</div>
</div>
</div>
<div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
<div class="card h-100">
	<div class="card-body">
			
		<div class="row gutters">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<h6 class="mb-2 text-primary">Preloved Book Details</h6>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="title">Title of Preloved Book</label>
					<input type="text" class="form-control" id="title" name="title" placeholder="ex: We Begin at the End" >
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="author">Preloved Book's Author</label>
					<input type="text" class="form-control" id="author" name="author" placeholder="ex: Chris Whitaker" >
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="yearpublished">Year published</label>
					<input type="text" class="form-control" id="yearpublished" name="yearpublished" placeholder="ex: 2020" >
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="isbncode">ISBN Code</label>
					<input type="text" class="form-control" id="isbncode" name="isbncode" placeholder="ex: 1250793769" >
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="price">Price (RM)</label>
					<input type="text" class="form-control" id="price" name="price" placeholder="ex: 15.00" >
				</div>
			</div>
					<input type="hidden" class="form-control" id="emailseller" name="emailseller" value="<%=session.getAttribute("sellerLogin")%>">
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="stock">Stock</label>
					<input type="number" class="form-control" min="0" step="1" id="stock" name="stock" placeholder="ex: 10">
				</div>
			</div>
			<div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="bookCond">Book Condition</label>
				    <input class="form-control" list="conditionList" id="condition" name="condition" />
						<datalist id="conditionList">
							      <option value="Nice">
							      <option value="Good">
							      <option value="Bad">
					   </datalist>
				</div>
			</div>
			  <div class="col-xl-6 col-lg-6 col-md-6 col-sm-6 col-12">
				<div class="form-group">
					<label for="genre">Genre of Book</label>
				 <input class="form-control" list="genreList" id="genre" name="genre" />
						 <datalist id="genreList">
							      <option value="Action / Adventure">
							      <option value="Kids">
							      <option value="Thriller">
							      <option value="Historical">
							      <option value="Others">
						 </datalist>
				</div>
			</div>
		</div>
		<div class="row gutters">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="text-right">
					<a href="newShop.jsp"><button type="button" id="submit" name="submit" class="btn btn-secondary">Cancel</button></a>
					<button type="submit" id="insert" name="insert" class="btn btn-primary">Add</button>
				</div>
			</div>
		</div>
		
	</div>
</div>
</div>
</div>
</form>
</div>
<style type="text/css">
a:hover, a:visited, a:link, a:active
{
    text-decoration: none;
}
body {
    margin: 0;
    padding-top: 140px;
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
var loadFile = function(event) {
	var image = document.getElementById('output');
	image.src = URL.createObjectURL(event.target.files[0]);
}
</script>
</body>
<!-- Footer -->
<div style="padding-top:350px;">
<footer style="color:white; background-color:#455DAD" class="w3-center">
  <p class=""> &copy; Preloved Book Shop | 2021 Version</p>
</footer>
</div>
</html>