<%@page import="com.itextpdf.text.BaseColor"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Image"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="com.itextpdf.text.Phrase"%>
<%@page import= "com.itextpdf.text.Rectangle"%>
<%@page import="com.itextpdf.text.Element"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="com.itextpdf.text.pdf.PdfPTableEvent"%>
<%@page import="com.itextpdf.text.pdf.PdfPRow"%>
<%@page import="com.itextpdf.text.DocumentException"%>
<%@page import="com.itextpdf.text.pdf.PdfContentByte"%>


<%@page import="java.beans.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>

<%@page import=" java.io.File"%>
<%@page import ="java.io.FileOutputStream"%>
<%@page import=" java.io.IOException"%>


<%@page import="Model.RepairAndMaintenance"%>
<%@page import="util.DBConnectionUtil"%>
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>




<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Maintenance Report</title>

</head>
<body>

	


<%


	response.setContentType("application/pdf");
	Document document = new Document();
	PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());

	document.open();
	

	String endDate=request.getParameter("year");

	
	Paragraph p = new Paragraph();
	Paragraph p33 = new Paragraph();
	p.add("Maintenance Details of Year "+endDate);
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
	ArrayList<RepairAndMaintenance> arraylist = new ArrayList<>();

	
	
	String sql = "select* from maintenance where End_Date LIKE ?";
	preparedStatement = connection.prepareStatement(sql);
	preparedStatement.setString(1,"_____"+"%"+endDate);
	resultset = preparedStatement.executeQuery();
	

	
	PdfPTable table1 =new PdfPTable(5);
	table1.setWidthPercentage(100);
	
	
	
	 // Code 2
	
	Font boldFont = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD); 
    
	 //jst test
	
	
	PdfPCell c1 =new PdfPCell(new Phrase("Vehicle ID",boldFont));
	c1.setBackgroundColor(BaseColor.CYAN);
	c1.setBorderWidth(1);
	table1.addCell(c1);
	PdfPCell c2 =new PdfPCell(new Phrase("Start Date",boldFont));
	c2.setBackgroundColor(BaseColor.CYAN);
	c2.setBorderWidth(1);
	table1.addCell(c2);
	PdfPCell c3 =new PdfPCell(new Phrase("End Date",boldFont));
	c3.setBackgroundColor(BaseColor.CYAN);
	c3.setBorderWidth(1);
	table1.addCell(c3);
	PdfPCell c4 =new PdfPCell(new Phrase("Description",boldFont));
	c4.setBackgroundColor(BaseColor.CYAN);
	c4.setBorderWidth(1);
	table1.addCell(c4);
	PdfPCell c5 =new PdfPCell(new Phrase("MaintenanceCost",boldFont));
	c5.setBackgroundColor(BaseColor.CYAN);
	c5.setBorderWidth(1);
	table1.addCell(c5);
	
	document.add(table1);
	while (resultset.next()) {

		
		PdfPTable table =new PdfPTable(5);
		table.setWidthPercentage(100);
		

		table.addCell(""+(resultset.getString("VehicleID")));
		table.addCell(""+(resultset.getString("Start_Date")));
		
		
		
		table.addCell(""+(resultset.getString("End_Date")));
		
				
		
		table.addCell(""+(resultset.getString("Description")));
		
		
		
		table.addCell(""+(resultset.getString("Maintenance_Cost")));
		
		
	
		document.add(table);
		
		
		
	}

	document.close();
	
%>
	
	

</body>
</html>