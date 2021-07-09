<%@page import="service.MaintenanceImp"%>
<%@page import="service.IMaintenace"%>
<%@page import="Model.RepairAndMaintenance"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Connection"%>

<%@ page import="java.sql.PreparedStatement" %>
<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.sql.Statement" %>

<%@page import=" util.DBConnectionUtil"%>


<%@page import="Servlet.AddMaintenanceServlet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<head>

<link href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/themes/base/jquery-ui.css"
rel="Stylesheet"type="text/css"/>

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
	padding: 30px 70px;
}

center {
	color: #000;
	letter-spacing: 2px;
	font-size: 20px;
	font-family: Poppins;
	text-transform: uppercase;
}

.button {
	background-color:#58BAEA;
	font:times;
	border: none;
	width:60px;
	height:30px;
  	border-radius: 6px;
 	color: #FFFFFF;
  	text-align: center;
  	transition: all 0.5s;
  	cursor: pointer;

}

h1 {
	margin-left: 140px;
}

h1 {
	margin-left: 140px;
}

#dropdown {
display: block;
    width: 100%;
    height: 34px;
    padding: 6px 12px;
    font-size: 14px;
    line-height: 1.42857143;
    color: #555;
    background-color: #fff;
    background-image: none;
    border: 1px solid #ccc;
    border-radius: 4px;
}

</style>
</head>

<body>


<%


 PreparedStatement preparedStatement;

 Connection connection;
 ResultSet resultset;
Statement statement;

%>



<%
    try{
//Class.forName("com.mysql.jdbc.Driver").newInstance();

//connection = DBConnectionUtil.getDBConnection();

     // statement = connection.createStatement() ;

      //resultset =statement.executeQuery("select * from inventory") ;
      ////////


      
		connection = DBConnectionUtil.getDBConnection();

		preparedStatement = null;

	
			String sql = "select* from inventory";
			preparedStatement = connection.prepareStatement(sql);
			resultset = preparedStatement.executeQuery();
      
      
      ///////
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
						<h5 class="card-title mb-0">Adding Maintenance Details</h5>
						<div class="card-body h-100"></div>
					</div>

					<form class="form-container" action="AddMaintenanceServlet" method="post" id="add">


						<label>Vehicle ID</label>
					<select id="dropdown" placeholder="VehicleID" name="VehicleID"required><br>	
        <%  while(resultset.next()){ %>
            <option><%= resultset.getString("CarID")%></option>
        <% } %>
        </select>
        <br>
					
        <%
//**Should I input the codes here?**
        }
        catch(Exception e)
        {
             out.println("wrong entry"+e);
        }
%>	


						<label>StartDate</label> 
						<input type="text" class="form-control" id="exampleInputPassword1" placeholder="Start date" name="Start_Date"required><br>
							
							 <label>End Date</label> <input type="text" class="form-control" id="exampleInputPassword11"placeholder="End date" name="End_Date" required><br> 
							 
							 
							 <label>Description</label>
						<input type="text" class="form-control" id="exampleInputPassword1d" placeholder="Description" name="Description" required><br>

						<label>Maintenance Cost</label> 
						<input type="text" class="form-control" id="exampleInputPassword1m" placeholder="Cost" name="Maintenance_Cost" required><br>



						<input type="submit" class="button " value="ADD"	style="margin-left: 500px;" onclick="return confirm('Do you really want to submit the form?');" ><br>

					</form>
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


<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.6/jquery.min.js" type="text/javascript"></script>
<script src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.8/jquery-ui.min.js"
type="text/javascript"></script>
<script type="text/javascript">
$(function () {
    $("#exampleInputPassword1").datepicker({
        numberOfMonths: 1,
        onSelect: function (selected) {
            var dt = new Date(selected);
            dt.setDate(dt.getDate() + 1);
            $("#exampleInputPassword11").datepicker("option", "minDate", dt);
        }
    });
    $("#exampleInputPassword11").datepicker({
        numberOfMonths: 1,
        onSelect: function (selected) {
            var dt = new Date(selected);
            dt.setDate(dt.getDate() - 1);
            $("#exampleInputPassword1").datepicker("option", "maxDate", dt);
        }
    });
});
</script>






</body>
</html>
