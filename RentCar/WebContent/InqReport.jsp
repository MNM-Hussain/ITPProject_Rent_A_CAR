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



<%@page import="Model.Inquiry"%>
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
	
	//String date1=request.getParameter("NIC");
	
		String Date=request.getParameter("month");
	
	Paragraph p = new Paragraph();
	Paragraph p33 = new Paragraph();
	p.add("Inquiry Report for the Month  "+Date);
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
	ArrayList<Inquiry> arraylist = new ArrayList<>();

	
	
	String sql = "select* from inquiry where date LIKE ?";
	preparedStatement = connection.prepareStatement(sql);
	preparedStatement.setString(1,"_____"+Date+"%");
	resultset = preparedStatement.executeQuery();
	
	
	Font f = new Font();
	f.setStyle(Font.BOLD);
	f.setSize(8);

	
	PdfPTable table1 =new PdfPTable(5);
	
	table1.setWidthPercentage(100);
	 // Code 2
	
	Font boldFont = new Font(Font.FontFamily.TIMES_ROMAN, 15, Font.BOLD);
	
	PdfPCell c1 =new PdfPCell(new Phrase("Name",boldFont));
	table1.addCell(c1);
	PdfPCell c2 =new PdfPCell(new Phrase("Booking",boldFont));
	table1.addCell(c2);
	PdfPCell c3 =new PdfPCell(new Phrase("Email",boldFont));
	table1.addCell(c3);
	PdfPCell c4 =new PdfPCell(new Phrase("Problem",boldFont));
	table1.addCell(c4);
	PdfPCell c5 =new PdfPCell(new Phrase("Comment",boldFont));
	table1.addCell(c5);
	

	document.add(table1);
	while (resultset.next()) {

		

		PdfPTable table =new PdfPTable(5);
		table.setWidthPercentage(100);
			
		
		table.addCell(""+(resultset.getString("Name")));
		
		
		table.addCell(""+(resultset.getString("Booking")));
		
		
		
		table.addCell(""+(resultset.getString("Email")));
		
				
		
		table.addCell(""+(resultset.getString("Problem")));
		
		
		
		table.addCell(""+(resultset.getString("Comment")));
		
		
		
		
		
		
		document.add(table);
		
		
		
	}
	
	


	document.close();
	
%>












</body>
</html>