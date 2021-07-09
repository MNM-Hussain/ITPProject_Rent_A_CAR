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

	
	
	IS_for_the_year getIncomeStatement = new IS_for_the_year();

	IncomeStatement IS = getIncomeStatement.get_values_of_IncomeStatement_ForTheYear(date);
	if (IS == null) {
		out.println("<script type=\"text/javascript\">");
		out.println("alert('This date dosent exisit');");
		out.println("location='Add_IS_for_the_year.jsp';");
		out.println("</script>");
	}
	%>



	<%
		if (IS != null) {
	%>
	
											
											
											
											
			<b><i><h1  style="margin-left:90px;color:#3E479E ;margin-top: 70px" >Anual Report of Metro Rent a Car  <%=date %></h1>	</i></b>					

			<hr style="border: 5px solid black;">







					<table border="3"
						style="height: 20%; width: 80%; margin-top: 40px;margin-left: 100px;">
						<caption style="margin-left: 100px;"><b>Income Statement for the year end : <%out.println(date);%></b>
						</caption>




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



<% 


piechart PI= new piechart();

float[] Incomeamount = new float[12];
Incomeamount=PI.get_values_of_IncomeStatement(date);
System.out.println("amount is :"+Incomeamount[1]);



float[] Expenseamount = new float[12];
Expenseamount=PI.get_total_expenses_of_IncomeStatement(date);
System.out.println("amount is :"+Expenseamount[1]);






%>
 <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
    
   var tem0=<%=Incomeamount[0] %>;
   var tem1=<%=Incomeamount[1] %>;
   var tem2=<%=Incomeamount[2] %>;
   var tem3=<%=Incomeamount[3] %>;
   var tem4=<%=Incomeamount[4] %>; 
   var tem5=<%=Incomeamount[5] %>; 
   var tem6=<%=Incomeamount[6] %>;
   var tem7=<%=Incomeamount[7] %>;
   var tem8=<%=Incomeamount[8] %>;
   var tem9=<%=Incomeamount[9] %>;
   var tem10=<%=Incomeamount[10] %>;
   var tem11=<%=Incomeamount[11] %>;
   
   
   
   var Etem0=<%=Expenseamount[0] %>;
   var Etem1=<%=Expenseamount[1] %>;
   var Etem2=<%=Expenseamount[2] %>;
   var Etem3=<%=Expenseamount[3] %>;
   var Etem4=<%=Expenseamount[4] %>; 
   var Etem5=<%=Expenseamount[5] %>; 
   var Etem6=<%=Expenseamount[6] %>;
   var Etem7=<%=Expenseamount[7] %>;
   var Etem8=<%=Expenseamount[8] %>;
   var Etem9=<%=Expenseamount[9] %>;
   var Etem10=<%=Expenseamount[10] %>;
   var Etem11=<%=Expenseamount[11] %>;
   
   
   
    
      google.charts.load("current", {packages:["corechart"]});
      google.charts.setOnLoadCallback(drawChart);
      function drawChart() {
        var Idata = google.visualization.arrayToDataTable([
          ['Task', 'Hours per Day'],
          ['January',tem0],
          ['February',  tem1],
          ['March', tem2],
          ['April', tem3],
          ['May',  tem4],
		  ['June', tem5],
		  ['July', tem6],
		  ['August', tem7],
		  ['September',tem8],
		  ['October',    tem9],
		  ['November',    tem10],
		  ['December',    tem11]
        ]);

        
        
        
        var Edata = google.visualization.arrayToDataTable([
            ['Task', 'Hours per Day'],
            ['January',Etem0],
            ['February',  Etem1],
            ['March', Etem2],
            ['April', Etem3],
            ['May',  Etem4],
  		  ['June', Etem5],
  		  ['July', Etem6],
  		  ['August', Etem7],
  		  ['September',Etem8],
  		  ['October',    Etem9],
  		  ['November',    Etem10],
  		  ['December',    Etem11]
          ]);

        
        
        
        
        
        
        
        
        var Ioptions = {
          title: 'TOTAL INCOME FOR THE YEAR',
          is3D: true,
        };
        
        
        var Eoptions = {
                title: 'TOTAL EXPENSE FOR THE YEAR',
                is3D: true,
              };

        

        var chart = new google.visualization.PieChart(document.getElementById('piechart_3d'));
        chart.draw(Idata, Ioptions);
        
        var chart1 = new google.visualization.PieChart(document.getElementById('piechart1_3d'));
        chart1.draw(Edata, Eoptions);
      }
    </script>





 <div id="piechart_3d" style="width: 750px; height: 400px;  "></div>
 
  <div id="piechart1_3d" style="width: 750px; height: 400px;  "></div>










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