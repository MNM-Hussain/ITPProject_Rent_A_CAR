









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
<link rel="stylesheet" type="text/css" href=" CSS/insert_IS.css">
 

<title>MYEvent</title>


</head>

<body>












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
						<h5 class="card-title mb-0">Insert Income Statement for the Month</h5>
						<div class="card-body h-100"></div>
					</div>








<script>

var i='${value}';

 if(i=='date exists'){
	
	alert('Entered date is already inserted in the database');
	window.location.href="Insert_income_statement.jsp";
	
 }else if(i=='one month'){
	
	 alert('only 1 month can be entered in a year');
	window.location.href="Insert_income_statement.jsp";
	
	
 }else if(i=='12 month'){
	
	 alert('only 12 month can be entered in a year');
	window.location.href="Insert_income_statement.jsp";

 } 


var count = 0;

function  myFunction(){
	
	
	
	  var x = document.createElement("INPUT");
	  x.setAttribute("type", "text");
	  x.setAttribute("value", "Expense type");
	  x.setAttribute("name", "expenceDes"+count);
	  x.setAttribute("placeholder", "description");
	  x.setAttribute("style", "width:200px;margin-left:40px;")
	  document.getElementById("description").appendChild(x);
	    
	  
	  var a1 = document.createElement("br");
	  document.getElementById("description").appendChild(a1);
	  var a2 = document.createElement("br");
	  document.getElementById("description").appendChild(a2);
	  
	  
	  var y = document.createElement("INPUT");
	  y.setAttribute("type", "number");
	  y.setAttribute("name", "amount"+count);
	  y.setAttribute("value", "0000");
	  y.setAttribute("style", "width:200px;margin-left:40px;")
	  document.getElementById("amount").appendChild(y);
		  
	  
	  var z = document.createElement("br");
	  document.getElementById("amount").appendChild(z);
	  var g = document.createElement("br");
	  document.getElementById("amount").appendChild(g);
	  
	  count++;
}

function finalSubmit() {
	var x = document.createElement("INPUT");
	  x.setAttribute("type", "hidden");
	  x.setAttribute("value",count);
	  x.setAttribute("name", "count")
	   document.getElementById("description").appendChild(x);
}


</script>






						<form method="post" action="AddIncomeStatementServlet">
							<p id="date" style="margin-top: 60px;">
								Enter the date<input type="date" name="date" required>
							</p>

							<table border="3"
								style="height: 100%; width: 100%; margin-top: 10px; background-color: white;">


								<tr>
									<td bgcolor="#8080ff" id="td1"><b
										style="margin-left: 50px; font-size: 20px;">INCOME</b></td>
									<td></td>
								</tr>

								<tr>
									<td id="td1"><p id="p1">Rent income</p></td>
									<td style="padding: 5px;"><input type="number"
										name="Rent_income" style="margin-right: -50px;" min="0"  step="any" required></td>
								</tr>

								<tr>
									<td id="td1"><p id="p1">Other income</p></td>
									<td style="padding: 5px;"><input type="number"
										name="other_income" style="margin-right: -50px;" min="0"  step="any" required></td>
								</tr>

								<tr>
									<td bgcolor="#8080ff" id="td1"><b
										style="margin-left: 50px; font-size: 20px;">EXPENSES</b></td>
									<td></td>
								</tr>

								<tr>
									<td id="td1"><p id="p1">Salary</p></td>
									<td style="padding: 5px;"><input type="number"	name="Salary" style="margin-right: -50px;" min="0"  step="any" required></td>
								</tr>

								<tr>
									<td id="td1"><p id="p1">Maintance</p></td>
									<td style="padding: 5px;"><input type="number"
										name="maintance" style="margin-right: -50px;" min="0"  step="any" required></td>
								</tr>

								<tr>
									<td id="td1"><p id="p1">Electricity</p></td>
									<td style="padding: 5px;"><input type="number"
										name="electricity" style="margin-right: -50px;"  min="0"  step="any" required></td>
								</tr>

								<tr>
									<td id="td1"><p id="p1">Rent expenses</p></td>
									<td style="padding: 5px;"><input type="number"	name="rent_expenses" style="margin-right: -50px;"  min="0"  step="any"  required></td>
								</tr>

								<tr>
									<td id="td1"><p id="p1">Other expenses </p><div id="description"> </div></td>
									<td style="padding: 5px;"><br><br><div id="amount"> </div></td>
								</tr>



							</table>

							<input type="submit"  onclick="finalSubmit()"   value="CALCULATE" class="btn btn-success "
								style="margin-left: 540px; margin-top: 10px; width: 150px; height: 45px; background-color: #8080ff;">
					

					</form>
					<button onclick="myFunction()"   style="margin-top:40px; width:100px;margin-left:270px;background-color: #8080ff;">ADD</button>
					
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

</body>
</html>