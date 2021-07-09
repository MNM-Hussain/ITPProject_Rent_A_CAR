<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment</title>

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="CSS/payment.css" type="text/css">


<script>

var i='${value}';

 if(i=='inserted'){
	
	alert('YOUR PAYMENT IS  PROCESSING,  WE WILL BE SEND A MAIL TO YOU AFTER CONFIRMING YOUR PAYMENT');
	window.location.href="Home.jsp";
 }
</script>


</head>


<%@include file="header.jsp"%>
<body>



	<h1>
		<mark>Card Payment </mark>
	</h1>













	<br></br>
	<br></br>
	<br></br>


	<div class="container">
		<form action="AddPayment" method="post">

			<h3>
				<center>Online Payment</center>
			</h3>

			<hr class="line">

			<p>
			<center>
				<b> we accept these type of payment </b>
			</center>
			</p>

			<div class="align_image">
				<img
					src="https://img.icons8.com/color/48/000000/mastercard-logo.png"
					width="80px" height="80px" /> <img
					src="https://img.icons8.com/color/48/000000/visa.png" width="80px"
					height="80px" /> <img
					src="https://img.icons8.com/color/48/000000/paypal.png"
					width="80px" height="80px" />
			</div>
			<br></br> 

<!-- -the total payment retrievel -->

<%	String finalcost =request.getParameter("finalcost"); %>

	<div class="Total">
		Total Payment: <input type="Number" id="pay" name="Totalpayment" value="<%=finalcost%>">
	</div>

<br></br> <br></br> 

			<div class="row">
				<div class="col-25">
					<label for="country"><b>Payment Type </b></label>
				</div>
				<div class="col-75">
					<select id="ptype" name="Paytype" required>
						<option value="visa">Visa</option>
						<option value="master">Master</option>
						<option value="paypal">PayPal</option>
					</select>
				</div>
			</div>


			<div class="row">
				<div class="col-25">
					<label for="name"><b>Card Holder Name </b></label>
				</div>
				<div class="col-75">
					<input type="text" id="chname" name="Cardholdername"
						placeholder="Card holder name.." required>
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="cnum"><b>Card Number </b></label>
				</div>
				<div class="col-75">
					<input type="text" id="cardnum" name="cnumber"
						pattern="[0-9]{4} [0-9]{4} [0-9]{4} [0-9]{4}"
						title="follow the pattern as xxxx xxxx xxxx xxxx"
						data-mask="0000 0000 0000 0000" placeholder="0000 0000 0000 0000"
						required>
				</div>
			</div>




			<div class="row">
				<div class="col-25">
					<label for="edate"> <b> Expiry Date </b></label>
				</div>
				<div class="col-75">
					<input type="text" id="expdate" name="expire_date"
						title="should give 2 digits as considering month and 2 digits as last two digits of a year"
						pattern="[0-1]{1}[0-9]{1}[/]{1}[2-9]{1}[0-9]{1}"
						placeholder="mm/year" required>
				</div>
			</div>


			<div class="row">
				<div class="col-25">
					<label for="ccvcode"><b> CCV </b></label>
				</div>
				<div class="col-75">
					<input type="Number" id="CCV" name="ccv" data-mask="0000" min="000"
						maxlength="3" max="999" placeholder="Card Security Code.."
						required>
				</div>


			</div>


<!-- -

			<div class="row">
				<div class="col-25">
					<label for="ccode"><b> Coupon code </b></label>
				</div>
				<div class="col-75">
					<input type="Text" id="Coup" name="couponcode" data-mask="0000"
						title="enter only 3 digits" placeholder="a345b">
				</div>


			</div>
 -->

			<br> </br>


			<div class="row">

				<input type="submit" value="Confirm"	>
			</div>
		</form>
	</div>


	<br></br>
	<br></br>
	<br></br>
	<br></br>
	<br></br>
	<br></br>

</body>





<%@include file="Footer.jsp"%>

</html>