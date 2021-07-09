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
				<form action="${pageContext.request.contextPath}/BookControler"
					method="post">
					<div class="form-group">
						pick up location<input type="text" class="form-control"
							name="pickuplocation" value="${event.pickuplocation}">
					</div>
					<div class="form-group">
						pick up date<input type="date" class="form-control"
							name="pickupdate" value="${event.pickupdate}">
					</div>
					<div class="form-group">
						pick up time<input type="time" class="form-control"
							name="pickuptime" value="${event.pickuptime}">
					</div>
					<div class="form-group">
						Return date<input type="date" class="form-control"
							name="returndate" value="${event.returndate}">
					</div>
					<div class="form-group">
						NO of PARCIPANTS<input type="number" class="form-control"
							name="noofperson" value="${event.noofperson}">
					</div>
					<div class="form-group">
						No OF DAYS<input type="number" class="form-control"
							name="noofdays" value="${event.noofdays}">
					</div>
					<div class="form-group">
						Reservation ID<input type="text" class="form-control"
							name="bookid" value="${event.bookid}">
					</div>





					<input type="submit" name="subs" value="submit"><br>
				</form>
			</div>
		</div>
	</div>
</body>
</html>