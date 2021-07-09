<%@page import="Model.Paymentmodel"%>
<%@page import="Servlet.GetPayment"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Payment</title>





<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="CSS/updatepayment.css" type="text/css">




</head>
<body>




	<h1>
		<center>Payment Update</center>
	</h1>

	<hr class="line">





	<%
		String ccv = (String) request.getParameter("ccv");

	GetPayment gp = new GetPayment();

	Paymentmodel pm = gp.get_values_from_Payment(ccv);
	%>






	<br></br>
	<br></br>
	<br></br>


	<div class="container">
		<form action="UpdatePayment?payID=<%=pm.getCcv()%>" method="post">

			<h3>
				<center>Online Payment Update</center>
			</h3>

			<hr class="line">

			<br></br> <br></br>


	<div class="Total">
		Total Payment: <input type="Number" id="pay" name="Totalpayment"
			placeholder="xxx" value="<%=pm.getTotpay()%>">
	</div>

<br></br> <br></br>

			<div class="row">
				<div class="col-25">
					<label for="country"><b>Payment Type </b></label>
				</div>
				<div class="col-75">
					<select id="ptype" name="Paytype" value="<%=pm.getPayType()%>"
						required>
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
						placeholder="Card holder name.." value="<%=pm.getHoldername()%>"
						required>
				</div>
			</div>

			<div class="row">
				<div class="col-25">
					<label for="cnum"><b>Card Number </b></label>
				</div>
				<div class="col-75">
					<input type="text" id="cardnum" name="cnumber"
						pattern="[0-9]{4} [0-9]{4} [0-9]{4} [0-9]{4}"
						data-mask="0000 0000 0000 0000" placeholder="Card Number.."
						value="<%=pm.getCardnumber()%>" required>
				</div>
			</div>




			<div class="row">
				<div class="col-25">
					<label for="edate"> <b> Expiry Date </b></label>
				</div>
				<div class="col-75">
					<input type="text" id="expdate" name="expire_date"
						placeholder="mm/year" value="<%=pm.getExpDate()%>" required>
				</div>
			</div>


			<div class="row">
				<div class="col-25">
					<label for="ccvcode"><b> CCV </b></label>
				</div>
				<div class="col-75">
					<input type="Number" id="CCV" name="ccv" data-mask="0000" min="000"
						max="999" placeholder="Card Security Code.."
						value="<%=pm.getCcv()%>" required>
				</div>


			</div>


<!--  

		

-->

			<br> </br>


			<div class="row">

				<input type="submit" value="Confirm">
			</div>
		</form>
	</div>


	<br></br>








</body>
</html>