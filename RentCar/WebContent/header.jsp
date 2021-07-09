<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">

<title>Metro rent a Car</title>

<link rel="stylesheet" href="CSS/header.css">
<link rel="stylesheet" href="assets/header-fixed.css">
<link href='https://fonts.googleapis.com/css?family=Cookie'
	rel='stylesheet' type='text/css'>






<title>Insert title here</title>
</head>
<body>


	<header class="header-fixed">

		<div class="header-limiter">

			<h1>
				Metro<span> Rent a Car</span>
			</h1>

			<nav>
				<a href="Home.jsp">Home</a> <a href="reservation.jsp">Reservation</a>
				<a href="AddInquiryDetails.jsp">Inquiry</a> <a href="AboutUs.jsp">About</a>
				<a href="contactUS.jsp">Contact</a> <a><mark>Hotline</mark> +94
					771 234 567</a>

			</nav>

		</div>

	</header>

	<!-- You need this element to prevent the content of the page from jumping up -->
	<div class="header-fixed-placeholder"></div>

	<!-- The content of your page would go here. -->




	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
	<script>

	$(document).ready(function(){

		var showHeaderAt = 150;

		var win = $(window),
				body = $('body');

		// Show the fixed header only on larger screen devices

		if(win.width() > 400){

			// When we scroll more than 150px down, we set the
			// "fixed" class on the body element.

			win.on('scroll', function(e){

				if(win.scrollTop() > showHeaderAt) {
					body.addClass('fixed');
				}
				else {
					body.removeClass('fixed');
				}
			});

		}

	});

</script>


	<!-- Demo ads. Please ignore and remove. -->
	<script src="http://cdn.tutorialzine.com/misc/enhance/v3.js" async></script>












</body>
</html>