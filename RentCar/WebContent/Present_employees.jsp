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


<title>Present Employees</title>


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
				<div class="card" style="height: 1000px; width: 900px;">
					<div class="card-header">
						<h5 class="card-title mb-0">Present Employees</h5>
						<div class="card-body h-100"></div>
					</div>


   <br> </br>

	<div class="scrollmenu">


<div class="col-md-4">

<input type="text" id="myInput1" onkeyup="myFunction()" placeholder="Search Cardholder Name.." title="Job role search...">


 </div>
                      <br> </br>

					<table border="2" cellpadding="12" class="table table-hover"
						id="customers1">
						<th>First Name</th>
						<th>Last Name</th>
						<th>Emp_ID</th>
						<th>NIC</th>
						<th>Address</th>
						<th>Phone Number</th>
						<th>Email</th>
						<th>Job role</th>
						<th>Basic_salary</th>
						
						<th></th>
						
						<th></th>
						<th></th>





						</tr>
						<%
								Employee emp = new EmployeeImp();
								ArrayList<NewEmployee> emplo = new ArrayList();
										
										emplo=emp.listemployee();
						
								
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
										value="<%=employee.getNIC()%>"> <input type="submit"  style="background-color: #b8b894;"
										value="View">


								</form>
							</td>
							
							
							<td>
								<form action="./GetBasicSal" method="post">
									<input type="hidden" name="id" class="btn btn-primary"
										value="<%=employee.getNIC()%>"> <input type="submit" style="background-color:#b8b894;"
										value="Calculate">


								</form>
							</td>
							<td><span></span>
							
							


								<form action="./DeleteEmployee" method="post">
								
								
											<input type="hidden"  name=fname value="<%=employee.getFirstName()%>">
			
											<input type="hidden" name=lname value="<%=employee.getLastName()%>">
											<input type="hidden" name=empid value="<%=employee.getEmpID()%>">
											<input type="hidden" name=nic value="<%=employee.getNIC()%>">
											<input type="hidden" name=address value="<%=employee.getAddress()%>">
											<input type="hidden" name=phone value="<%=employee.getPhoneNum()%>">
											
											<input type="hidden" name=email value="<%=employee.getEmail()%>">
											<input type="hidden" name=job value="<%=employee.getJobrole()%>">
											
											<input type="hidden" name=bsal value="<%=employee.getBasicSal()%>">
													
									
													
															
											<input type="hidden" name="id" class="btn btn-danger"
										value="<%=employee.getNIC()%>"> <input type="submit" style="background-color: #b8b894;"
										value="Delete">
								</form> </span></td>
								
								<td>
							
							</td>
						</tr>
					
						
						<%
								}
							%>
						<div></div>
					</table>

				<form>
				
				
				</form>



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




<script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput1");
  filter = input.value.toUpperCase();
  table = document.getElementById("customers1");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[7];
    if (td) {
      txtValue = td.textContent || td.innerText;
      if (txtValue.toUpperCase().indexOf(filter) > -1) {
        tr[i].style.display = "";
      } else {
        tr[i].style.display = "none";
      }
    }       
  }
}
</script>





</body>
</html>