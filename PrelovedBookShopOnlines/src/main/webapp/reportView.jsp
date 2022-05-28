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
    <title>Report Sales Details</title>
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
}

.w3-bar .w3-button {
  padding: 16px;
}
table,th,td{
text-align: center;
cell-padding:3px;

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
<h4><a href="newShop.jsp">Seller</a> / <a href="report.jsp">Sales Report</a> / Sales Report Details</h4>
<br>
<div class="row gutters">
<div class="col-xl-3 col-lg-3 col-md-12 col-sm-12 col-12">
<div class="card h-100">
	<div class="card-body">
	             <%
		
	    		 //
	        	 //, MONTH(date) as Month,  YEAR(date) as Year 
	        	 //AND Month='"+month+"' AND Year='"+year+"'      
	 //int month = Integer.parseInt(request.getParameter("month"));
	 //int year = Integer.parseInt(request.getParameter("year"));        
	 String bulan = request.getParameter("month");
	 int month = Integer.parseInt(bulan);
	 String year = request.getParameter("year");  
	 String pay = "paid";
	 String url = "jdbc:mysql://localhost:3307/PrelovedBookShop";
	 String uname = "root";
	 String pass = "";

	%> 
		<div class="account-settings">
		<table  class="responsive">
				<tr>
					<th><label for="month">Month</label></th>
					<%
					switch(month){
					
					case 1:
					%><td><label> January</label></td>	
					<%
					break;
					case 2:
					%><td><label> February</label></td>	
					<%
					break;
					case 3:
				    %><td><label> March</label></td>	
					<%
					break;
					case 4:
					%><td><label> April</label></td>	
					<%
					break;
					case 5:
					%><td><label> May</label></td>	
					<%
					break;
					case 6:
					%><td><label> June</label></td>	
					<%
					break;
					case 7:
					%><td><label> July</label></td>	
					<%
					break;
					case 8:
					%><td><label> August</label></td>	
					<%
					break;
					case 9:
					%><td><label> September</label></td>	
					<%
					break;
					case 10:
					%><td><label> October</label></td>	
					<%
					break;
					case 11:
					%><td><label> November</label></td>	
					<%
					break;
					case 12:
					%><td><label> December</label></td>	
					<%
					break;
					}
					%>
				</tr>
				<tr>
					<th><label for="year">Year</label></th>
					<td><label> <%=year%> </label></td>
				
				</tr>
				</table>
		</div>
		
	</div>
						<a style="padding-left:30px;padding-bottom:25px;" class="text-left" href="report.jsp"><i class="fa fa-arrow-left"></i> Back</a>
</div>
</div>
<div class="col-xl-9 col-lg-9 col-md-12 col-sm-12 col-12">
<div class="card h-100">
	<div class="card-body">
		<div class="row gutters">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<h6 class="mb-2 text-primary">Monthly Sales Report</h6>
			</div>
			
		<div class="row gutters">
		<div class="jarak">
<table  class="table" id="printTable">
  <thead class="thead-light">

    <tr>
      <th scope="col">#</th>
      <th scope="col">Sales Date</th>
      <th scope="col">Sales Quantity</th>
      <th scope="col">Book Sales Amount</th>
    </tr>
  </thead>
    	 <% 
    	 int i = 1;
		 double sales, totalsales = 0;
	 try{
		 Class.forName("com.mysql.jdbc.Driver");
		 Connection connection = DriverManager.getConnection(url,uname, pass);
		 
		 PreparedStatement preparedstatement = null;
		 
		 preparedstatement = connection.prepareStatement("SELECT * FROM Orders WHERE sellerEmailAddress='"+session.getAttribute("sellerLogin")+"' AND status='"+pay+"' AND MONTH(date) ='"+month+"' ");
		 
		 ResultSet resultset = preparedstatement.executeQuery();
		 
		 while(resultset.next()){
	     
	 %>
	 
	 
  <tbody>
    <tr>
      <th scope="row"><%=i++%></th>
      <td><%=resultset.getString("date")%></td>
      <td><%=resultset.getString("quantity")%></td>
      <td>RM <%=resultset.getString("amount")%></td>
      <%
      
      sales = Double.parseDouble(resultset.getString("amount"));
      totalsales += sales;
      %>
    </tr>
    			<%
		 }
		 
	     //outer part for end of while loop
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
		<div class="row gutters">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="text-right">
					<br>
					<h5>Sales Total (RM)</h5>
					<h3><%=totalsales %></h3>
					<br>
				</div>
			</div>
		</div>
		<div class="row gutters">
			<div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
				<div class="text-right">
					<button type="button" id="submit" name="submit" class="btn btn-primary">Generate Report</button>
				</div>
			</div>
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
th, td{
padding-left: 20px;
}
.jarak{
padding-left: 10px;
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
function printData()
{
   var divToPrint=document.getElementById("printTable");
   newWin= window.open("");
   newWin.document.write(divToPrint.outerHTML);
   newWin.print();
   newWin.close();
}

$('button').on('click',function(){
printData();
})
</script>
</body>
<!-- Footer -->
<footer style="color:white; background-color:#455DAD" class="w3-center">
  <p class=""> &copy; Preloved Book Shop | 2021 Version</p>
</footer>
</html>