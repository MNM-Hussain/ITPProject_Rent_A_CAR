package Servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import Model.Inventory;
import util.DBConnectionUtil;

/**
 * Servlet implementation class GetInventoryServlet
 */
@WebServlet("/GetInventoryServlet")
public class GetInventoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetInventoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	
	
	
	

	public Inventory get_values_of_Inventory(String carID)
	{
		
		System.out.println("gggg"+carID);
		
		DBConnectionUtil dbConnectionUtil = new DBConnectionUtil();
		@SuppressWarnings("static-access")
		Connection connection=dbConnectionUtil.getDBConnection();
	
	PreparedStatement preparedstatement=null;
	ResultSet resultset=null;
	
	Inventory inventory = new Inventory();
	
	
	
	try {
		
	
		
		
		String sql="select* from inventory where carID=?";
		
		preparedstatement=connection.prepareStatement(sql);
		preparedstatement.setString(1,carID);
		resultset=preparedstatement.executeQuery();
		
		
	
		while(resultset.next())
		{
			System.out.println("gggg"+resultset.getString("category"));
			inventory.setCarID(resultset.getString("carID"));
						
			inventory.setModel(resultset.getString("model"));
			
			inventory.setCategory(resultset.getString("category"));
			
			inventory.setSupplierID(resultset.getString("supID"));
			
			inventory.setDescription(resultset.getString("descriptionn"));
			
			inventory.setNoOfPassengers(resultset.getInt("noOfPass"));
			
			inventory.setUrl(resultset.getString("url"));
				
		}
	
		
	
	
	}catch(Exception e)
    	{
		System.out.println(e);
    	}
	
	return inventory;
	

	
	
	}
	
	
	
	
	
	
	
	
}
