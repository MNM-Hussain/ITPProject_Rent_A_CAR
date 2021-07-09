package Servlet;

import java.beans.Statement;
import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Model.date;
import util.DBConnectionUtil;

/**
 * Servlet implementation class AddDate
 */
@WebServlet("/AddDate")
public class AddDate extends HttpServlet {
	
	private PreparedStatement preparedStatement;

	private static Connection connection;

	Statement statement;
	
	FileInputStream fs=null;
	
	private ResultSet resultset;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddDate() {
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
		
		date d1 = new date();
		
		d1.setStartdate(request.getParameter("start"));
		d1.setEndDate(request.getParameter("end"));
		
		
		System.out.println("hhhhh"+request.getParameter("start"));
		
	

		try {
		String sql="insert into datetable (start_date,end_date) values(?,?)";
		
		connection = DBConnectionUtil.getDBConnection();
		System.out.println("before"+request.getParameter("end"));
		
		preparedStatement.setString(1,d1.getStartdate());
		preparedStatement.setString(2,d1.getEndDate());
		
			preparedStatement = connection.prepareStatement(sql);
			
			System.out.println("after"+request.getParameter("end"));
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
//		
	
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/insert_date.jsp");
		dispatcher.forward(request, response);
		
		
	
	}
		
	}
	




		
		
		
	

