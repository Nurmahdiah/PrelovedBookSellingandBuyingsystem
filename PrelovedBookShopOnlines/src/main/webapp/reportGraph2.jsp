<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ page import="java.util.*,java.sql.*" %>
<%@ page import="com.google.gson.Gson"%>
<%@ page import="com.google.gson.JsonObject"%>
<%

Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
String dataPoints = null;
 
try{
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/PrelovedBookShop", "root", "");
	Statement statement = connection.createStatement();
	String xVal, yVal;
	
	ResultSet resultSet = statement.executeQuery("SELECT Orders.bookId, PrelovedBook.Id, PrelovedBook.bookTitle, SUM(Orders.quantity) As Quantity FROM Orders INNER JOIN PrelovedBook ON Orders.bookId=PrelovedBook.Id WHERE Orders.sellerEmailAddress='"+session.getAttribute("sellerLogin")+"' AND Orders.status='paid' GROUP BY Orders.bookId");
	
	int i = 0;

	while(resultSet.next()){
		
		map = new HashMap<Object,Object>(); 
		//map.put("x", Integer.parseInt(xVal)); 
		map.put("label", resultSet.getString("bookTitle")); 
		map.put("y", Integer.parseInt(resultSet.getString("Quantity"))); 
		list.add(map);
		
	}
	dataPoints = gsonObj.toJson(list);
	connection.close();
}
catch(SQLException e){
	dataPoints = null;
}

/*
Gson gsonObj = new Gson();
Map<Object,Object> map = null;
List<Map<Object,Object>> list = new ArrayList<Map<Object,Object>>();
String dataPoints = null;
String xVal = "";
 String year = request.getParameter("year");
try{
	Class.forName("com.mysql.jdbc.Driver"); 
	Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3307/PrelovedBookShop", "root", "");
	Statement statement = connection.createStatement();
	
	
	ResultSet resultSet = statement.executeQuery("SELECT MONTH(date) As Month, SUM(amount) As Sales FROM Order WHERE sellerEmailAddress='"+session.getAttribute("sellerLogin")+"' AND status='paid' AND YEAR(date)='"+year+"' GROUP BY MONTH(date)");
	
	while(resultSet.next()){
		
		int month = Integer.parseInt(resultSet.getString("Month"));
		if (month == 1){
			xVal = "January";
		}
		else if (month == 2){
			xVal = "February";
		}
		else if (month == 3){
			xVal = "March";
		}
		else if (month == 4){
			xVal = "April";
		}
		else if (month == 5){
			xVal = "May";
		}
		else if (month == 6){
			xVal = "June";
		}
		else if (month == 7){
			xVal = "July";
		}
		else if (month == 8){
			xVal = "August";
		}
		else if (month == 9){
			xVal = "September";
		}
		else if (month == 10){
			xVal = "October";
		}
		else if (month == 11){
			xVal = "November";
		}
		else if (month == 12){
			xVal = "December";
		}
		map = new HashMap<Object,Object>(); 
		map.put("label", xVal); map.put("y", Double.parseDouble(resultSet.getString("Sales"))); 
		list.add(map);
		
	}
	dataPoints = gsonObj.toJson(list);
	connection.close();
}
catch(SQLException e){
	dataPoints = null;
}
*/%>
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
<script type="text/javascript">

window.onload = function() { 
 
<% if(dataPoints != null) { %>
var chart = new CanvasJS.Chart("chartContainer", {
	//theme: "light2",
	title: {
		text: "Annual Sales Amount"
	},
	axisX: {
		title: "Total Sales Amount"
	},
	axisY: {
		title: "Month",
		includeZero: true
	},
	data: [{
		type: "column", //change type to bar, line, area, pie, etc
		indexLabel: "{y}",
		indexLabelFontColor: "#111111",
		dataPoints: <%out.print(dataPoints);%>
	}]
});
chart.render();
<% } %> 
 
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
</body>
<!-- Footer -->
<footer style="color:white; background-color:#455DAD" class="w3-center">
  <p class=""> &copy; Preloved Book Shop | 2021 Version</p>
</footer>
</html>