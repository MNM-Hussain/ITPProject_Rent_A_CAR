<%@page import="service.Supplierservice"%>
<%@page import="service.Isupplier"%>
<%@page import="Model.Suppliermodel"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="util.DBConnectionUtil"%>

<%@page import="Servlet.GetSupplier"%>


<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>







<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>Supplier LIST</title>




<style>
div.scrollmenu {
	overflow: auto;
	white-space: nowrap;
}





</style>


</head>

    <link
	href="https://unpkg.com/bootstrap@4.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet" />


<!-- ----------- 

<link rel="stylesheet" type="text/css"
	href="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.css" />


-->






<!--dashboard --------------- -->

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

<link rel="stylesheet" type="text/css" href=" CSS/adminhome.css">





<!--dashboard --------------- -->
		
<body>


	<h1>
		<b>
			<center>Supplier Table</center>
		</b>
	</h1>






	<%
		String vehiname = (String) request.getParameter("vehiclename");
	
    GetSupplier getsuppdetails= new GetSupplier();

    
    Suppliermodel sm = getsuppdetails.get_values_from_Supplier(vehiname);
    
	
	if (sm == null) {
		out.println("<script type=\"text/javascript\">");
		out.println("alert('This vehicle name doesnt exisit');");
		out.println("location='ViewSupplier.jsp';");
		out.println("</script>");
	}
	%>


	<%
		if (sm != null) {
	%>


	<!--dashboard --------------- -->


	<div class="container" style="width: 100%;">
		<h1 class="h3 mb-3">Profile</h1>
		<div class="row">
			<div class="col-md-4 col-xl-3" style="width: 45%;">
				<div class="card mb-3">
					<div class="card-header">



						<h5 class="card-title mb-0 text-center">ADMIN</h5>
					</div>
					<div class="card-body text-center">
						<br> <img src="images/avatar7.png" alt="Marie Salter"
							class="img-fluid rounded-circle mb-2" width="130" height="128">
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
									<li><a href="SupplierADD.jsp">Add Supplier</a></li>


									<li class='sub-menu'><a href='#'>Report
											<div class='fa fa-caret-down right'></div>
									</a>
										<ul>
											<li><a href="ViewSupplier.jsp">Supplier Report</a></li>
											<li><a href="ViewPayment.jsp">Payment Report</a></li>
										</ul>
									<li><a href="">Email</a></li>


									<li class='sub-menu'><a href='#'>View
											<div class='fa fa-caret-down right'></div>
									</a>
										<ul>
											<li><a href="ViewSupplier.jsp">SupplierView</a></li>
											<li><a href="ViewPayment.jsp">Payment View</a></li>
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
						<h5 class="card-title mb-0">Supplier</h5>
						<div class="card-body h-100"></div>
					</div>






					<h1>
						<b>
							<center>Supplier Table</center>
						</b>
					</h1>

<br> </br>



	<div class="scrollmenu">






						<!--dashboard --------------- -->







						<div class="container">

							<table border="1" cellpadding="12"
								class="table table-striped table-bordered" id="datatable">

								<thead>
									<tr class="thead-dark">

										<th>Supplier ID</th>
										<th>Supplier Name</th>
										<th>Email Address</th>
										<th>Vehicle Name</th>
										<th>Module Number</th>
										<th>Contact Number</th>
										<th>Supplier Address</th>
										<th>Rent period</th>
										<th>Payment</th>
									




									</tr>

								</thead>
								
							
								
		<!-- athu inga -->

								<tbody>
								
								
								
								
								
									<tr>
										<td><%=sm.getSuppID()%></td>
										<td><%=sm.getName()%></td>
										<td><%=sm.getEmail()%></td>
										<td><%=sm.getVeh_name()%></td>
										<td><%=sm.getVeh_mod()%></td>
										<td><%=sm.getContactno()%></td>
										<td><%=sm.getAddress()%></td>
										<td><%=sm.getRentperiod()%></td>
										<td><%=sm.getPay_amt()%></td>



									


									</tr>
								</tbody>



		
			
							</table>

			<%
				}
			%>




						</div>



					</div>
				</div>
			</div>

		</div>






	</div>


	<script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.js"></script>
	
	





	<!--dashboard --------------- -->




	
	
	
	
	<script>
		$('.sub-menu ul').hide();
		$(".sub-menu a").click(function() {
			$(this).parent(".sub-menu").children("ul").slideToggle("100");
			$(this).find(".right").toggleClass("fa-caret-up fa-caret-down");
		});
	</script>




























		
</body>
</html>