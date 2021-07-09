<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reservation</title>
<link rel="stylesheet" href="reservation.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<%@include file="header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
</head>
<body>

	<form
		action="${pageContext.request.contextPath }/ReservationController"
		method="post">
		<div class="reservation-form-box">
			<div class="reservation-form">

				<label>Pickup Location</label> <input type="text" name="location"
					class="form-control" value="${reservation.location}"
					placeholder="Enter Location" required> <label>Time</label>
				<input type="time" value="${reservation.time1}" name="time1"
					class="form-control" placeholder="Time" required>

				<div class="input-grp">
					<label>Pickup Date</label> <input type="date"
						value="${reservation.pickupdate}" name="pickupdate"
						class="form-control select date" required>
				</div>

				<div class="input-grp">
					<label>Return Date</label> <input type="date" name="returndate"
						value="${reservation.returndate}" class="form-control select date"
						required>
				</div>

				<div class="input-grp">
					<label>No Of Days</label> <input type="number" name="numofdays"
						value="${reservation.numofdays}" class="form-control">
				</div>

				<div class="input-grp">
					<label>No Of Passengers</label> <input type="number"
						value="${reservation.numofpassengers}" name="numofpassengers"
						class="form-control" required>
				</div>
				<input type="hidden" value="${reservation.rid}" name="rid" />

				<p></p>

				<div class="input-grp">

					<button type="submit" name="submit" class="btn btn-primary car">Proceed</button>
				</div>


			</div>
		</div>
	</form>
	<br>
	</br>
	<br>
	</br>
	<br>
	</br>
	<br>
	</br>
	<br>
	</br>
	<br>
	</br>
	<br>
	</br>
	<br>
	</br>
	<br>
	</br>
	<br>
	</br>
	<br>
	</br>
	<br>
	</br>
</body>
<%@include file="Footer.jsp"%>
</html>