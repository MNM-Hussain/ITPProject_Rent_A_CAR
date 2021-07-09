<%@page import="service.MaintenanceImp"%>
<%@page import="service.IMaintenace"%>
<%@page import="Model.RepairAndMaintenance"%>
<%@page import="java.util.ArrayList"%>




<%@page import="service.RateServiceimpl"%>
<%@page import="service.IRateService"%>
<%@page import="Model.IncomeStatement"%>
<%@page import="java.util.ArrayList"%>

<%@page import="Servlet.GetMaintanceDetails"%>



<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link
	href="https://unpkg.com/browse/bootstrap@4.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.css" />
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
<link rel="stylesheet" type="text/css" href=" CSS/insert_rates.css">


<title>Maintenance</title>
<style>
body {
	margin-top: 20px;
}

.card {
	margin-bottom: 1.5rem;
	box-shadow: 0 1px 15px 1px rgba(52, 40, 104, .08);
}

.card {
	position: relative;
	display: -ms-flexbox;
	display: flex;
	-ms-flex-direction: column;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box ;
	border-radius: .2rem;
	box-shadow: inset 0 3px 6px rgba(0,0,0,0.16), 0 3px 0px rgba(0,0,0,0.16);
}


.card-header:first-child {
	border-radius: calc(.2rem - 1px) calc(.2rem - 1px) 0 0;
}

.card-header {
	border-bottom-width: 1px;
}

.card-header {
	padding: .75rem 1.25rem;
	margin-bottom: 0;
	color: inherit;
	background-color:#C0FAF1;
	border-bottom: 1px solid #e5e9f2;
}

.UPPER_card-header {
	border-bottom-width: 5px;
}

.UPPER_card-header {
	padding: .75rem 1.25rem;
	margin-bottom: 0;
	color: inherit;
	background-color: #red;
	border-bottom: 1px solid #12BCEB;
}

nav {
	position: relative;
	margin: 50px;
	width: 260px;
}

nav ul {
	list-style: none;
	margin: 0;
	padding: 0;
}

nav ul li {
	/* Sub Menu */
	
}

nav ul li a {
	display: block;
	background:white;
	padding: 10px 15px;
	color: #333;
	text-decoration: none;
	-webkit-transition: 0.2s linear;
	-moz-transition: 0.2s linear;
	-ms-transition: 0.2s linear;
	-o-transition: 0.2s linear;
	transition: 0.2s linear;
	 box-shadow: inset 0px 0px 0px rgba(0,0,0,0.16),1px 4px 6px 1px rgba(0,0,0,0.45);
}

nav ul li a:hover {
	background: #f8f8f8;
	color: #515151;
}

nav ul li a .fa {
	width: 16px;
	text-align: center;
	margin-right: 5px;
	float: right;
}

nav ul ul {
	background-color: #ebebeb;
}

nav ul li ul li a {
	background: #f8f8f8;
	border-left: 4px solid transparent;
	padding: 10px 20px;
}

nav ul li ul li a:hover {
	background: #ebebeb;
	border-left: 4px solid #3498db;
}

.form-container {
	padding: 70px 70px;
}

center {
	color: #000;
	letter-spacing: 2px;
	font-size: 20px;
	font-family: Poppins;
	text-transform: uppercase;
}

th {
	background-color: #133f75;
	color: white;
}

button {
	background-color: #133f75;
	color: white;
}



table {
	border-collapse: collapse;
	width: 100%;
}

th, td {
	text-align: center;
	padding: 8px;
	font-family:Lucida Sans;
}

tr:nth-child(even) {
	background-color: #f2f2f2
}

th {
	background-color: #133f75;
	color: white;
}

h1 {
	margin-left: 130px;
}

</style>
</head>
<body>

	<%
	

	
	String date =  request.getParameter("date1");
	
	System.out.println("ahmeduuuu"+date);
	//String date22="10/09/2020";
	
	GetMaintanceDetails getmaintancedetails = new GetMaintanceDetails();
	RepairAndMaintenance repairandmaintenance = getmaintancedetails.get_values_of_Maintance(date);
					
		
									if (repairandmaintenance == null) {
										out.println("<script type=\"text/javascript\">");
										out.println("alert('This date dosent exisit');");
										out.println("location='ViewMaintenance.jsp';");
										out.println("</script>");
									}
									%>

									
									
							



	<%
		if (repairandmaintenance != null) {
	%>

	<div class="container">
		<h1 class="h3 mb-3">Profile</h1>
		<div class="row">
			<div class="col-md-4 col-xl-3">
				<div class="card mb-3">
					<div class="card-header">



						<h5 class="card-title mb-0 text-center">Maintenance Manager</h5>
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
	<li class='sub-menu'><a href='#'>WorkOrders
	<div class='fa fa-caret-down right'></div></a>
	<ul>
	<li><a href="ViewMaintenance.jsp">View Orders</a></li>
	<li><a href="Add_Maintenance_Details.jsp">Add Orders</a></li>
	<li><a href="Update_Maintenance_Details.jsp">Update/Delete Orders</a></li>
	</ul>
	
	<li><a href="https://mail.google.com/">Mail</a></li>
	<li class='sub-menu'><a href='Statistics.jsp'>Statistics</a></li>
	</ul>
	</nav>
	</div>
	</div>
	</div>
	</div>
	</div>
			<div class="col-md-8 col-xl-9">
				<div class="card" style="height: 523px;">
					<div class="card-header">
						<h5 class="card-title mb-0">Repair And Maintenance Details</h5>
						<div class="card-body h-100"></div>
						
						
						
					</div>
					
					
			
					<script>
						$('.sub-menu ul').hide();
						$(".sub-menu a").click(
								function() {
									$(this).parent(".sub-menu").children("ul")
											.slideToggle("100");
									$(this).find(".right").toggleClass(
											"fa-caret-up fa-caret-down");
								});
					</script>



					<div style="height: 500px; overflow-x: auto;">

						<table>

							<thead>
								<tr>
									<th>RepairID</th>
									<th>VehicleID</th>
									<th>Start_Date</th>
									<th>End_Date</th>
									<th>Description</th>
									<th>Maintenance_Cost</th>
									<th></th>
									<th></th>
								</tr>










							

							</thead>
							<tbody>
								<tr>
									<td><%=repairandmaintenance.getRepairID()%></td>

									<td><%=repairandmaintenance.getVehicleID()%></td>
									<td><%=repairandmaintenance.getStart_Date()%></td>
									<td><%=repairandmaintenance.getEnd_Date()%></td>
									<td><%=repairandmaintenance.getDescription()%></td>
									<td><%=repairandmaintenance.getMaintenance_Cost()%></td>


								</tr>
							</tbody>

							

						</table>
						
						<%
								}
							%>

					</div>


				</div>
			</div>
</body>
</html>
