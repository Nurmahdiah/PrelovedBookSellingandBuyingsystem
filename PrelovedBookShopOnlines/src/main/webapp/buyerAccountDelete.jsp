<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.Connection" %>
<%@page import="java.sql.PreparedStatement" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Account Buyer</title>
</head>
<body>
<%

	if(request.getParameter("email") != null){
		
		String email = request.getParameter("email");
		
		String url = "jdbc:mysql://localhost:3307/PrelovedBookShop";
		String uname = "root";
		String pass = "";
		
		try{
			 Class.forName("com.mysql.jdbc.Driver");
			 Connection connection = DriverManager.getConnection(url,uname, pass);
			 
			 PreparedStatement preparedstatement = null;
			 
			 preparedstatement = connection.prepareStatement("DELETE FROM Buyer WHERE emailAddress=?");
			 preparedstatement.setString(1, email);
			 preparedstatement.executeUpdate();
			 
			 RequestDispatcher requestdispatcher = request.getRequestDispatcher("mainPage.jsp");
			 requestdispatcher.forward(request, response);
			 
			 preparedstatement.close();
			 connection.close();
					
		}
		catch(Exception e){
			e.printStackTrace();
		}
			 
		
	}
%>
</body>
</html>