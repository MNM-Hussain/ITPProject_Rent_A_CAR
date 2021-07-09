<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="util.DBConnectionUtil"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link
	href="https://unpkg.com/bootstrap@4.1.0/dist/css/bootstrap.min.css"
	rel="stylesheet" />
<meta charset="ISO-8859-1">
<title>connect with work allocation</title>
</head>
<body>
<%
	
      String startDate= (String)request.getAttribute("startdate");

      String endDate= (String)request.getAttribute("enddate");

      SimpleDateFormat frmat = new SimpleDateFormat("dd-MM-yyyy");
     /*  Date start= frmat.parse(startDate); */
      /* Date end= frmat.parse(endDate); */%>
	<div class=container>
		<div class="row">
			<div class="col-md-4">
				<p>${Notification}</p>
				<form
					action="${pageContext.request.contextPath}/AllocationControler"
					method="post">
					<div class="form-group">
						pick up location<input type="text" class="form-control"
							name="pickuplocation" value="${event.pickuplocation}">
					</div>
					<div class="form-group">
						pick up date<input type="text" class="form-control"
							name="pickupdate" value="${event.pickupdate}">
					</div>
					<div class="form-group">
						pick up time<input type="time" class="form-control"
							name="pickuptime" value="${event.pickuptime}">
					</div>
					<div class="form-group">
						Return date<input type="text" class="form-control"
							name="returndate" value="${event.returndate}">
					</div>
					<div class="form-group">
						NO of PARCIPANTS<input type="number" class="form-control"
							name="noofperson" value="${event.noofperson}">
					</div>
					<div class="form-group">
						Driver ID<input type="text" class="form-control" name="driverid" >
					</div>

					<input type="hidden" name="allocationid" ><br>
					



					<div class="form-group">
						Reservation ID<input type="text" class="form-control"
							name="bookid" value="${event.bookid}">
					</div>
					
					
					 <br>
                                	

					<input type="submit" name="subs" value="allocate job"><br>
					<br>
					
				</form>
				<form method="POST" action="Availability_Driver_Servlet">
                                	<input type="text" name="startdate"  value="${event.pickupdate}">
                                	<input type="text" name="endDate"  value="${event.returndate}">
                                	<%-- <input type="hidden" name="carid"  value="<%=rs.getString("carID")%>"> --%>
                                	
                                	
                                		
                                		
                               
                                	
                                	<button class="btn btn-lg btn-secondary pull-right" style="margin-right:125px;" type="submit">search available driver now</button>
                                	
                                	</form>
			</div>
		</div>
	</div>
</body>
</html>