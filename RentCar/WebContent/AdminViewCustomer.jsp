<%@page import="service.CustomerImp"%>
<%@page import="service.ICustomer"%>
<%@page import="Model.Customer"%>
<%@page import="java.util.ArrayList"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Details</title>
</head>


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

<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<title>Customer Details</title>
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
	color: black;
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
#form.search{
	box-sizing: border-box;
	max-width:300px;
	background: #000000;
	color:black;
	margin-right:100px;
}
#form.search.button{
	float: left;
	width: 20%;
	padding: 10px;
	background: #2196F3;
	color: white;
	font-size: 17px;
	border: 1px solid grey;
	border-left: none;
	cursor: pointer;

}
</style>
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

										<li class='sub-menu'><a href='#'>Customer Details
												<div class='fa fa-caret-down right'></div>
										</a>
											<ul>
												<li><a href="AdminViewCustomer.jsp">Current
														Customer Details</a></li>
												<li><a href="AddPastCustomer.jsp">Past Customer
														Details</a></li>
											</ul>
						


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
						<h5 class="card-title mb-0">Current Customer Details</h5>
						<div class="card-body h-100"></div>
						
						
						
					</div>
					<script>
                $('.sub-menu ul').hide();
$(".sub-menu a").click(function () {
	$(this).parent(".sub-menu").children("ul").slideToggle("100");
	$(this).find(".right").toggleClass("fa-caret-up fa-caret-down");
});
</script>

	<br></br>


					<form  action="CusReport.jsp"  method="post">  

<input type="text" name="month" placeholder="Enter the month..">

<input type="submit"  value="generate report" >


</form>
		
		<br></br>


					<form action="AdminViewCustomer.jsp">
								<input type="text" id="search" onkeyup="myFunction()" placeholder="Search for names.." title="Type FirstName">
								<button type="submit"><i class="fa fa-search"></i></button>
						</form>	
					<table border="2" cellpadding="12"
								class="table table-striped table-bordered" id="customers1">

						<thead>
							<tr>
								<th>Date</th>
								<th>FirstName</th>
								<th>LastName</th>
								<th>NIC</th>
								<th>Address</th>
								<th>Phone</th>
								<th>Email</th>
								<th></th>
								<th></th>
							</tr>





						</thead>




						<%
 		ICustomer icustomer = new CustomerImp();
		ArrayList<Customer> arrayList = icustomer.get_Customer_details();
				
			
			for(Customer customer : arrayList){
			%>

						</thead>	
						<tr>
							<td><%=customer.getDate() %></td>
							<td><%=customer.getFirstName() %></td>
							<td><%=customer.getLastName() %></td>
							<td><%=customer.getNIC() %></td>
							<td><%=customer.getAddress() %></td>
							<td><%=customer.getPhone() %></td>
							<td><%=customer.getEmail() %></td>

							<td><a
									href="AdminUpdateCustomerForm.jsp?NIC=<%=customer.getNIC() %>"><button>Update</button></a></td>

							
									<td>
									
									
									<form action="AdminDeleteCustomerServlet" method="post">

									<input type="hidden" name=Date	value="<%=customer.getDate()%>"> 
									<input type="hidden" name=FirstName	value="<%=customer.getFirstName()%>"> 
									<input	type="hidden" name=LastName value="<%=customer.getLastName()%>">
									
									<input type="hidden" name=NIC value="<%=customer.getNIC()%>">
									 <input	type="hidden" name=Address value="<%=customer.getAddress()%>">
									<input type="hidden" name=Phone value="<%=customer.getPhone()%>">
									 <input	type="hidden" name=Email value="<%=customer.getEmail()%>">
									 					
									
									<button>Delete</button>
										
		
									
									</form> </span></td>
								
									
									
									
									

						</tr>



						<%	
			   }
            %>

					</table>




				</div>
			</div>
			

<script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("search");
  filter = input.value.toUpperCase();
  table = document.getElementById("customers1");
  tr = table.getElementsByTagName("tr");
  for (i = 0; i < tr.length; i++) {
    td = tr[i].getElementsByTagName("td")[1];
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