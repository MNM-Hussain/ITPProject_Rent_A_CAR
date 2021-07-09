<%@page import="service.CustomerImp"%>
<%@page import="service.ICustomer"%>
<%@page import="Model.Customer"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>

<%@page import="Servlet.AdminGetCustomerServlet"%>
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
<link rel="stylesheet" type="text/css" href=" CSS/insert_rates.css">


<title>Customer</title>
<style>
body {
	margin-top: 20px;
	background-color: #ffffff;
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
	background-color: #e5e5e5;
	background-clip: border-box;
	border: 1px solid #e5e9f2;
	border-radius: .2rem;
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
	color: white;
	background-color: #808080;
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
	border-bottom: 1px solid #e5e9f2;
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
	background: #ffffff;
	padding: 10px 15px;
	color: #333;
	text-decoration: none;
	-webkit-transition: 0.2s linear;
	-moz-transition: 0.2s linear;
	-ms-transition: 0.2s linear;
	-o-transition: 0.2s linear;
	transition: 0.2s linear;
}

nav ul li a:hover {
	background: #808080;
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
	background: #ffffff;
	border-left: 4px solid transparent;
	padding: 10px 20px;
}

nav ul li ul li a:hover {
	background: #ffffff;
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
	text-align: left;
	padding: 8px;
}

tr:nth-child(even) {
	background-color: #f2f2f2
}

th {
	background-color: #133f75;
	color: white;
}

input[type=text], select {
	width: 80%;
	padding: 12px 20px;
	margin: 5px 50px 20px 40px;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}
input[type=email], select {
	width: 80%;
	padding: 12px 20px;
	margin: 5px 50px 20px 40px;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}
input[type=tel], select {
	width: 80%;
	padding: 12px 20px;
	margin: 5px 50px 20px 40px;
	display: inline-block;
	border: 1px solid #ccc;
	border-radius: 4px;
	box-sizing: border-box;
}

.Update {
	width: 60%;
	padding: 14px 20px;
	margin: 5px 50px 8px 100px;
	border: 2px solid #000000;
	border-radius: 4px;
	background-color: #2edaff;
	color: #000000;
}

label {
	padding: 10px;
	font-weight: bold;
}

h2{
	text-align: center;
}

</style>
</head>

<body>





	<div class="container">
		<h1 class="h3 mb-3">Profile</h1>
		<div class="row">
			<div class="col-md-4 col-xl-3">
				<div class="card mb-3">
					<div class="card-header">



						<h5 class="card-title mb-0 text-center">Manager</h5>
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

									<li class='sub-menu'><a href='#'>Customer Details
											<div class='fa fa-caret-down right'></div>
									</a>
										<ul>
											<li><a href="AdminViewCustomer.jsp">Current Customer
													Details</a></li>
											
											<li><a href="AddPastCustomer.jsp">Past Customer
													Details</a></li>
										</ul>
									<li><a href="#">Reports</a></li>


								</ul>





								</nav>





							</div>
						</div>
					</div>


				</div>
			</div>
			<div class="col-md-8 col-xl-9">
				<div class="card" style="height: 800px;">
					<div class="card-header">
						<h5 class="card-title mb-0">Updates</h5>
						<div class="card-body h-100"></div>
					</div>



					<%


String NIC=(String)request.getParameter("NIC");

 AdminGetCustomerServlet admingetcustomerservlet= new AdminGetCustomerServlet();

Customer customer = admingetcustomerservlet.get_Customer_details(NIC);

%>



					<form action="AdminUpdateServlet?NIC=<%=customer.getNIC()%>"
						method="post">

						<h2>Changes in Customer Details</h2>




						 <label for="address">Address</label> 
						 <br> 
						 <input type="text" name="Address" value="<%=customer.getAddress()%>">
						 <br>


						<label for="phone">Contact Number</label> 
						<br> 
						<input type="tel" name="Phone" value="<%=customer.getPhone()%>">
						<br> 
						
						<label for="email">E-mail</label> 
						<br> 
						<input type="email" id="email" name="Email" value="<%=customer.getEmail()%>"> 
						<br> <br> 
						
						<input class="Update" type="submit" value="Update" name="Update">
						
					</form>
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
