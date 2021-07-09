









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

<!--  <link rel="stylesheet" type="text/css" href=" CSS/UserViewMyEvent.css">
<link rel="stylesheet" type="text/css" href=" CSS/employee.css">

-->

<title>Add details</title>


</head>

<body>


	<div class="container" >
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
											 
											<li><a href="Present_employees.jsp">Present	employees</a></li>
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
				<div class="card" style="height: 1000px;">
					<div class="card-header">
						<h5 class="card-title mb-0">Add employee details</h5>
						<div class="card-body h-100"></div>
					</div>

					    <form class="form-container" action="./AddEmployee"  method="post"  id="ticket_submit">
	
				
				<label>First Name</label>
				<input type="text" class="form-control" id="exampleInputFName"   name="fname"    required     >
				<br>
				
				<label>Last Name</label>
				<input type="text" class="form-control" id="exampleInputFName"   name="lname"   required>
				<br>
				
				<label>Employee Id</label>
				<input type="number" class="form-control" id="exampleInputPassword1"   name="empid"  required><br>
				
				<label>NIC number</label>
				<input type="text" class="form-control" id="exampleInputFName"   name="nic" pattern="(([0-9]{9}[V]{1})|([0-9]{12}))"   required     >
				<br>
				
				<label>Address</label>
				<input type="text" class="form-control" id="exampleInputFName"   name="address"    required     >
				<br>
				
				<label>Phone Number</label>
				<input type="phone" class="form-control" id="exampleInputFName"   name="phone"  pattern="[0-9]{3}[0-9]{7}"  required     >
				<br>
				
				<label>Email Id</label>
				<input type="email" class="form-control" id="exampleInputFName"   name="email"     required    >
				<br>
				
				<label>Job role</label>
				<select id="job" name="job" onchange="change();"  class="form-control">
    <option value="">Select</option>
    <option value="HR">HR manager</option>
    <option value="finance">Finance manager</option>
    <option value="supervisor">Supervisor</option>
     <option value="inventory">Inventory manager</option>
      <option value="RM">repairing & maintenance staff</option>
  </select>
				<br>
				
				<label>Basic salary per day</label>
				<input type="number" step=any class="form-control" id="bs"  name="bsal"    required     >
				<br>
				
				<div>
				<br><br>
				  <span><input type="submit" class="btn btn-success "  value="ADD"  style="margin-left:500px; width:80px;"></span>
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
<script type="text/javascript">
function change(){
	var q=document.getElementById("job");
	var w=q.options[q.selectedIndex].value;

		if(w=="HR"){	
		document.getElementById("bs").value=4000;
		
		}
		else if(w=="finance"){
			document.getElementById("bs").value=5000;
		}
		else if(w=="inventory"){
			document.getElementById("bs").value=3000;
		}
		else if(w=="supervisor"){
			document.getElementById("bs").value=2000;
		}
		else if(w=="RM"){
			document.getElementById("bs").value=15000;
		}
	}


</script>

</body>
</html>