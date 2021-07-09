<%@page import="service.CustomerImp"%>
<%@page import="service.ICustomer"%>
<%@page import="Model.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>

<%@page import="Servlet.AddCustServlet"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>

<html>

<style>
body {
	background-image: url('img/cus.jpg');
	background-size: cover;
	background-attachment: fixed;
}

h1 {
	text-align: center;
}

input[type=text], select {
	width: 80%;
	padding: 12px 20px;
	margin: 5px 50px 20px 40px;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=date], select {
	width: 80%;
	padding: 12px 20px;
	margin: 5px 50px 20px 40px;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=tel], select {
	width: 80%;
	padding: 12px 20px;
	margin: 5px 50px 20px 40px;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=email], select {
	width: 80%;
	padding: 12px 20px;
	margin: 5px 50px 20px 40px;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

input[type=submit] {
	width: 80%;
	padding: 14px 20px;
	margin: 5px 50px 8px 40px;
	border: 2px solid #000000;
	border-radius: 4px;
	background-color: #2edaff;
	color: #000000;
}

input[type=submit]:hover {
	background-color: #007d99;
}

.diform {
	background-color: rgb(0, 0, 0, 0.3);
	padding: 20px;
	font-size: 20px;
	border-radius: 5px;
	width: 35%;
	border: 2px solid #000000;
	margin: auto;
}

label {
	padding: 30px;
	font-weight: bold;
}
</style>

<%@include file="headerjsp.jsp"%>

<head>
<meta charset="ISO-8859-1">

<title>CustomerDetails</title>
<script>
	

</script>
</head>

<body>




	<h1>Customer Details</h1>

	<div class="diform">
		<form action="AddCustServlet" method="post" id="add">
		
		<!-- mine -->
		<%	String finalcost =request.getParameter("finalcost"); %>
		
		<input type="hidden" name="finalcost"  value="<%=finalcost%>">
		
		
		
			<label for="fname">First Name</label> 
			<br> 
			<input type="text" id="fname" name="FirstName" placeholder="fname" required> 
			<br>

			<label for="lname">Last Name</label> 
			<br> 
			<input type="text" id="lname" name="LastName" placeholder="lname" required> 
			<br>

			<label for="NIC">NIC</label> 
			<br> 
			<input type="text" id="nic" name="NIC" placeholder="0000000000" pattern="[0-9]{9}[vVxX]{1}||[0-9]{12}" required> 
			<br> 
			
			
			<label for="address">Address</label> 
			<br> 
			<input type="text" id="addr" name="Address" placeholder="address" required>
			<br> 
			
			<label for="phone">Contact Number</label> 
			<br> 
			<input type="tel" id="phone" name="Phone" placeholder="phone no" pattern="[0-9]{3}[0-9]{7}" required> 
			<br> 
			
			<label for="email">E-mail</label> <br> <input type="email" id="email" name="Email" placeholder="email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required> 
			<br>
			
			<br> <input type="submit" value="SUBMIT" name="Add">
			
		</form>
	</div>









</body>
<%@include file="Footer.jsp"%>
</html>