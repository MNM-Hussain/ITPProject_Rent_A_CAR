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



<%@page import="Model.Suppliermodel"%>
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
	Paragraph p1 = new Paragraph();
	
	Paragraph p33 = new Paragraph();
	p.add("Supplier for the month   "+"'"+Date+"'");
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
	ArrayList<Suppliermodel> arraylist = new ArrayList<>();

	
	
	String sql = "select* from Supplier where datecurrent LIKE ?";
	preparedStatement = connection.prepareStatement(sql);
	preparedStatement.setString(1,"_____"+Date+"%");
	resultset = preparedStatement.executeQuery();
	
	
	
	float amt=0;
	
	Font f = new Font();
	f.setStyle(Font.BOLD);
	f.setSize(12);

	
	PdfPTable table1 =new PdfPTable(9);
	
	table1.setWidthPercentage(100);
	 // Code 2
	
	Font boldFont = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.BOLD);
	
	PdfPCell c1 =new PdfPCell(new Phrase("SuppID",boldFont));
	table1.addCell(c1);
	PdfPCell c2 =new PdfPCell(new Phrase("fullname",boldFont));
	table1.addCell(c2);
	PdfPCell c3 =new PdfPCell(new Phrase("emailaddress",boldFont));
	table1.addCell(c3);
	PdfPCell c4 =new PdfPCell(new Phrase("vehiclename",boldFont));
	table1.addCell(c4);
	PdfPCell c5 =new PdfPCell(new Phrase("moduleNum",boldFont));
	table1.addCell(c5);
	PdfPCell c6 =new PdfPCell(new Phrase("ContactNumber",boldFont));
	table1.addCell(c6);
	PdfPCell c7 =new PdfPCell(new Phrase("supAddress",boldFont));
	table1.addCell(c7);
	PdfPCell c8 =new PdfPCell(new Phrase("rentperiod",boldFont));
	table1.addCell(c8);
	PdfPCell c9 =new PdfPCell(new Phrase("payamt",boldFont));
	table1.addCell(c9);
	
	
	
	

	document.add(table1);
	while (resultset.next()) {

		

		PdfPTable table =new PdfPTable(9);
		table.setWidthPercentage(100);
			
		
		table.addCell(""+(resultset.getString("SuppID")));
		
		
		table.addCell(""+(resultset.getString("fullname")));
		
		
		
		table.addCell(""+(resultset.getString("emailaddress")));
		
				
		
		table.addCell(""+(resultset.getString("vehiclename")));
		
		
		
		table.addCell(""+(resultset.getString("moduleNum")));
		
		table.addCell(""+(resultset.getString("ContactNumber")));
		
		table.addCell(""+(resultset.getString("supAddress")));
		
		table.addCell(""+(resultset.getString("rentperiod")));
		
		

		table.addCell(""+(resultset.getString("payamt")));
		
		
		 amt=amt+Float.parseFloat(resultset.getString("payamt"));
		
		
		
		document.add(table);
		
		
		
	}
	
	
	p1.add("\n" + "Net Amount due for this month is   "+amt);
	
	document.add(p1);

	document.close();
	
%>












</body>
</html>