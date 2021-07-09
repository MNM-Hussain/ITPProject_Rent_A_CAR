<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<title>A</title>
</head>
<body>
	<%
String uname=(String)session.getAttribute("uname");%>

	<div class="float-right">


		<a href="${pageContext.request.contextPath}/AdminHome/AdminHome.jsp">BACK
			TO HOME</a>

	</div>
	<div class="container">


		<h1>Driver allocation Directory</h1>


		<p>${NOTIFICATION}</p>

		<p>
			<button class="btn btn-primary"
				onclick="window.location.href = 'work.jsp'">Demo button for
				Insert</button>
		</p>

		<table class="table table-striped table-bordered" id="datatable">
			<thead>
				<tr class="thead-dark">
					<th>Allocation ID</th>
					<th>Booking ID</th>
					<th>Pick up location</th>
					<th>pick up time</th>
					<th>Pick up date</th>
					<th>Return date</th>
					<th>NUM of DAYS</th>
					<th>Num Of participants</th>

					<th>Driver ID</th>

					<th>Driver salary(per day 300)</th>


					<th>Actions</th>
				</tr>
			</thead>

			<c:forEach items="${list}" var="event">
				<tr>
					<td>${event.allocationid}</td>
					<td>${event.bookid}</td>
					<td>${event.pickuplocation}</td>
					<td>${event.pickupdate}</td>
					<td>${event.pickuptime}</td>
					<td>${event.returndate}</td>
					<td>${event.noofdays}</td>
					<td>${event.noofperson}</td>
					<td><a
						href="${pageContext.request.contextPath}/DriverControler?action=ADDSAL&driverid=${event.driverid}">${event.driverid}</a>
					</td>

					<td>${event.driversalary}</td>

					<td><a
						href="${pageContext.request.contextPath}/AllocationControler?action=EDIT&allocationid=${event.allocationid}">Edit</a>
						| <a
						href="${pageContext.request.contextPath}/AllocationControler?action=DELETE&allocationid=${event.allocationid}">Delete</a>

					</td>
				</tr>
			</c:forEach>
			</tbody>

		</table>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/v/bs4/dt-1.10.20/datatables.min.js"></script>
	<script>
	$(document).ready(function(){
		$("#datatable").DataTable();
	})
</script>

</body>
</html>