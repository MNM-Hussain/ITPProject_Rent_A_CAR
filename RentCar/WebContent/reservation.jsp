<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="ISO-8859-1">
<title>Reservation</title>
<link rel="stylesheet" href="CSS/reservation.css">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<%@include file="header.jsp"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


</head>
<body
	style="background-image: linear-gradient(rgba(0, 0, 0, 0.5), rgba(0, 0, 0, 0.5)), url('images/myyy.jpeg');">

	<form
		action="${pageContext.request.contextPath }/ReservationController"
		method="post">
		<div class="reservation-form-box">
			<div class="reservation-form">

				<label>Pickup Location</label> <input type="text" name="location"
					class="form-control" value="${reservation.location}"
					placeholder="Enter Location" required> <label>Time</label>
				<input type="time" value="${reservation.time1}" name="time1"
					class="form-control" placeholder="Time" required>

				<div class="input-grp">
					<label>Pickup Date</label> <input type="text" id="depart"
						value="${reservation.pickupdate}" name="pickupdate"
						class="form-control select date" required>
				</div>

				<div class="input-grp">
					<label>Return Date</label> <input type="text" name="returndate"
						id="return" value="${reservation.returndate}"
						class="form-control select date" required>
				</div>

				<%-- <div class="input-grp">
					<label>No Of Days</label> <input type="number" name="numofdays"
						value="${reservation.numofdays}" class="form-control">
				</div> --%>

				<div class="input-grp">
					<label>No Of Passengers</label> <input type="number"
						value="${reservation.numofpassengers}" name="numofpassengers"
						min="1" max="4" class="form-control" required>
				</div>
				<input type="hidden" value="${reservation.rid}" name="rid" />

				<p></p>

				<div class="input-grp">

					<button type="submit" name="submit" class="btn btn-primary car">Proceed</button>
				</div>


			</div>
		</div>
	</form>
	<script src="http://code.jquery.com/jquery-2.2.4.min.js"
		integrity="sha256-BbhdlvQf/xTY9gja0Dq3HiwQF8LaCRTXxZKRutelT44="
		crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
		integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
		crossorigin="anonymous"></script>
	<script>
            $(document).ready(function () {


                $("#depart").datepicker({
                    showAnim: 'drop',
                    numberOfMonth: 1,
                    minDate: 0,
                    dateFormat: 'yy-mm-dd',
                    onClose: function (selectedDate) {
                        $("#return").datepicker("option", "minDate", selectedDate);
                    }
                });



                $("#return").datepicker({
                    showAnim: 'drop',
                    numberOfMonth: 1,
                    dateFormat: 'yy-mm-dd',
                    onClose: function (selectedDate) {
                        $("#depart").datepicker("option", "maxDate", selectedDate);
                    }
                });

            });


        </script>
	<br>
	</br>
	<br>
	</br>
	<br>
	</br>
	<br>
	</br>
	<br>
	</br>
	<br>
	</br>
	<br>
	</br>
	<br>
	</br>
	<br>
	</br>
	<br>
	</br>
	<br>
	</br>
	<br>
	</br>
</body>
<%@include file="Footer.jsp"%>
</html>