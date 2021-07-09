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


		<h1>Driver v Directory</h1>


		<p>${NOTIFICATION}</p>

		<p>
			<button class="btn btn-primary"
				onclick="window.location.href = 'adddriver.jsp'">Add new
				driver</button>
		</p>

		<table class="table table-striped table-bordered" id="datatable">
			<thead>
				<tr class="thead-dark">
					<th>Driver id</th>
					<th>name</th>
					<th>Date of birth</th>
					<th>email</th>
					<th>license number</th>
					<th>Address</th>
					<th>Mobile</th>
					<th>total trip salary</th>

					<th>Actions</th>
				</tr>
			</thead>

			<c:forEach items="${list}" var="event">
				<tr>
					<td>${event.driverid}</td>
					<td>${event.name}</td>
					<td>${event.dob}</td>
					<td>${event.email}</td>
					<td>${event.licence_num}</td>
					<td>${event.address}</td>
					<td>${event.mobile}</td>
					<td>${event.netsalary}</td>

					<td><a
						href="${pageContext.request.contextPath}/DriverControler?action=EDIT&driverid=${event.driverid}">Edit</a>
						| <a
						href="${pageContext.request.contextPath}/DriverControler?action=DELETE&driverid=${event.driverid}">Delete</a>
						|</td>
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