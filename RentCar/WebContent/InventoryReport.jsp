<%@page import="com.itextpdf.text.pdf.DefaultFontMapper"%>
<%@page import="java.awt.geom.Rectangle2D"%>
<%@page import="java.awt.Graphics2D"%>
<%@page import="java.awt.Graphics"%>
<%@page import="com.itextpdf.text.pdf.PdfTemplate"%>
<%@page import="com.itextpdf.text.pdf.PdfContentByte"%>
<%@page import="com.itextpdf.text.Rectangle"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="java.io.File"%>
<%@page import="com.itextpdf.text.pdf.PdfWriter"%>
<%@page import="com.itextpdf.text.Image"%>
<%@page import="com.itextpdf.text.pdf.PdfPTable"%>
<%@page import="com.itextpdf.text.Font"%>
<%@page import="com.itextpdf.text.Phrase"%>
<%@page import="com.itextpdf.text.Element"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.Document"%>
<%@page import="org.jfree.data.general.DefaultPieDataset"%>
<%@page import="org.jfree.chart.ChartFactory"%> 
<%@page import=" org.jfree.chart.JFreeChart" %>
<%@page import="org.jfree.chart.ChartFactory "%>
<%@page import=" org.jfree.chart.JFreeChart" %>



<%@page import="com.itextpdf.text.Element"%>
<%@page import="com.itextpdf.text.Paragraph"%>
<%@page import="com.itextpdf.text.Document"%>


<%@page import="java.beans.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.ArrayList"%>



<%@page import="Model.Inventory"%>
<%@page import="util.DBConnectionUtil"%>
<%@page import="com.itextpdf.text.pdf.PdfPCell"%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Inventory report</title>
</head>
<body>


<%
//String str="10";

String Date=request.getParameter("year");	


response.setContentType("application/pdf");
Document document = new Document();
PdfWriter writer = PdfWriter.getInstance(document, response.getOutputStream());


			document.open();

			document.add(new Paragraph("---------------------------------------------------------REPORT-------------------------------------------------------------\n\n"));
			document.add(new Paragraph("                                    Reserved Invenotries & Stock Details for the year "+Date));
			document.add(new Paragraph("                                        CREATED REPORT BY-Inventory Manager\n"));
		    document.add(new Paragraph("---------------------------------------------------------------------------------------------------------------------------------\n\n"));
		    document.addCreationDate();
	    
	    
	   
	    
	    PreparedStatement preparedStatement;
		Connection connection;
		ResultSet resultset;
		Statement statement;

		connection = DBConnectionUtil.getDBConnection();
		preparedStatement = null;
		ArrayList<Inventory> arraylist = new ArrayList<>();

		
		String sql = "select* from inventory where date LIKE ?";
		preparedStatement = connection.prepareStatement(sql);
		
		preparedStatement.setString(1,Date+"_____"+"%");
		resultset = preparedStatement.executeQuery();
		
		
		Font f = new Font();
		f.setStyle(Font.BOLD);
		f.setSize(4);

		
		PdfPTable table1 =new PdfPTable(4);
		
		table1.setWidthPercentage(100);

		
		Font boldFont = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.BOLD);
		
		PdfPCell c1 =new PdfPCell(new Phrase("CarID",boldFont));
		table1.addCell(c1);
		PdfPCell c2 =new PdfPCell(new Phrase("Model",boldFont));
		table1.addCell(c2);
		PdfPCell c3 =new PdfPCell(new Phrase("Category",boldFont));
		table1.addCell(c3);
		PdfPCell c4 =new PdfPCell(new Phrase("Date of purchase",boldFont));
		table1.addCell(c4);
		
		document.add(table1);
		while (resultset.next()) {

			
			
			
			
			Font fontH1 = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL);

			PdfPTable table = new PdfPTable(4);
			table.setWidthPercentage(100);

			table.addCell(new PdfPCell(new Phrase((resultset.getString("carID")),fontH1)));
			table.addCell(new PdfPCell(new Phrase((resultset.getString("model")),fontH1)));
			table.addCell(new PdfPCell(new Phrase((resultset.getString("category")),fontH1)));
			table.addCell(new PdfPCell(new Phrase((resultset.getString("date")),fontH1)));
		
			
			
			
			
			document.add(table);
			
			
	    
		}
		
		{
		
		try {
			 DefaultPieDataset myPiedataset = new DefaultPieDataset();
             /* Define Values for the Pie Chart - Programming Languages Percentage Difficulty */
             String sqls = "SELECT i.model, COUNT(a.carID) FROM inventory i,Availability a where i.carID=a.carID and i.date LIKE ? GROUP BY i.model";
		preparedStatement = connection.prepareStatement(sqls);
		
		preparedStatement.setString(1,Date+"_____"+"%");
		resultset = preparedStatement.executeQuery();
		
		while (resultset.next()) {


			myPiedataset.setValue(resultset.getString(1),Integer.parseInt(resultset.getString(2)));
		
	
		
			
			
		}
	
             JFreeChart PDFPieChart=ChartFactory.createPieChart("Most reserved Cars",myPiedataset,true,true,false);
         
             int width=640; 
             int height=480;                
             Document PieChart=new Document(new Rectangle(width,height));              
           
             PdfWriter writer2=PdfWriter.getInstance(PieChart,new FileOutputStream("Inventory Report"));
      
             PieChart.open();
             
             PieChart.addTitle("Inventory Report");
             PieChart.addAuthor("InventoryManager");                
             PieChart.addKeywords("iText,PieChart,JFreeChart,PDF,Example Tutorial");
            
             PdfContentByte Add_Chart_Content= writer.getDirectContent();
            
             PdfTemplate template_Chart_Holder=Add_Chart_Content.createTemplate(width,height);
             
              Graphics2D Graphics_Chart=template_Chart_Holder.createGraphics(width,height,new DefaultFontMapper());                
              Rectangle2D Chart_Region=new Rectangle2D.Double(0,0,540,380);
             
           PDFPieChart.draw(Graphics_Chart,Chart_Region);           
             Graphics_Chart.dispose();
           
             Add_Chart_Content.addTemplate(template_Chart_Holder,40,60);
           
             PieChart.close();
		}
		catch(Exception i)
        {
            System.out.println(i);
        }
		}
		document.newPage();
		
		
		document.add(new Phrase("\n"));
		document.add(new Paragraph("                                        Number of Reservations done for vehicles \n"));
		document.add(new Phrase("\n"));
		
		String sqls = "SELECT a.carID ,i.model, COUNT(a.carID) FROM inventory i,Availability a where i.carID=a.carID and i.date like ? GROUP BY a.carID,i.model";
		preparedStatement = connection.prepareStatement(sqls);
		preparedStatement.setString(1,Date+"_____"+"%");
		
		resultset = preparedStatement.executeQuery();
		
		PdfPTable table2 =new PdfPTable(3);
		
		table2.setWidthPercentage(75);

		
		Font boldFont3 = new Font(Font.FontFamily.TIMES_ROMAN, 14, Font.BOLD);
		
		PdfPCell a1 =new PdfPCell(new Phrase("CarID",boldFont));
		table2.addCell(a1);
		PdfPCell a2 =new PdfPCell(new Phrase("Car Name",boldFont));
		table2.addCell(a2);
		PdfPCell a3 =new PdfPCell(new Phrase("No Of Reservations",boldFont));
		table2.addCell(a3);
		
		
		document.add(table2);
		while (resultset.next()) {


			Font fontH2 = new Font(Font.FontFamily.TIMES_ROMAN, 12, Font.NORMAL);

			PdfPTable table3 = new PdfPTable(3);
			table3.setWidthPercentage(75);

			table3.addCell(new PdfPCell(new Phrase((resultset.getString(1)),fontH2)));
			table3.addCell(new PdfPCell(new Phrase((resultset.getString(2)),fontH2)));
			table3.addCell(new PdfPCell(new Phrase((resultset.getString(3)),fontH2)));
		
		
			
			document.add(table3);
		}
		document.add(new Phrase("\n"));
		document.add(new Phrase("\n"));
		
	     
		
	
	 document.close();

%>




</body>
</html>