<%@page import="service.IS_for_the_year"%>
<%@page import="service.IS_for_the_year"%>
<%@page import="Model.IncomeStatement"%>
<%@page import="java.util.ArrayList"%>

<%@page import="Servlet.GetIncomeStatement"%>


<%@page import="service.piechart"%>

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
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

<script src="js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css" href=" CSS/ADMIN_PAGE.css">
<link rel="stylesheet" type="text/css" href=" CSS/calculated_incSTM.css">
<style>
#td1 {
	padding: 10px;
}
</style>

<title>MYEvent</title>

<script src="https://cdnjs.cloudflare.com/ajax/libs/html2pdf.js/0.9.2/html2pdf.bundle.js"></script>

<script>

window.onload=function(){
	
	document.getElementById("download").addEventListener("click",()=>{
		const invoice =this.document.getElementById("invoice");
		console.log(invoice);
		console.log(window);
		var opt={
				
				filename:'myfile.pdf',
				image:{type:'jpeg',quality:0.98},
				html2canvas:{scale :5},
				jsPDF:{unit:'in',formate:'letter',orientation:'portrait'}
				
		};
		html2pdf().from(invoice).set(opt).save();
		
	})
	
	
}



</script>








</head>

<body>


<button  id="download"  style="margin-left:1200px;background-color: #8080ff;"  class="btn btn-success ">Download Report</button>

<div id="invoice">

	<%
		String date = (String) request.getParameter("date");

	GetIncomeStatement getIncomeStatementservlet = new GetIncomeStatement();

	IncomeStatement IS = getIncomeStatementservlet.get_values_of_IncomeStatement(date);
	if (IS == null) {
		out.println("<script type=\"text/javascript\">");
		out.println("alert('This date dosent exisit');");
		out.println("location='View_IncomeStatement.jsp';");
		out.println("</script>");
	}
	%>



	<%
		if (IS != null) {
	%>
	
											
											
											
											
			<b><i><h1  style="margin-left:90px;color:#3E479E ;margin-top: 70px" >Income Statement For the Month  <%=date %></h1>	</i></b>					

			<hr style="border: 5px solid black;">







				<table border="3"
						style="height: 20%; width: 80%; margin-top: 40px;margin-left: 100px;">
						




						<tr>
							<td bgcolor="#8080ff" id="td1">Income</td>
							<td></td>
							<td></td>

						</tr>
						</tr>
						<tr>
							<td id="td1">Rent income</td>
							<td style="padding: 10px;"><%=IS.getRent_income()%></td>
							<td></td>


						</tr>

						</tr>
						<tr>
							<td id="td1">other income</td>
							<td id="td1"><%=IS.getOther_income()%></td>
							<td></td>
						</tr>




						<tr>
							<td></td>
							<td></td>
							<td></td>

						</tr>



						<tr>
							<td id="td1"><b>Total income</b></td>
							<td></td>
							<td id="td1"><%=IS.getTOTAL_INCOME()%></td>

						</tr>




						<tr>





							<td bgcolor="#8080ff" id="td1">Expenses</td>
							<td></td>
							<td></td>

						</tr>

						<tr>
							<td id="td1">salary</td>
							<td id="td1"><%=IS.getSalary()%></td>
							<td></td>


						</tr>



						<tr>
							<td id="td1">maintance</td>
							<td id="td1"><%=IS.getMaintance()%></td>
							<td></td>


						</tr>



						<tr>
							<td id="td1">electricity</td>
							<td id="td1"><%=IS.getElectricity()%></td>
							<td></td>

						</tr>
						<tr>
							<td id="td1">rent expenses</td>
							<td id="td1"><%=IS.getRent_expenses()%></td>
							<td></td>

						</tr>
						<tr>
							<td id="td1">other expenses</td>
							<td id="td1"><%=IS.getOther_expenses()%></td>
							<td></td>

						</tr>

						</tr>
						<tr>
							<td id="td1"><b>Total Expense</b></td>
							<td></td>
							<td id="td1">(<%=IS.getTOTAL_Expense()%>)
							</td>

						</tr>



						<tr>
							<td></td>
							<td></td>
							<td></td>

						</tr>



						</tr>

						</tr>
						<tr>
							<td bgcolor="#8080ff">profit or loss</td>
							<td></td>
							<td id="td1"><%=IS.getProfit_loss()%></td>

						</tr>




					</table>


			

<br><br><br><br>












				</div>



			</div>
		</div>
	</div>

	<%
		}
	%>



























	</div>
	</div>


	</div>

	</div>
	<script>
		$('.sub-menu ul').hide();
		$(".sub-menu a").click(function() {
			$(this).parent(".sub-menu").children("ul").slideToggle("100");
			$(this).find(".right").toggleClass("fa-caret-up fa-caret-down");
		});
	</script>




</div>


</body>
</html>