<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Supplier</title>


<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
* {
	box-sizing: border-box;
}

input[type=text], select, textarea {
	width: 50%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	resize: vertical;
}

input[type=tel], select, textarea {
	width: 50%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	resize: vertical;
}

input[type=Number], select, textarea {
	width: 50%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	resize: vertical;
}

input[type=email], select, textarea {
	width: 50%;
	padding: 12px;
	border: 1px solid #ccc;
	border-radius: 4px;
	resize: vertical;
}

body {
	background-color: #2f2f2f;
}

h1 {
	text-align: center;
	color: white;
}

hr.new1 {
	border-top: 1px solid white;
}

label {
	padding: 12px 12px 12px 0;
	display: inline-block;
}

input[type=submit] {
	width: 10%;
	background-color: #2edaff;
	color: white;
	padding: 12px 20px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
	float: right;
}

input[type=submit]:hover {
	background-color: #2f2f2f;
}

.container {
	width: 70%;
	border-radius: 5px;
	background-color: #f2f2f2;
	padding: 20px;
	margin-left: auto;
	margin-right: auto;
}

.col-25 {
	float: left;
	width: 25%;
	margin-top: 6px;
}

.col-75 {
	float: left;
	width: 75%;
	margin-top: 6px;
}

/* Clear floats after the columns */
.row:after {
	content: "";
	display: table;
	clear: both;
}

/* Responsive layout - when the screen is less than 600px wide, make the two columns stack on top of each other instead of next to each other */
@media screen and (max-width: 600px) {
	.col-25, .col-75, input[type=submit] {
		width: 100%;
		margin-top: 0;
	}
}
</style>


</head>
<body>


	<br>
	<br>
	<br>



	<h1>Add Supplier</h1>

	<hr class="new1">
	<br>
	<br>
	<br>

	<div class="container">
		<form action="AddSupplier" method="post">
			<div class="row">
				<div class="col-25">
					<label for="fname">First Name</label>
				</div>
				<div class="col-75">
					<input type="text" id="fname" name="fullname"
						placeholder="Your name.." required>
				</div>
			</div>
			<div class="row">
				<div class="col-25">
					<label for="email">Email Address</label>
				</div>
				<div class="col-75">
					<input type="email" id="Email" name="emailaddress"
						placeholder="Email.."
						pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" required>
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="suppVehicle">Supplier Vehicle</label>
				</div>
				<div class="col-75">
					<input type="text" id="vehiclename" name="vehiclename"
						placeholder="Vehicle name.." required>
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="suppVehicleModule">Vehicle Module</label>
				</div>
				<div class="col-75">
					<input type="text" id="modulenum" name="moduleNum"
						title="should give 2 alphabet letters and 3 digits"
						placeholder="module Number..." pattern="[A-Za-z]{2}[0-9]{3}"
						maxlength="5" required>
				</div>
			</div>



			<div class="row">
				<div class="col-25">
					<label for="conNum">Contact Number</label>
				</div>
				<div class="col-75">
					<input type="text" id="conNumber" name="ContactNumber"
						title="follow the pattern example xxx xxxx xxx"
						placeholder="077 7777 777" pattern="[0-9]{3} [0-9]{4} [0-9]{3}"
						required>
				</div>
			</div>




			<div class="row">
				<div class="col-25">
					<label for="address">Address</label>
				</div>
				<div class="col-75">
					<input type="text" id="addressSup" name="supAddress"
						placeholder="Address..." required>
				</div>
			</div>








			<div class="row">
				<div class="col-25">
					<label for="rentperiod">Rent period</label>
				</div>
				<div class="col-75">
					<input type="text" id="rperiod" name="rentperiod"
						placeholder="xx years" required>
				</div>
			</div>




			<div class="row">
				<div class="col-25">
					<label for="payment">Payment Amount</label>
				</div>
				<div class="col-75">
					<input type="Number" id="paymentamt" name="payamt"
						placeholder="Rs.xxxxx.../=" required>
				</div>
			</div>





			<div class="row">
				<input type="submit" value="Add">
			</div>
		</form>
	</div>






</body>
</html>