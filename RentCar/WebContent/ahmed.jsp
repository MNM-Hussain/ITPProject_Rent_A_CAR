<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.service.Employee"%>
<%@ page import="com.service.EmployeeImp"%>
<%@ page import="com.model.NewEmployee"%>







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
<link rel="stylesheet" type="text/css" href=" CSS/insert_rates.css">


<title>financial manager</title>


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
										class="btn btn-primary btn-sm"> </a>

								</div>
							</form>


						</div>
						<br>
						<hr class="my-0">

						<div class="card-body text-center">

							<div>
								<nav class='animated bounceInDown'>
								<ul>

									<li class='sub-menu'><a href='#'>IncomeStatement
											<div class='fa fa-caret-down right'></div>
									</a>
										<ul>
											<li><a href="Insert_income_statement.jsp">Calculate
													IncomeStatement</a></li>
											<li><a href="View_IncomeStatement.jsp">View
													IncomeStatement</a></li>
										</ul>
									<li class='sub-menu'><a href='Insert_Rates.jsp'>Rates
											<div class='fa fa-caret-down right'></div>
									</a>
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
						<h5 class="card-title mb-0">Rates</h5>
						<div class="card-body h-100"></div>
					</div>



					<table border="2" cellpadding="12" class="table table-hover">
						<th>First Name</th>
						<th>Last Name</th>
						<th>Emp_ID</th>
						<th>NIC</th>
						<th>Address</th>
						<th>Phone Num</th>
						<th>Email</th>
						<th>Job role</th>
						<th>Basic_salary</th>
						<th></th>
						<th></th>





						</tr>
						<%
								Employee emp = new EmployeeImp();
								ArrayList<NewEmployee> emplo = emp.listemployee();
						
								
								for (NewEmployee employee : emplo) {
							%>
						<tr>
							<td><%=employee.getFirstName()%></td>
							<td><%=employee.getLastName()%></td>
							<td><%=employee.getEmpID()%></td>
							<td><%=employee.getNIC()%></td>
							<td><%=employee.getAddress()%></td>
							<td><%=employee.getPhoneNum()%></td>
							<td><%=employee.getEmail()%></td>
							<td><%=employee.getJobrole()%></td>
							<td><%=employee.getBasicSal()%></td>

							<td>
								<form action="./GetEmployee" method="post">
									<input type="hidden" name="id" class="btn btn-primary"
										value="<%=employee.getNIC()%>"> <input type="submit"
										value="View">


								</form>
							</td>
							<td><span></span>


								<form action="./DeleteEmployee" method="post">
									<input type="hidden" name="id" class="btn btn-danger"
										value="<%=employee.getNIC()%>"> <input type="submit"
										value="Delete">
								</form> </span></td>
						</tr>
						<%
								}
							%>
						<div></div>
					</table>





					<br> <br>

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