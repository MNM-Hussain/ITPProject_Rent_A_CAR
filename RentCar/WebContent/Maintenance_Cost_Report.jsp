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
<title>Monthly Maintenance Cost Report</title>
</head>
<body>


<%




	response.setContentType("application/pdf");
	Document document = new Document();
	PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());

	document.open();
	
	//String date1=request.getParameter("End_Date");
	
 String end_Date=request.getParameter("month");
	
	Paragraph p = new Paragraph();
	Paragraph p12 = new Paragraph();
	
	Paragraph p33 = new Paragraph();
	p.add("Monthly Cost Details of month"+end_Date);
	p.setAlignment(Element.ALIGN_CENTER);
	p33.add("       ");
	p33.setAlignment(Element.ALIGN_CENTER);
	document.add(p);
	document.add(p33);
	
	float amount=0;
	
	
	PreparedStatement preparedStatement;
	Connection connection;
	ResultSet resultset;
	Statement statement;

	connection = DBConnectionUtil.getDBConnection();
	preparedStatement = null;
	ArrayList<RepairAndMaintenance> arraylist = new ArrayList<>();

	
	
	String sql = "select VehicleID, Maintenance_cost from maintenance where End_Date LIKE ?";
	preparedStatement = connection.prepareStatement(sql);
	preparedStatement.setString(1,end_Date+"_____"+"%");
	resultset = preparedStatement.executeQuery();
	

	
	PdfPTable table1 =new PdfPTable(2);
	table1.setWidthPercentage(100);
	
	
	
	 // Code 2
	
	Font boldFont = new Font(Font.FontFamily.HELVETICA, 12, Font.BOLD); 
    
	 //jst test
	
	
	PdfPCell c1 =new PdfPCell(new Phrase("Vehicle ID",boldFont));
	c1.setBackgroundColor(BaseColor.CYAN);
	c1.setBorderWidth(1);
	table1.addCell(c1);
	PdfPCell c2 =new PdfPCell(new Phrase("Maintenance Cost",boldFont));
	c2.setBackgroundColor(BaseColor.CYAN);
	c2.setBorderWidth(1);
	table1.addCell(c2);
	
	document.add(table1);
	while (resultset.next()) {

		
		PdfPTable table =new PdfPTable(2);
		table.setWidthPercentage(100);
		
		table.addCell(""+(resultset.getString("VehicleID")));
		
		table.addCell(""+(resultset.getString("Maintenance_Cost")));
		
		
		 amount=amount+Float.parseFloat(resultset.getString("Maintenance_Cost"));
		
		
		
		document.add(table);
		
		
		
	}
	
	

	p12.add( "Total maintenance cost per month  "+amount);
	
	document.add(p12);
	

	document.close();
	
%>
	
	
	








</body>

</html>