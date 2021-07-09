<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">

<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script src="js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href=" CSS/style.css">
<link rel="stylesheet" type="text/css" href=" CSS/insert_rates.css">


<title>Reservation</title>


</head>

<body>


	<div class="container" style="width: 100%;">
		<h1 class="h3 mb-3">Profile</h1>
		<div class="row">
			<div class="col-md-4 col-xl-3" style="width: 45%;">
				<div class="card mb-3">
					<div class="card-header">



						<h5 class="card-title mb-0 text-center">User</h5>
					</div>
					<div class="card-body text-center">
						<br> <img src="images/avatar7.jpeg" alt="Marie Salter"
							class="img-fluid rounded-circle mb-2" width="130" height="128">
						<h4 class="card-title mb-0"></h4>
						<br>
						<div>


								<div>

									<a href="Adminlogin.jsp">
									<input type="submit" value="logout"
										class="btn btn-primary btn-sm">

								</div>


						</div>
						<br>
						<hr class="my-0">

						<div class="card-body text-center">

							<div>
								<!-- asa -->
								<nav class='animated bounceInDown'>
								<ul>
									<li><a
										href="${pageContext.request.contextPath}/ReservationController">View</a></li>
									
								
								<li><a href="https://mail.google.com/mail/u/0/#inbox">Email</a></li>

								</ul>





								</nav>

							</div>
						</div>
					</div>


				</div>
			</div>
			<div class="col-md-8 col-xl-9" style="width: 75%">
				<div class="card" style="height: 1000px;">
					<div class="card-header">
						<h5 class="card-title mb-0">Reservation</h5>
						<div class="card-body h-100"></div>
					</div>
					
					
					
					
					
					
					<div class="container">


						<p>${message}</p>
						<button class="btn btn-primary"
							onclick="window.location.href='add-reservation.jsp'">Add
							New Reservation</button>


<br></br>

					<form  action="ReservationReport.jsp"  method="post">  

<input type="text" name="month" placeholder="Enter the month..">

<input type="submit"  value="generate report" >


</form>



						<table border=1 class="table table-striped table-bordered"
							id="datatable">

							<thead>
								<tr class="thead-dark">
									<th>Rid</th>
									<th>Location</th>
									<th>Time</th>
									<th>Pickup Date</th>
									<th>Return Date</th>
								
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
				</div>


				<script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>
				<script type="text/javascript"
					src="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.js"></script>
				<script>
	$(document).ready(function(){
		$("#datatable").DataTable();
	})
	</script>




			</div>





		</div>
	</div>
	</div>






	<script>
                $('.sub-menu ul').hide();
$(".sub-menu a").click(function () {
	$(this).parent(".sub-menu").children("ul").slideToggle("100");
	$(this).find(".right").toggleClass("fa-caret-up fa-caret-down");
});
</script>

</body>
</html>