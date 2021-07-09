<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://unpkg.com/bootstrap@4.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<meta charset="ISO-8859-1">
<title>connect saajidh</title>
</head>
<body>
	<div class=container>
		<div class="row">
			<div class="col-md-4">
				<p>${Notification}</p>
				<h3>
					<center>Add driver</center>
				</h3>
				<form action="${pageContext.request.contextPath}/DriverControler"
					method="post">
					<div class="form-group">
						Driver name<input type="text" name="name" class="form-control"
							value="${driver.name}" required>
					</div>
				
						<div class="form-group">Driver dob<input type= "date" class="form-control" name="dob"value = "${driver.dob}" required></div>
<div class="form-group">Driver mail<input type= "mail" class="form-control" name="email"value = "${driver.email}" required></div>
<div class="form-group">Driver licence  number<input type= "text" class="form-control" name="licence_num"value = "${driver.licence_num}"required></div>
<div class="form-group">Driver address<input type= "text" class="form-control" name="address"value = "${driver.address}"required></div>
<div class="form-group">Driver mobile<input type= "text" class="form-control" name="mobile"value = "${driver.mobile}"required placeholder="0777 309 608" pattern="[0-9]{4} [0-9]{3} [0-9]{3}" title = "follow the pattern as 07xx xxx xxx"></div>
<div class="form-group"> salary<input type= "text" class="form-control" name="salary"value = "${driver.salary}"required ></div>
<



<input type = "hidden"   name = "driverid"value = "${driver.driverid}"><br>


<input type= "submit" name="subs" value="submit" ><br>
</form>
		</div>
	</div>
</div>
</body>
</html>