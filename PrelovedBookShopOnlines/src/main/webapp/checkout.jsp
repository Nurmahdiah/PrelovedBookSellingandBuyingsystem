<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Checkout</title>
<style type="text/css">
	table { border: 0;}
	table td { padding: 10px;}
</style>
</head>
<body>
<div align="center">
	
	<h1>Check out</h1>
	
	<form action="" method="post">
	<table>
		<tr>
			<td>Product / Service: </td>
			<td><input type="text" name="product" value="<%=session.getAttribute("bookTitle")%>" /></td>
		</tr>
		<tr>
			<td>Sub Total: </td>
			<td><input type="text" name="subtotal" value="100" /></td>
		</tr>
		<tr>
			<td>Shipping Fee: </td>
			<td><input type="text" name="shippingfee" value="10" /></td>
		</tr>
		<tr>
			<td>Tax: </td>
			<td><input type="text" name="taxfee" value="10" /></td>
		</tr>
		<tr>
			<td>Total: </td>
			<td><input type="text" name="totalfee" value="120" /></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="Checkout" />
			</td>
		</tr>
	</table>
	
	</form>
</div>
</body>
</html>