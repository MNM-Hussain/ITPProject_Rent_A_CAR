<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>


<%


//String des=request.getParameter("Salary"));

int count=Integer.parseInt(request.getParameter("count"));



String[] description =new String[10] ;
int[] amount=new int[10];

for(int i=0;i<count;i++){
	
	 description[i]=request.getParameter("expenceDes"+i);
	 amount[i]=Integer.parseInt(request.getParameter("amount"+i));
	
	
}
%>





	<input type="text" name="count" value="<%=count%>"><br><br>

	<%
	for(int i=0;i<count;i++){
	%>	
		<input type="text" name="expenceDes" value="<%=description[i]%>"><br>
		<input type="text" name="amount" value="<%=amount[i]%>"><br><br>

		


	<% 	
	}
	%>
	
	
	





<form  action="AddExpenseServlet"  method="post">

<input type="hidden" name="count" value="<%=count%>"><br><br>

<input type="hidden" name="expenceDes" value="<%=description%>"><br>
		<input type="hidden" name="amount" value="<%=amount%>"><br><br>
		
		
		<input type="submit"  value="submit">

</form>





</body>
</html>