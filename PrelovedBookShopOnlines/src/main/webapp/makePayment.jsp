<!DOCTYPE html>
<html>
<head>
<title>Payment</title>
<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
	<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
	<meta name="viewport" content="width=device-width, initial-scale=1">
	
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.0/dist/js/bootstrap.bundle.min.js"></script>

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

<div  style="padding-top:100px; padding-left: 15%; padding-right: 15%">
				<h4 style="padding-left: 16px;" class="mb-2 text-primary">Payment Details</h4>
  <div class="col-75">
    <div class="container">
      <form action="#">
      
        <div class="row">
          <div class="col-50">
            <h3>Billing Address</h3>
            <label for="fname"><i class="fa fa-user"></i> Full Name</label>
            <input type="text" id="fname" name="firstname" placeholder="John M. Doe">
            <label for="email"><i class="fa fa-envelope"></i> Email</label>
            <input type="text" id="email" name="email" placeholder="john@example.com">
            <label for="adr"><i class="fa fa-address-card-o"></i> Address</label>
            <input type="text" id="adr" name="address" placeholder="542 W. 15th Street">
            <label for="city"><i class="fa fa-institution"></i> City</label>
            <input type="text" id="city" name="city" placeholder="New York">

            <div class="row">
              <div class="col-50">
                <label for="zip">Postcode</label>
                <input type="text" id="zip" name="zip" placeholder="10001">
              </div>
              <div class="col-50">
                <label for="state">State</label>
                <input type="text" id="state" name="state" placeholder="NY">
              </div>
              
            </div>
          </div>

          <div class="col-50">
            <h3>Card Payment</h3>
            <label for="cname">Name on Card</label>
            <input type="text" id="cname" name="cardname" placeholder="John More Doe">
            <label for="ccnum">Card number</label>
            <input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444">
            <label for="expmonth">Exp Month</label>
            <input type="text" id="expmonth" name="expmonth" placeholder="September">
            <div class="row">
              <div class="col-50">
                <label for="expyear">Exp Year</label>
                <input type="text" id="expyear" name="expyear" placeholder="2018">
              </div>
              <div class="col-50">
                <label for="cvv">CVV</label>
                <input type="text" id="cvv" name="cvv" placeholder="352">
              </div>
            </div>
          </div>
          
        </div>
        <input type="submit" value="Pay Now" class="btn-primary">
        <button class="btn-secondary" type="submit">Upload Receipt</button>
      </form>
    </div>
  </div>
  <div class="col-25">
    <div class="container">
      <h4>Order Summary <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i> <b>3 Item</b></span></h4>
      <p><a href="#">We Begin at the End</a> <span class="price">RM 15.00</span></p>
      <p><a href="#">Diary of a Wimpy Kid</a> <span class="price">RM 8.00</span></p>
      <p><a href="#">Maze Runner</a> <span class="price">RM 7.00</span></p>
      <hr>
      <p>Total <span class="price" style="color:black"><b>RM 30.00</b></span></p>
    </div>
  </div>
 </div>        <!-- /form card cc payment -->
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
                    
<style>
body,h1,h2,h3,h4,h5,h6 {font-family: "Raleway", sans-serif}

body, html {
  height: 100%;
  line-height: 1.8;
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
* {
  box-sizing: border-box;
}

.row {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
  margin: 0 -16px;
}

.col-25 {
  -ms-flex: 25%; /* IE10 */
  flex: 25%;
}

.col-50 {
  -ms-flex: 50%; /* IE10 */
  flex: 50%;
}

.col-75 {
  -ms-flex: 75%; /* IE10 */
  flex: 75%;
}

.col-25,
.col-50,
.col-75 {
  padding: 0 16px;
}

.container {
  background-color: #f2f2f2;
  padding: 5px 20px 15px 20px;
  border: 1px solid lightgrey;
  border-radius: 3px;
}

input[type=text] {
  width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

label {
  margin-bottom: 10px;
  display: block;
}

.icon-container {
  margin-bottom: 20px;
  padding: 7px 0;
  font-size: 24px;
}

a {
  color: #2196F3;
}

hr {
  border: 1px solid lightgrey;
}

span.price {
  float: right;
  color: grey;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
@media (max-width: 800px) {
  .row {
    flex-direction: column-reverse;
  }
  .col-25 {
    margin-bottom: 20px;
  }
}
</style>
</body>
<div style="padding-top:550px;">
<footer class="w3-center w3-black">
  <p> Online Preloved Book Shop </p>
</footer>
</div>
</html>