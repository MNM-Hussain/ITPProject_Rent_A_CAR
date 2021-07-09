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


		<h1>Booking Directory</h1>


		<p>${NOTIFICATION}</p>

		<p>
			<button class="btn btn-primary"
				onclick="window.location.href = 'addwork.jsp'">Demo button
				for Insert</button>
		</p>

		<table class="table table-striped table-bordered" id="datatable">
			<thead>
				<tr class="thead-dark">
					<th>Pick up location</th>
					<th>pick up date</th>
					<th>Pick up time</th>
					<th>Return date</th>
					<th>NUM of DAYS</th>
					<th>Num Of participants</th>

					<th>Actions</th>
				</tr>
			</thead>

			<c:forEach items="${list}" var="event">
				<tr>
					<td>${event.pickuplocation}</td>
					<td>${event.pickupdate}</td>
					<td>${event.pickuptime}</td>
					<td>${event.returndate}</td>
					<td>${event.noofdays}</td>
					<td>${event.noofperson}</td>

					<td><a
						href="${pageContext.request.contextPath}/BookControler?action=EDIT&bookid=${event.bookid}">Edit</a>
						| <a
						href="${pageContext.request.contextPath}/BookControler?action=DELETE&bookid=${event.bookid}">Delete</a>
						| <a
						href="${pageContext.request.contextPath}/BookControler?action=Allocate job&bookid=${event.bookid}">Allocate
							DRIVER</a></td>
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