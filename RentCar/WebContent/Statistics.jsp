<%@page import="service.MaintenanceImp"%>
<%@page import="Model.RepairAndMaintenance"%>
<%@page import="java.util.ArrayList"%>
<%@page import="service.Statistics"%>




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


<title>Maintenance Analysis</title>
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
	padding: 70px 70px;
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


</style>










<% 

float[] tot = new float[12];


String End_Date="2020";
Statistics PI= new Statistics();
tot=PI.get_RepairAndMaintenance();

System.out.println("count is :"+tot[9]);




%>


  <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">


    var tem0=<%=tot[0] %>;
    var tem1=<%=tot[1] %>;
    var tem2=<%=tot[2] %>;
    var tem3=<%=tot[3] %>;
    var tem4=<%=tot[4] %>; 
    var tem5=<%=tot[5] %>; 
    var tem6=<%=tot[6] %>;
    var tem7=<%=tot[7] %>;
    var tem8=<%=tot[8] %>;
    var tem9=<%=tot[9] %>;
    var tem10=<%=tot[10] %>;
    var tem11=<%=tot[11] %>;
       
    
    


  
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var data = google.visualization.arrayToDataTable([
          ['month', 'qty'],
          ['jan', tem0],
          ['feb', tem1],
          ['march', tem2],
          ['april', tem3],
          ['may', tem4],
		  ['june', 	tem5],
		  ['july', tem6],
		  ['augest', tem7],
		  ['september', tem8],
		  ['oct', tem9],
		  ['nov', tem10],
		  ['dec', tem11]
        ]);

        var options = {
          title: 'Maintenance Activity',
          pieHole: 0.4,
        };

        var chart = new google.visualization.PieChart(document.getElementById('donutchart'));
        chart.draw(data, options);
      }
    </script>
    
    
    
    
    
    <script>
    google.charts.setOnLoadCallback(drawChart);
    function drawChart() {
      var data = google.visualization.arrayToDataTable([
        ['Months', 'Qty'],
        [1, tem0], [2, tem1], [3, tem2], [4, tem3], [5, tem4], [6, tem5], [7, tem6], [8, tem7], [9, tem8], [10, tem9], [11, tem10], [12, tem11]
     ]);

      var options = {
        title: 'Qty by Months',
        hAxis: {title: 'Months', minValue: 1, maxValue: 12},
        vAxis: {title: 'Qty', minValue: 0, maxValue: 100},
        
        trendlines: {
            0: {
              type: 'exponential',
              color: 'green',
            }
          }
        
      };

      var chart = new google.visualization.ScatterChart(document.getElementById('chart_div2'));
      chart.draw(data, options);
    }
    </script>
    
    
    
    
    
    
</head>
<body>





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
				
							<div id="donutchart" style="width: 750px; height: 350px;  box-shadow: inset 0 3px 6px rgba(0,0,0,0.16), 0 4px 6px rgba(0,0,0,0.45);"></div><br>
							<div id="chart_div2" style="width: 750px; height: 313px; box-shadow: inset 0 3px 6px rgba(0,0,0,0.16), 0 4px 6px rgba(0,0,0,0.45);"></div>
						<div class="card-body h-100"></div></div><br>
						
</div>
</body>
					

				
</html>