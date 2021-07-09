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
	<div class=container>
		<div class="row">
			<div class="col-md-4">
				<p>${Notification}</p>
				<form
					action="${pageContext.request.contextPath}/AllocationControler"
					method="post">
					<div class="form-group">
						pick up location<input type="text" class="form-control"
							name="pickuplocation" value="${event1.pickuplocation}">
					</div>
					<div class="form-group">
						pick up date<input type="text" class="form-control"
							name="pickupdate" value="${event1.pickupdate}">
					</div>
					<div class="form-group">
						pick up time<input type="time" class="form-control"
							name="pickuptime" value="${event1.pickuptime}">
					</div>
					<div class="form-group">
						Return date<input type="text" class="form-control"
							name="returndate" value="${event1.returndate}">
					</div>
					<div class="form-group">
						NO of PARCIPANTS<input type="number" class="form-control"
							name="noofperson" value="${event1.noofperson}">
					</div>
					<div class="form-group">
						Driver ID<input type="text" class="form-control" name="driverid"
							value="${event1.driverid}">
					</div>

					allocation ID<input type="hidden" name="allocationid"
						value="${event1.allocationid}"><br>
					
					<div class="form-group">
						Reservation ID<input type="text" class="form-control"
							name="bookid" value="${event1.bookid}">
					</div>





					<input type="submit" name="subs" value="allocate job"><br>
				</form>
				<form method="POST" action="Availability_Driver_Servlet">
                                	<input type="hidden" name="startdate"  value="${event.pickupdate}">
                                	<input type="hidden" name="endDate"  value="${event.returndate}">
                                	<%-- <input type="hidden" name="carid"  value="<%=rs.getString("carID")%>"> --%>
                                	
                                	
                                		
                                		
                               
                                	<br>
                                	<br>
                                	<button class="btn btn-lg btn-secondary pull-right" style="margin-right:125px;" type="submit">AVAILABLE DRIVERS</button>
                                	
                                	</form>
			</div>
		</div>
	</div>
</body>
</html>