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
<title>Update</title>
</head>
<body>
    <% 
     
     String status = "paid";
	 String url = "jdbc:mysql://localhost:3307/PrelovedBookShop";
	 String uname = "root";
	 String pass = "";
	 String updateQuery = "UPDATE Orders SET status=? WHERE Orders.buyerEmailAddress='"+session.getAttribute("buyerLogin")+"' AND Orders.orderId='"+session.getAttribute("orderidsession")+"'";
	 try{
		 Class.forName("com.mysql.jdbc.Driver");
		 Connection connection = DriverManager.getConnection(url,uname, pass);
		 
		 PreparedStatement preparedstatement = null;
		 
		 preparedstatement = connection.prepareStatement(updateQuery);	
		 
		 preparedstatement.setString(1, status);

		 
		 preparedstatement.executeUpdate();
		 
		 RequestDispatcher requestdispatcher = request.getRequestDispatcher("review.jsp");
		 requestdispatcher.forward(request, response);
		 
	     preparedstatement.close();
		 connection.close();
	 }
	 catch(SQLException e) {
			e.printStackTrace();
		}
	%>
</body>
</html>