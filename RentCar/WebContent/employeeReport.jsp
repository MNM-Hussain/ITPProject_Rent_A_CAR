<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    
    
    <%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Image"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="com.itextpdf.text.Phrase"%>
<%@page import="com.itextpdf.text.Element"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.Document"%>


<%@page import="com.itextpdf.text.Element"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.Document"%>


<%@page import="java.beans.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>



<%@page import="com.model.Salary"%>
<%@page import="com.util.DBconnect"%>
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>



<%


	response.setContentType("application/pdf");
	Document document = new Document();
	PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());

	document.open();
	

	
String Date=request.getParameter("month");	


	Paragraph p = new Paragraph();
	Paragraph p1111 = new Paragraph();
	
	Paragraph p33 = new Paragraph();
	p.add("Payment Income for the month   "+"'"+Date+"'");
	p.setAlignment(Element.ALIGN_CENTER);
	p33.add("       ");
	p33.setAlignment(Element.ALIGN_CENTER);
	document.add(p);
	document.add(p33);
	
	
	PreparedStatement preparedStatement;

	Connection connection;

	ResultSet resultset;
	
	Statement statement;
	connection = DBconnect.initializeddb();

	preparedStatement = null;

	ArrayList<Salary> arraylist = new ArrayList<>();

	
	
	String sql = "select Nic,date,basic_salary,attendence,epf,etf,netsalary from Salary  where date LIKE ?";
	preparedStatement = connection.prepareStatement(sql);
	preparedStatement.setString(1,"_____"+Date+"%");
	resultset = preparedStatement.executeQuery();
	
	

	
	
	
	float amount=0;


	
	Font f = new Font();
	f.setStyle(Font.BOLD);
	f.setSize(12);

	
	PdfPTable table1 =new PdfPTable(7);
	
	table1.setWidthPercentage(100);
	 // Code 2
	
	Font boldFont = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.BOLD);
	
	

	PdfPCell c1 =new PdfPCell(new Phrase("Nic",boldFont));
	table1.addCell(c1);
	
	PdfPCell c2 =new PdfPCell(new Phrase("date",boldFont));
	table1.addCell(c2);

	PdfPCell c3 =new PdfPCell(new Phrase("basic_salary",boldFont));
	table1.addCell(c3);
	
	PdfPCell c4 =new PdfPCell(new Phrase("attendence",boldFont));
	table1.addCell(c4);

	PdfPCell c5 =new PdfPCell(new Phrase("epf",boldFont));
	table1.addCell(c5);


	PdfPCell c6 =new PdfPCell(new Phrase("etf",boldFont));
	table1.addCell(c6);
	
	PdfPCell c7 =new PdfPCell(new Phrase("netsalary",boldFont));
	table1.addCell(c7);
	
	
	document.add(table1);
	while (resultset.next()) {

		

		PdfPTable table =new PdfPTable(7);
		table.setWidthPercentage(100);
			
		
		
		table.addCell(""+(resultset.getString("Nic")));
		
		table.addCell(""+(resultset.getString("date")));
		table.addCell(""+(resultset.getString("basic_salary")));
		table.addCell(""+(resultset.getString("attendence")));
		table.addCell(""+(resultset.getString("epf")));
		table.addCell(""+(resultset.getString("etf")));
		table.addCell(""+(resultset.getString("netsalary")));
		
		 amount=amount+Float.parseFloat(resultset.getString("netsalary"));
		
		
		

		
		
		
		
		
		
		document.add(table);
		
		
		
	}
	



	p1111.add( "Total Net Salary  "+amount);
			
	document.add(p1111);
	
	document.close();
	
%>











</body>
</html>