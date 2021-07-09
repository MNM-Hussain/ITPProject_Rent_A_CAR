    <%@ page import="com.model.NewEmployee" %>









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


<link rel="stylesheet" type="text/css" href=" CSS/ADMIN_PAGE.css">
<!-- <link rel="stylesheet" type="text/css" href=" CSS/employee.css">   -->


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
								<nav class='animated bounceInDown'>
								<ul>
									<li class='sub-menu'><a href='#'>Employees
											<div class='fa fa-caret-down right'></div>
									</a>
										<ul>
											<li><a href="Add_Employee.jsp">Add new	employees</a></li>
											 
											<li><a href="past_employee.jsp">Past employees</a></li>
											<li><a href="Present_employees.jsp">Present employees</a></li>
										</ul>
									<li><a href="EmployeeSalary.jsp">Salary</a></li>
									<li><a href="https://mail.google.com/mail/u/0/#inbox">Email</a></li>

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
						<h5 class="card-title mb-0">Update details</h5>
						<div class="card-body h-100"></div>
					</div>
				<%NewEmployee emp=(NewEmployee)request.getAttribute("emp"); %>
						
					    <form class="form-container" action="./UpdateEmployee"  method="post"  id="ticket_submit">
	
				
				<label>First Name</label>
				<input type="text" class="form-control" id="exampleInputFName"   name="fname"  value="<%=emp.getFirstName()%>"  required     >
				<br>
				
				<label>Last Name</label>
				<input type="text" class="form-control" id="exampleInputFName"   name="lname" value="<%=emp.getLastName()%>"  required>
				<br>
				
				<label>Employee Id</label>
				<input type="number" class="form-control" id="exampleInputPassword1"   name="empid" value="<%=emp.getEmpID()%>" required><br>
				
				<label>NIC num</label>
				<input type="text" class="form-control" id="exampleInputFName"   name="nic"  value="<%=emp.getNIC()%>"  required     >
				<br>
				
				<label>Address</label>
				<input type="text" class="form-control" id="exampleInputFName"   name="address"    value="<%=emp.getAddress()%>"  required     >
				<br>
				
				<label>Phone Number</label>
				<input type="phone" class="form-control" id="exampleInputFName"   name="phone"  value="<%=emp.getPhoneNum()%>"  required     >
				<br>
				
				<label>Email Id</label>
				<input type="email" class="form-control" id="exampleInputFName"   name="email"   value="<%=emp.getEmail()%>"        >
				<br>
				
				<label>Job role</label>
				<input type="text" class="form-control" id="exampleInputFName"   name="job"  value="<%=emp.getJobrole()%>"    required     >
				<br>
				
				<label>Basic salary per month</label>
				<input type="number" class="form-control" id="exampleInputFName"   name="bsal"   value="<%=emp.getBasicSal()%>" required     >
				<br>
				
				<div>
				<br><br>
				<input type="submit" class="btn btn-success "  value="update"  style="margin-left:10px; width:100px; ">
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