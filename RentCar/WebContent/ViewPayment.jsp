
<%@page import="service.Paymentservice"%>
<%@page import="service.Ipayment"%>
<%@page import="Model.Paymentmodel"%>
<%@page import="java.util.ArrayList"%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="ISO-8859-1">
<title>PaymentList</title>


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

<!-- -

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
			<center>Payment Table</center>
		</b>
	</h1>




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
									<li><a href="SupplierADD.jsp">Add Supplier</a></li>


								
										
									<li><a href="https://mail.google.com/mail/u/0/#inbox">Email</a></li>


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
						<h5 class="card-title mb-0">Payment</h5>
						<div class="card-body h-100"></div>
					</div>

					

					<h1>
						<b>
							<center>Payment Table</center>
						</b>
					</h1>

					<br> </br>
					<div class="scrollmenu">

						<div class="container">
						
							<div class="col-md-4">
						
		<!-- pay report- -->		
						
<form  action="PaymentReport.jsp"  method="post">  

<input type="text" name="month" placeholder="Enter the month..">

<input type="submit"  value="generate report" >


</form>

   </div>
   
   
 <br> </br>
						
						
								<div class="col-md-4">
						<input type="text" id="myInput1" onkeyup="myFunction()" placeholder="Search Reservation ID.." title="Type in a name">

                      </div>
                      <br> </br>
                      
     

						
							<table border="1" cellpadding="12"
								class="table table-striped table-bordered" id="payment">

								<thead>
									<tr class="thead-dark">

										<th>Date </th>
										<th>Booking ID</th>
										<th>Total Payment</th>
										<th>Payment Type</th>
										<th>Card Holder Name</th>
										<th>Card Number</th>
										<th>Card Expiry Date</th>
										<th>CCV</th>
										
									
									
										
										<th></th>
										<th>Action</th>

                                       <th>Action</th>



									</tr>

								</thead>
								<%
									Ipayment Ip = new Paymentservice();
								ArrayList<Paymentmodel> arrayList = Ip.get_payment_details();

								for (Paymentmodel pm : arrayList) {
								%>

								<tbody>
									<tr>
										<td><%=pm.getDate_curr()%></td>
										<td><%=pm.getBid()%></td>
										
										<td><%=pm.getTotpay()%></td>
										<td><%=pm.getPayType()%></td>
										<td><%=pm.getHoldername()%></td>
										<td><%=pm.getCardnumber()%></td>
										<td><%=pm.getExpDate()%></td>
										<td><%=pm.getCcv()%></td>
								
										
									
										<td>
											<%
												
											%>
										</td>




										<td><a href="UpdatePayment.jsp?ccv=<%=pm.getCcv()%>"><button>Update</button></a></td>

										<td><form method="POST"
												action="DeletePayment?ccv=<%=pm.getCcv()%>">
												<button>Delete</button>
											</form></td>



									</tr>
								</tbody>




								<%
									}
								%>
							</table>




						</div>







					</div>



				</div>
			</div>
		</div>



	</div>

	</div>

	<!--dashboard --------------- -->









	<br>
	</br>




	<script src="https://unpkg.com/jquery@3.3.1/dist/jquery.min.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/v/bs4/dt-1.10.21/datatables.min.js"></script>
		
		
		<!-- search from jquery -->
	
	<!-- -----
	<script>
		$(document).ready(function() {
			$("#datatable").DataTable();
		})
	</script>
	
	-------->







	<!--dashboard --------------- -->



	</div>
	</div>


	</div>

	</div>
	<script>
		$('.sub-menu ul').hide();
		$(".sub-menu a").click(function() {
			$(this).parent(".sub-menu").children("ul").slideToggle("100");
			$(this).find(".right").toggleClass("fa-caret-up fa-caret-down");
		});
	</script>



<script>
function myFunction() {
  var input, filter, table, tr, td, i, txtValue;
  input = document.getElementById("myInput1");
  filter = input.value.toUpperCase();
  table = document.getElementById("payment");
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