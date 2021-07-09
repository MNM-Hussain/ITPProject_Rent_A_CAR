<%@page import="service.RateServiceimpl"%>
<%@page import="service.IRateService"%>
<%@page import="Model.IncomeStatement"%>
<%@page import="java.util.ArrayList"%>

<%@page import="Servlet.GetIncomeStatement"%>




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
<link rel="stylesheet" type="text/css" href=" CSS/calculated_incSTM.css">
<style>
#td1 {
	padding: 10px;
}
</style>

<title>MYEvent</title>


</head>

<body>



<script>

var i='${value}';

 if(i=='date added')
	{
	alert('table was inserted  succesfully');
	
	
	}
 </script>


<%
	String date =request.getParameter("date");

	GetIncomeStatement getIncomeStatementservlet = new GetIncomeStatement();

	IncomeStatement IS = getIncomeStatementservlet.get_values_of_IncomeStatement(date);
	if (IS == null) {
		out.println("<script type=\"text/javascript\">");
		out.println("alert('This date dosent exisit');");
		out.println("location='View_IncomeStatement.jsp';");
		out.println("</script>");
	}
	%>



	<%
		if (IS != null) {
	%>
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
						<h5 class="card-title mb-0">INCOME_STATEMENT</h5>
						<div class="card-body h-100"></div>
					</div>












					<table border="3"
						style="height: 50%; width: 100%; margin-top: 20px;">
						<caption style="margin-left: 600px;">
							<b>DATE : <%out.println(date);
													%></b>
						</caption>




						<tr>
							<td bgcolor="#8080ff" id="td1">Income</td>
							<td></td>
							<td></td>

						</tr>
						</tr>
						<tr>
							<td id="td1">Rent income</td>
							<td style="padding: 10px;"><%=IS.getRent_income()%></td>
							<td></td>


						</tr>

						</tr>
						<tr>
							<td id="td1">other income</td>
							<td id="td1"><%=IS.getOther_income()%></td>
							<td></td>
						</tr>




						<tr>
							<td></td>
							<td></td>
							<td></td>

						</tr>



						<tr>
							<td id="td1"><b>Total income</b></td>
							<td></td>
							<td id="td1"><%=IS.getTOTAL_INCOME()%></td>

						</tr>




						<tr>





							<td bgcolor="#8080ff" id="td1">Expenses</td>
							<td></td>
							<td></td>

						</tr>

						<tr>
							<td id="td1">salary</td>
							<td id="td1"><%=IS.getSalary()%></td>
							<td></td>


						</tr>



						<tr>
							<td id="td1">maintance</td>
							<td id="td1"><%=IS.getMaintance()%></td>
							<td></td>


						</tr>



						<tr>
							<td id="td1">electricity</td>
							<td id="td1"><%=IS.getElectricity()%></td>
							<td></td>

						</tr>
						<tr>
							<td id="td1">rent expenses</td>
							<td id="td1"><%=IS.getRent_expenses()%></td>
							<td></td>

						</tr>
						<tr>
							<td id="td1">other expenses</td>
							<td id="td1"><%=IS.getOther_expenses()%></td>
							<td></td>

						</tr>

						</tr>
						<tr>
							<td id="td1"><b>Total Expense</b></td>
							<td></td>
							<td id="td1">(<%=IS.getTOTAL_Expense()%>)
							</td>

						</tr>



						<tr>
							<td></td>
							<td></td>
							<td></td>

						</tr>



						</tr>

						</tr>
						<tr>
							<td bgcolor="#8080ff">profit or loss</td>
							<td></td>
							<td id="td1"><%=IS.getProfit_loss()%></td>

						</tr>



						

					</table>


					<a href="View_IncomeStatement.jsp"><button
							style="margin-left: 600px; margin-top: 100px; width: 100px; background-color: #8080ff;"class="btn btn-success ">
							<span style="color: white;">CORRECT</span>
						</button></a>
						
						
						
					<form action="DeleteIncomeStatementMonthServlet"  method="post">	
						<input type="hidden"  name="date" value="<%=date%>">
						<input type="submit" value="IN CORRECT"	style="margin-left:450px; margin-top: -35px; width: 120px; background-color: #8080ff;"class="btn btn-success ">
					</form>
						
						





				</div>



			</div>
		</div>
	</div>

	<%
		}
	%>



























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