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



<%@page import="Model.Paymentmodel"%>
<%@page import="util.DBConnectionUtil"%>
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>



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
	connection = DBConnectionUtil.getDBConnection();

	preparedStatement = null;

	ArrayList<Paymentmodel> arraylist = new ArrayList<>();

	
	
	String sql = "select p.Totalpayment,p.datecurrent from Payment p where p.datecurrent LIKE ?";
	preparedStatement = connection.prepareStatement(sql);
	preparedStatement.setString(1,"_____"+Date+"%");
	resultset = preparedStatement.executeQuery();
	
	

	
	
	
	float amt=0;


	
	Font f = new Font();
	f.setStyle(Font.BOLD);
	f.setSize(12);

	
	PdfPTable table1 =new PdfPTable(2);
	
	table1.setWidthPercentage(100);
	 // Code 2
	
	Font boldFont = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.BOLD);
	


	PdfPCell c1 =new PdfPCell(new Phrase("datecurrent",boldFont));
	table1.addCell(c1);
	
	PdfPCell c2 =new PdfPCell(new Phrase("Totalpayment",boldFont));
	table1.addCell(c2);

	

	
	
	document.add(table1);
	while (resultset.next()) {

		

		PdfPTable table =new PdfPTable(2);
		table.setWidthPercentage(100);
			
		

		
		
		table.addCell(""+(resultset.getString("datecurrent")));
		
		table.addCell(""+(resultset.getString("Totalpayment")));
		
		 amt=amt+Float.parseFloat(resultset.getString("Totalpayment"));
		
		
		

		
		
		
		
		
		
		document.add(table);
		
		
		
	}
	



	p1111.add("\n" + "Net Amount of payment received in this month  "+amt);
			
	document.add(p1111);
	
	document.close();
	
%>












</body>
</html>