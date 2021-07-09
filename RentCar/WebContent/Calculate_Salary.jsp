


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

#td1{
 padding: 10px;
}

</style>

<title>Salary Calculation</title>


</head>

<body>


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
													<li><a href="Present_employees.jsp">Present employees</a></li>
											<li><a href="MyComplaint.jsp">Past employees</a></li>
										</ul>
									<li><a href="EmployeeSalary.jsp">Salary</a></li>
									<li><a href="UserViewMyEvent.jsp">Report</a></li>
									
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
						<h5 class="card-title mb-0">Salary Calculation</h5>
						<div class="card-body h-100"></div>
					</div>


		<%	
		
		
		String rDate=String.format(request.getParameter("date"));
		
		String nic=String.format(request.getParameter("nic"));
		
	
		
		int BasicSal_per_day=Integer.parseInt(request.getParameter("bsal"));
		int attendnce=Integer.parseInt(request.getParameter("attendnce"));
		
		int OT=0;
		int normal_day=0;
		
		if(attendnce>20)
		{
			normal_day=20;
			OT=attendnce-20;
						
		}else if (attendnce<20){
			normal_day=attendnce;
			OT=0;
					
		}
		
		
		
		float total_normalday_sal=normal_day*BasicSal_per_day;
		float total_OT_amt= OT*(BasicSal_per_day*150/100);
		
		float TotalSalary=total_normalday_sal+total_OT_amt;
		
		
		
		
		
		float EPF=TotalSalary*12/100;
		
		float ETF=TotalSalary*3/100;
		
		
		
		float NetSalary=TotalSalary-(EPF+ETF);
		


		
		%>








			<table border="3"  style="height:50%; width:100%; margin-top:20px;">
			<caption><b>NIC : <%out.println(nic); %></b></caption><span><caption ><b>Date : <%out.println(rDate); %></b></caption></span>
			
			
		
			
			</tr>
			</tr>
			<tr>
			<td id="td1"> Normal day Salary</td>
			<td style="  padding: 10px;"><%out.println(total_normalday_sal); %></td>
			<td></td>
			
			</tr>
			
			</tr>
			<tr>
			<td id="td1">OT Amount</td>
			<td id="td1" ><%out.println(total_OT_amt); %></td>
			<td ></td>
			</tr>
			
			
			
		
		<tr>
			<td id="td1">Total Salary</td>
			<td id="td1" ></td>
			<td  id="td1"><%out.println(TotalSalary); %></td>
			</tr>
			
			
			
				<tr>
			<td   id="td1">EPF</td>
			<td  id="td1"> <%out.println(EPF); %></td>
			<td ></td>
				
				</tr>
		
			
			
			
		
			
				<tr>
			<td   id="td1">ETF</td>
			<td   id="td1"><%out.println(ETF); %></td>
			<td  id="td1">(<%out.println(ETF+EPF); %>)</td>
							
			
			</tr>
			
			
		
			
			
			<tr>
			<td   id="td1" bgcolor="#8080ff">NetSalary</td>
			<td   ></td>
			<td id="td1"><%out.println(NetSalary); %></td>
							
			
			</tr>
			
			
		
			
			
			
			
		
			
			</tr>
			
		
			</table>
	
			

		
			 <form method="post" action="AddSalary">
			 
			<input type="hidden"  name="NIC" value="<%out.println(nic); %>">
			
			<input type="hidden" name=basSal value="<%out.println(BasicSal_per_day);  %>">
			<input type="hidden" name="attendance" value="<%=attendnce%>">
			<input type="hidden" name=EPF value="<%out.println(EPF);  %>">
			<input type="hidden" name=ETF value="<%out.println(ETF);  %>">
			<input type="hidden" name=NetSal value="<%out.println(NetSalary);  %>">
			<input type="hidden" name="date" value="<%=rDate%>">
			
		
			

						
			<input type="submit"  class="btn btn-success " action="./EmployeeSalary" value="submit" style="background-color: #8080ff;margin-left:600px; margin-top:100px;" onclick="return confirm('Do you really want to submit the form?');">	
			
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

</body>
</html>