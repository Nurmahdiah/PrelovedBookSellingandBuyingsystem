
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<!DOCTYPE html>
<html>
<title>Preloved Book Shop</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
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
.img{
 width: 50%;
 opacity: 0.6;
}
img{
height: 305px;
width: 90%;
}
</style>
<body>

<!-- Navbar (sit on top) -->
<div class="w3-top">
  <div class="w3-bar w3-white w3-card" id="myNavbar">
    <!-- Right-sided navbar links -->
    <div class="w3-right w3-hide-small"> 
      <a href="#about" class="w3-bar-item w3-button"><i class="fa fa-angle-double-down w3-margin-right"></i>  ABOUT</a>
      <a class="w3-bar-item w3-button" class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          <i class="fa fa-user w3-margin-right"></i> SIGN UP
        </a> <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="sellerLogin.jsp">Seller</a>
          <a class="dropdown-item" href="buyerLogin.jsp">Buyer</a>
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
  <a href="javascript:void(0)" onclick="w3_close()" class="w3-bar-item w3-button w3-large w3-padding-16"><i class="fa fa-window-close w3-margin-right"></i>Close</a>
  <a href="#about" onclick="w3_close()" class="w3-bar-item w3-button"><i class="fa fa-angle-double-down w3-margin-right"></i> ABOUT</a>
  <a href="#" style="color:white;" class="nav-link dropdown-toggle" class="w3-bar-item w3-button" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"><i class="fa fa-user w3-margin-right"></i>  SIGN UP</a>
  <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="sellerLogin.jsp">Seller</a>
          <a class="dropdown-item" href="buyerLogin.jsp">Buyer</a>
        </div>
</nav>

<!-- Book Sells Section -->
<div class="w3-main" style="margin:0px 270px 0px 270px">

  <!-- Image header -->
  <div class="w3-display-container w3-container">
    <img class="img" src="background.jpg" alt="book" style="padding-top:120px; width:100%; height: 700px">
    <div class="w3-display-topleft w3-text-black" style="padding:124px 48px">
      <h1 class="w3-jumbo w3-hide-small">Purchase your desired book in lower price</h1>
      <h1 class="w3-jumbo w3-hide-small">Build Online Preloved Book Shop in Easier Way</h1>
      <h1 class="w3-show-large w3-hide-medium">Gather preloved seller in one platform</h1>
      <p><a href="sellerLogin.jsp" class="w3-button w3-black w3-padding-large w3-large">Sells Now</a> &nbsp; &nbsp; <a href="#book" class="w3-button w3-black w3-padding-large w3-large">Shop Now</a></p>
    </div>
  </div>
  <div class="w3-container w3-text-black" style="padding-top:120px; padding-bottom:30px;" id="book">
    <h3>Preloved Book Collections</h3>
  </div>
 <%
	 
	 
	 String url = "jdbc:mysql://localhost:3307/PrelovedBookShop";
	 String uname = "root";
	 String pass = "";
	 
	 try{
		 Class.forName("com.mysql.jdbc.Driver");
		 Connection connection = DriverManager.getConnection(url,uname, pass);
		 
		 PreparedStatement preparedstatement = null;
		 
		 preparedstatement = connection.prepareStatement("SELECT * FROM PrelovedBook");
		 ResultSet resultset = preparedstatement.executeQuery();
		 
		 while(resultset.next()){
	 
	%> 
  <!-- Product grid -->
  <div id="" >
  
    <div class="w3-col l3 s6">
      <div class="w3-container">
      <div class="w3-display-container">
        <img src="viewImage3.jsp?id=<%=resultset.getString("Id")%>" width="400px">
          <div class="w3-display-middle w3-display-hover">
            <a href="buyerLoginBuyBook.jsp?id=<%=resultset.getString("Id")%>"><button  type="button" name="buy" id="buy"class="w3-button w3-black">Buy now <i class="fa fa-shopping-cart"></i></button></a>
          </div>
          </div>
        <p>Title : <%=resultset.getString("bookTitle") %><br><b>Price : <%=resultset.getDouble("price") %></b></p>
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
  <!-- End page content -->
</div>
<br><br><br><br>

<!-- About Section -->

<div class="w3-container" style="padding:128px 16px;" id="about">
<hr>
  <h3 class="w3-center">ABOUT THE ONLINE PRELOVED BOOK SHOP</h3>
  <p class="w3-center w3-large">Key features of online preloved book shop</p>
  <div class="w3-row-padding w3-center" style="margin-top:64px">
    <div class="w3-quarter">
      <i class="fa fa-desktop w3-margin-bottom w3-jumbo w3-center"></i>
      <p class="w3-large">Responsive</p>
      <p></p>
    </div>
    <div class="w3-quarter">
      <i class="fa fa-heart w3-margin-bottom w3-jumbo"></i>
      <p class="w3-large">Easier</p>
      <p></p>
    </div>
    <div class="w3-quarter">
      <i class="fa fa-diamond w3-margin-bottom w3-jumbo"></i>
      <p class="w3-large">Design</p>
      <p></p>
    </div>
    <div class="w3-quarter">
      <i class="fa fa-cog w3-margin-bottom w3-jumbo"></i>
      <p class="w3-large">Support</p>
      <p></p>
    </div>
  </div>
</div>

<!-- Footer -->
<footer class="w3-center w3-black">
 <p class=""> &copy; Preloved Book Shop | 2021 Version</p></footer>
 
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
</html>

