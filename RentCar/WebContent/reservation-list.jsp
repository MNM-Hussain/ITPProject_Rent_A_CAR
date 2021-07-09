<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Reservation List</title>
</head>
<link
	href="https://unpkg.com/bootstrap@4.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet" />

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.css" />


<body>
	<div class="container">

		<p>${message}</p>
		<button class="btn btn-primary"
			onclick="window.location.href='add-reservation.jsp'">Add New
			Reservation</button>
		<table border=1 class="table table-striped table-bordered"
			id="datatable">
			<thead>
				<tr class="thead-dark">
					<th>Rid</th>
					<th>Location</th>
					<th>Time</th>
					<th>Pickup Date</th>
					<th>Return Date</th>
					<th>No of Days</th>
					<th>No of passengers</th>
					<th>Actions</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${list }" var="r">
					<tr>
						<td>${r.rid }</td>
						<td>${r.location}</td>
						<td>${r.time1}</td>
						<td>${r.pickupdate}</td>
						<td>${r.returndate}</td>
						<td>${r.numofdays}</td>
						<td>${r.numofpassengers}</td>
						<td><a
							href="${pageContext.request.contextPath}/ReservationController?action=EDIT&rid=${r.rid}">Edit</a>
							| <a
							href="${pageContext.request.contextPath}/ReservationController?action=DELETE&rid=${r.rid}">Delete</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	<script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.js"></script>
	<script>
	$(document).ready(function(){
		$("#datatable").DataTable();
	})
	</script>




</body>
</html>