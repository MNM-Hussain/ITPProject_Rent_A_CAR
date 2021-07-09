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

import Model.Rates;

import util.DBConnectionUtil;

/**
 * Servlet implementation class GetRatesServlet
 */
@WebServlet("/GetRatesServlet")
public class GetRatesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetRatesServlet() {
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
	
	
	
	
	

	public Rates get_values_of_Rates(String RateId)
	{
		
		DBConnectionUtil dbConnectionUtil = new DBConnectionUtil();
		@SuppressWarnings("static-access")
		Connection connection=dbConnectionUtil.getDBConnection();
	
	PreparedStatement preparedstatement=null;
	ResultSet resultset=null;
	
	Rates rate = new Rates();
	
	
	
	try {
		
	
		String sql="select* from Rates where RateId=?";
		
		preparedstatement=connection.prepareStatement(sql);
		preparedstatement.setString(1,RateId);
		resultset=preparedstatement.executeQuery();
		
	
		while(resultset.next())
		{
						
			rate.setRateId(resultset.getString("RateId"));
						
			rate.setCategory(resultset.getString("category"));
			
			rate.setAmount(resultset.getString("Amount"));
				
		}
	
		
	
	
	}catch(Exception e)
    	{
		System.out.println(e);
    	}
	
	return rate;
	

	
	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	

}
