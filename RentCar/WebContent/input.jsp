<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>

<style>

body{
 background-color: red;

}

#expenseForm{




}

</style>


</head>
<body>


<script>
var count = 0;

function  myFunction(){
	
	
	
	var x = document.createElement("INPUT");
	  x.setAttribute("type", "text");
	 // x.setAttribute("value", "Hello World!");
	  x.setAttribute("name", "expenceDes"+count)
	  document.getElementById("expenseForm").appendChild(x);
	    
	  
	  var kk =document.write($nbsp);
	 // document.getElementById("expenseForm").appendChild(kk);
	  
	  
	  var y = document.createElement("INPUT");
	  y.setAttribute("type", "number");
	  y.setAttribute("name", "amount"+count)
	  document.getElementById("expenseForm").appendChild(y);
	
	  
	  
	  
	  var z = document.createElement("br");
	  document.getElementById("expenseForm").appendChild(z);
	  
	  var g = document.createElement("br");
	  document.getElementById("expenseForm").appendChild(g);
	  
	  count++;
}

function finalSubmit() {
	var x = document.createElement("INPUT");
	  x.setAttribute("type", "hidden");
	  x.setAttribute("value",count);
	  x.setAttribute("name", "count")
	   document.getElementById("expenseForm").appendChild(x);
}


</script>


  <button onclick="myFunction()">Click me</button>
  
  
  <form action="display.jsp" method="post">
 <div id="expenseForm">
 
 
 </div>
  

  
<button onclick="finalSubmit()" type="submit">submit</button>

</form>


</body>
</html>