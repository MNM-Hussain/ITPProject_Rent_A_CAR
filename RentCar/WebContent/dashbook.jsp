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


<title>MYEvent</title>


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
										href="${pageContext.request.contextPath}/BookControler">Allocate
											Driver</a></li>
									
											
											<li class='sub-menu'><a href='#'>Allocation table
											<div class='fa fa-caret-down right'></div>
									</a>
										<ul>
											<li><a
												href="${pageContext.request.contextPath}/AllocationControler">Allocation
											table</a></li>
											<li><a
												href="${pageContext.request.contextPath}/AllocationControler?action=past">Past Allocation
											table</a></li>
										</ul>
											
									<li class='sub-menu'><a href='#'>Driver table
											<div class='fa fa-caret-down right'></div>
									</a>
										<ul>
											<li><a
												href="${pageContext.request.contextPath}/DriverControler">Driver
													table</a></li>
										</ul>
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
						<h5 class="card-title mb-0">Work allocation</h5>
						<div class="card-body h-100"></div>
					</div>
					<%
String uname=(String)session.getAttribute("uname");%>

					<div class="float-right"></div>
					<div class="container">



						<div class="float-right"></div>
						<div class="container">


							<h1>Booking Directory</h1>


							<p>${NOTIFICATION}</p>

							<p>
								<button class="btn btn-primary"
									onclick="window.location.href = 'addwork.jsp'">Demo
									button for Insert</button>
							</p>

							<table class="table table-striped table-bordered" id="datatable">
								<thead>
									<tr class="thead-dark">
									    <th>Book id</th>
										<th>Pick up location</th>
										<th>pick up date</th>
										<th>Pick up time</th>
										<th>Return date</th>
										
										<th>Number Of participants</th>
										
                                        <th>Status</th>
										<th>Actions</th>
									</tr>
								</thead>

								<c:forEach items="${list}" var="event">
									<tr>
									    <td>${event.bookid}</td>
										<td>${event.pickuplocation}</td>
										<td>${event.pickupdate}</td>
										<td>${event.pickuptime}</td>
										<td>${event.returndate}</td>
									
										<td>${event.noofperson}</td>
										 <td>${event.status}</td> 
										

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