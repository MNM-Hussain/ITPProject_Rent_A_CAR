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
				
				<b>DRIVER DETAILS<b>
				<form action="${pageContext.request.contextPath}/DriverControler"
					method="post">
					<div class="form-group">
						Driver name<input type="text" name="name" class="form-control"
							value="${driver.name}">
					</div>
					<div class="form-group">
						Driver dob<input type="date" class="form-control" name="dob"
							value="${driver.dob}">
					</div>
					<div class="form-group">
						Driver mail<input type="text" class="form-control" name="email"
							value="${driver.email}">
					</div>
					<div class="form-group">
						Driver l num<input type="text" class="form-control"
							name="licence_num" value="${driver.licence_num}">
					</div>
					<div class="form-group">
						Driver mobile <input type="text" class="form-control"
							name="address" value="${driver.mobile}">
					</div>
					<div class="form-group">
						Driver address<input type="text" class="form-control"
							name="mobile" value="${driver.address}">
					</div>
					
					




					<input type="hidden" name="driverid" value="${driver.driverid}"><br>


				</form>
			</div>
		</div>
	</div>
</body>
</html>