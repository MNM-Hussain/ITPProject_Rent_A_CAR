<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>connect saajidh</title>
</head>
<body>
	<div class=container>
		<p>${Notification}</p>
		change driver details
		<form action="${pageContext.request.contextPath}/DriverControler"
			method="post">
			Driver name<input type="text" name="name" value="${driver.name}"><br>
			Driver dob<input type="date" name="dob" value="${driver.dob}"><br>
			Driver mail<input type="text" name="email" value="${driver.email}"><br>
			Driver l num<input type="text" name="licence_num"
				value="${driver.licence_num}"><br> Driver address<input
				type="text" name="address" value="${driver.address}"><br>
			Driver mobile<input type="text" name="mobile"
				value="${driver.mobile}"><br> 
			 salary(to be paid)<input type="text" name="salary"
				value="${driver.salary}"><br> <input type="hidden"
				name="driverid" value="${driver.driverid}"><br> <input
				type="submit" name="subs" value="submit"><br>
		</form>
	</div>
</body>
</html>