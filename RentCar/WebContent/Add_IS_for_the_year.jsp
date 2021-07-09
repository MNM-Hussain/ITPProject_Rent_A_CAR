<%@page import="service.IncomeStatementServiceimpl"%>
<%@page import="service.IS_for_the_year"%>
<%@page import="Model.IncomeStatement"%>
<%@page import="java.util.ArrayList"%>


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
	crossorigin="anonymous">
	
</script>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script src="js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href=" CSS/ADMIN_PAGE.css">
<link rel="stylesheet" type="text/css" href=" CSS/insert_rates.css">


<title>financial manager</title>


</head>

<body>


<script>

var i='${value}';

 if(i=='already entered'){
	
	alert('Entered year is already calculated');
	window.location.href="Add_IS_for_the_year.jsp";
 }
</script>

	<div class="container">
		<h1 class="h3 mb-3">Profile</h1>
		<div class="row">
			<div class="col-md-4 col-xl-3">
				<div class="card mb-3">
					<div class="card-header">
						<h5 class="card-title mb-0 text-center">Financial Manager</h5>
					</div>
					<div class="card-body text-center">
						<br> <img src="images/avatar7.png" alt="Marie Salter"
							class="img-fluid rounded-circle mb-2" width="128" height="128">
						<h4 class="card-title mb-0"></h4>
						<br>
						<div>

									<a href="Adminlogin.jsp">

									<input type="submit" value="logout"
										class="btn btn-primary btn-sm">
								</a>

								</div>
						<br>
						<hr class="my-0">
						<div class="card-body text-center">
							<div>
									<nav class='animated bounceInDown'>
										<ul>
		
											<li class='sub-menu'><a href='#'>IncomeStatement For the month<div class='fa fa-caret-down right'></div></a>
												<ul>
													<li><a href="Insert_income_statement.jsp">Calculate	IncomeStatement</a></li>
													<li><a href="View_IncomeStatement.jsp">View	IncomeStatement</a></li>
												</ul>
											<li class='sub-menu'><a href='Add_IS_for_the_year.jsp'>IncomeStatement For the year <div class='fa fa-caret-down right'></div></a>	
											<li class='sub-menu'><a href='Insert_Rates.jsp'>Rates <div class='fa fa-caret-down right'></div></a>
											<li class='sub-menu'><a href='#'>Report	<div class='fa fa-caret-down right'></div></a>
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
						<h5 class="card-title mb-0">Income Statement For The Year Ended</h5>
						<div class="card-body h-100"></div>
						<form method="post" action="calculated_IS_for_year.jsp"style="margin-left: 150px;">
							<input type="text" name="date"	placeholder="eneter the year" required> 
							<input	type="submit" value="calculate the incomestatement for the year" style="background-color: #8080ff;"	class="btn btn-success ">
						</form>
					</div>

					<table border="1" cellpadding="12" class="table table-hover">
						<thead>
							<tr>
								<th>Date</th>
								<th>TOTAL INCOME</th>
								<th>TOTAL EXPENSE</th>
								<th>PROFIT OR LOSS</th>
								<th></th>
								<th></th>
							</tr>
						</thead>
						<%
						IS_for_the_year ISservice = new IS_for_the_year();
						ArrayList<IncomeStatement> arrayList = ISservice.get_IncomeStatement_forTheYear_details();

						for (IncomeStatement IS : arrayList) {
						%>

						<tbody>
							<tr>
								<td><%=IS.getDate()%></td>
								<td><%=IS.getTOTAL_INCOME()%></td>
								<td><%=IS.getTOTAL_Expense()%></td>
								<td><%=IS.getProfit_loss()%></td>
								<td>
									<a href="Display_IS_for_the_year.jsp?date=<%=IS.getDate()%>"><button
									style="background-color: #8080ff;" class="btn btn-success ">VIEW</button></a>
								</td>
								
								<td>
									<a href="IS_year_report.jsp?date=<%=IS.getDate()%>"><button
									style="background-color: #8080ff;" class="btn btn-success ">GENERATE REPORT</button></a>
								</td>
								
							</tr>
						</tbody>
						<%
							}
						%>
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
		$(".sub-menu a").click(function() {
			$(this).parent(".sub-menu").children("ul").slideToggle("100");
			$(this).find(".right").toggleClass("fa-caret-up fa-caret-down");
		});
	</script>

</body>
</html>