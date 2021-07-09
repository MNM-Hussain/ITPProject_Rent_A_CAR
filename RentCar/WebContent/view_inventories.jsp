<%@page import="service.InventoryServiceimpl"%>
<%@page import="service.IInventoryService"%>
<%@page import="Model.Inventory"%>
<%@page import="java.util.ArrayList"%>








<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<head>
<style>
.button4 {
 color: white;
background-color: #808080;
border-radius: 4px;
display: inline-block;
  font-size: 14px;
  margin: 4px 2px;
  cursor: pointer;
 width: 145px;
}
#search {
  width: 357px;
  margin: 4px auto;
  text-align: right;
  display: inline-block;
  float:right;
	margin-right: 18px;
}

</style>
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


<title>view Inventories</title>


</head>

<body>



	<div class="container" style="width: 100%;">
		<h1 class="h3 mb-3">Profile</h1>

		<div class="row">
			<div class="col-md-4 col-xl-3" style="width: 25%;">
				<div class="card mb-3">
					<div class="card-header">

						<h5 class="card-title mb-0 text-center">Inventory Manager</h5>
					</div>
					<div class="card-body text-center">
						<br> <img src="images/avatar7.png" alt="Inventory manager"
							class="img-fluid rounded-circle mb-2" width="135" height="128">
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
									<li><a href="view_inventories.jsp">Inventories</a></li>
									<li><a href="AddInventory.jsp">Add Inventory</a></li>
								
									<li><a href="#">Report</a></li>

									</a>

								</ul>




								</nav>





							</div>
						</div>
					</div>


				</div>
			</div>
			<div class="col-md-8 col-xl-9" style="width: 75%;">
				<div class="card" style="height: 1000px;">
					<div class="card-header">
						<h5 class="card-title mb-0">Inventories</h5>
						<div class="card-body h-100"></div>
					</div>


					<br>
					<br>


					<form id="search" class="form-inline" method="post" action="search.jsp">
<input type="text" name="category" class="form-control" placeholder="Search by category">
<button type="submit" name="save" class="btn btn-primary">Search</button>
</form>

<br> </br>


<form id="search" action="InventoryReport.jsp"  method="post">  

<input type="text" name="year" placeholder="Enter the year..">

<input type="submit"  value="generate report" >


</form>




<br> </br>



					<table border="1" cellpadding="12" class="table table-hover">

						<thead>
							<tr>
								<th>Car ID</th>

								<th>Model</th>
								<th>Category</th>
								<th>Sup ID</th>
								<th>Description</th>
								<th>N.O.P</th>
								<th></th>





							</tr>

						</thead>  							
            <%
           
            IInventoryService iInventoryservice = new InventoryServiceimpl();
			ArrayList<Inventory> arrayList = iInventoryservice.get_Inventory_details();
				
			
			for(Inventory invetory : arrayList){
			%>
			
			 <tbody>
			 <tr>
			 
				<td> <%=invetory.getCarID() %> </td>
				
				<td> <%=invetory.getModel() %> </td>
				<td> <%=invetory.getCategory() %> </td>
				
				<td> <%=invetory.getSupplierID() %> </td>
				<td> <%=invetory.getDescription() %> </td>
				<td> <%=invetory.getNoOfPassengers() %> </td>
				


										
				
				<td style="text-align:center"><a href="update_inventory.jsp?CarID=<%=invetory.getCarID() %>"><button class="button button4">Update</button></a>
					<form method="POST" action="DeleteInventoryServlet?CarID=<%=invetory.getCarID() %>"><button class="button button4">Delete</button></form>
					
				</td>
				
				
			
					
			</tr>
			 </tbody>
				
			
						
					
			<%	
			   }
            %>     
		</table>






				
					<br>
					<br>

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