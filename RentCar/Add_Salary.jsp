
<%@ page import="com.model.NewEmployee"%>








<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script src="js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href=" CSS/UserViewMyEvent.css">
<link rel="stylesheet" type="text/css" href=" CSS/employee.css">


<title>Add details</title>


</head>

<body>


	<div class="container">
		<h1 class="h3 mb-3">Profile</h1>
		<div class="row">
			<div class="col-md-4 col-xl-3">
				<div class="card mb-3">
					<div class="card-header">



						<h5 class="card-title mb-0 text-center">User</h5>
					</div>
					<div class="card-body text-center">
						<br> <img src="images/avatar7.png" alt="Marie Salter"
							class="img-fluid rounded-circle mb-2" width="128" height="128">
						<h4 class="card-title mb-0"></h4>
						<br>
						<div>


							<form action="LogoutServlet">
								<div>


									<input type="submit" value="logout"
										class="btn btn-primary btn-sm">

								</div>
							</form>


						</div>
						<br>
						<hr class="my-0">

						<div class="card-body text-center">

							<div>
								<nav class='animated bounceInDown'>
								<ul>
									<li class='sub-menu'><a href='#'>Employees
											<div class='fa fa-caret-down right'></div>
									</a>
										<ul>
											<li><a href="Present_employees.jsp">Present
													employees</a></li>
											<li><a href="MyComplaint.jsp">Past employees</a></li>
										</ul>
									<li><a href="userProfile.jsp">Salary</a></li>
									<li><a href="UserViewMyEvent.jsp">Report</a></li>

								</ul>





								</nav>





							</div>
						</div>
					</div>


				</div>
			</div>
			<div class="col-md-8 col-xl-9">
				<div class="card" style="height: 1000px;">
					<div class="card-header">
						<h5 class="card-title mb-0">Add Salary details</h5>
						<div class="card-body h-100"></div>
					</div>





					<form class="form-container" action="Calculate_Salary.jsp"
						method="post" id="ticket_submit">




						<label>NIC num</label> <input type="text" class="form-control"
							id="exampleInputFName" name="nic" required> <br>

						<label>Basic Salary</label> <input type="number"
							class="form-control" id="exampleInputFName" name="bsal" required>
						<br> <label>Attendance</label> <input type="number"
							class="form-control" id="exampleInputFName" name="attendnce"
							required> <br>

						<div>
							<br>
							<br> <span><input type="submit"
								class="btn btn-success " value="CALCULATE"
								style="margin-left: 400px;"></span>
						</div>

					</form>

				</div>



			</div>
		</div>
	</div>





























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