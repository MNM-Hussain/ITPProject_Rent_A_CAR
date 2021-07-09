<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="com.service.Employee"%>
<%@ page import="com.service.EmployeeImp"%>

<%@ page import="com.service.ISalary"%>
<%@ page import="com.service.SalaryImpl"%>




<%@ page import="com.model.NewEmployee"%>
<%@ page import="com.model.Salary"%>







<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
	
	
	<style>
div.scrollmenu {
	overflow: auto;
	white-space: nowrap;
}
</style>
	
	
	
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


<title>Salary</title>


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
								</a>

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
											 <li><a href="Add_Employee.jsp">Add employees</a></li>
											<li><a href="Present_employees.jsp">Present	employees</a></li>
											<li><a href="past_employee.jsp">Past employees</a></li>
											
										</ul>
									 
								<li><a href="https://mail.google.com/mail/u/0/#inbox">Email</a></li>

								</ul>
								</nav>





							</div>
						</div>
					</div>


				</div>
			</div>
			
			
			
			
			
			<div class="col-md-8 col-xl-9">
				<div class="card" style="height: 1000px; width: 900px;">
					<div class="card-header">
						<h5 class="card-title mb-0">Salary Details</h5>
						<div class="card-body h-100"></div>
					</div>


   <br> </br>

	<div class="scrollmenu">
	
	
	
		
									<div class="col-md-4">
						
						
						<form  action="employeeReport.jsp"  method="post">  

<input type="text" name="month" placeholder="Enter the month..">

<input type="submit"  value="generate report" >


</form>
						
				  </div>
							<br> </br>
						
	
	



                     

					<table border="2" cellpadding="12" class="table table-hover"
						id="customers1">
						 <th>Date</th>
						<th>NIC number</th>
						<th>Basic Salary per day</th>
						<th>Attendance</th>
						
						<th>EPF</th>
						<th>ETF</th>
						<th>Net Salary</th>





						</tr>
						<%
							
						

						
						
								
								SalaryImpl sal=new SalaryImpl();
								ArrayList <Salary>arrayList= sal.listsalary();
								
								for (Salary salary1 : arrayList) {
							%>
						<tr>
							<td><%=salary1.getDate()%></td>
							<td><%=salary1.getNIC()%></td>
							
							<td><%=salary1.getBasSal()%></td>
							<td><%=salary1.getAttendnce()%></td>
							<td><%=salary1.getEPF()%></td>
							<td><%=salary1.getETF()%></td>
							<td><%=salary1.getNetSal()%></td>
						</tr>
						
						
						 
								
							
					
							
						
							
							 
							
							 
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