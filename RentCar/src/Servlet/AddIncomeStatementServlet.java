package Servlet;

import java.beans.Statement;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.IncomeStatement;

import service.IIncomeStatementService;

import service.IncomeStatementServiceimpl;
import util.DBConnectionUtil;

/**
 * Servlet implementation class AddIncomeStatementServlet
 */
@WebServlet("/AddIncomeStatementServlet")
public class AddIncomeStatementServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddIncomeStatementServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);

	

		IIncomeStatementService I_is = new IncomeStatementServiceimpl();
		String date=request.getParameter("date");
					
		int count = Integer.parseInt(request.getParameter("count"));
		
		String[] description = new String[10];
		int[] amount = new int[10];
		float otherexpenses=0;
		
		for (int i = 0; i < count; i++) {

			description[i] = request.getParameter("expenceDes" + i);
			amount[i] = Integer.parseInt(request.getParameter("amount" + i));
			otherexpenses=otherexpenses+amount[i];
		}

		
		
	
		
		IncomeStatement is = new IncomeStatement();
		
		float other_income = Float.parseFloat(request.getParameter("other_income"));
		float Salary = Float.parseFloat(request.getParameter("Salary"));
		float maintanance = Float.parseFloat(request.getParameter("maintance"));
		float electricity = Float.parseFloat(request.getParameter("electricity"));
		float rent_expenses = Float.parseFloat(request.getParameter("rent_expenses"));
		float Rent_income = Float.parseFloat(request.getParameter("Rent_income"));
	
		
		
		float tot_exp=Salary+maintanance+electricity+rent_expenses+otherexpenses;
		float tot_inc= Rent_income+other_income;
		
		float profit_or_loss=tot_inc-tot_exp;
		
		
		
		is.setDate(request.getParameter("date"));
		is.setSalary(Salary);
		is.setMaintance(maintanance);
		is.setElectricity(electricity);
		is.setRent_expenses(rent_expenses);
		is.setOther_expenses(otherexpenses);
		is.setTOTAL_INCOME(tot_inc);
		is.setTOTAL_Expense(tot_exp);
		is.setRent_income(Rent_income);
		is.setOther_income(other_income);
		is.setProfit_loss(profit_or_loss);

		
	
		

		String ChkMonth = date.substring(0,7);
		int DatesPerMonth =Integer.parseInt(I_is.CheckDay(ChkMonth));
		
		
		
				
		String ChkYear = date.substring(0,4);
		int AvailableMonth =Integer.parseInt(I_is.CheckMonth(ChkYear));
				
		
	
		
		//check weather it is equal to the primary key
		if(I_is.checkDate(date)==true) {
				
			request.setAttribute("value", "date exists");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Insert_income_statement.jsp");
			dispatcher.forward(request, response);
			
		}else if(DatesPerMonth!=0) {
			request.setAttribute("value", "one month");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Insert_income_statement.jsp");
			dispatcher.forward(request, response);
			
			
		}else if(AvailableMonth>=12) {
			request.setAttribute("value", "12 month");
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Insert_income_statement.jsp");
			dispatcher.forward(request, response);
			
			
		}
		else {
			
			

			
			I_is.Insert_IS_ForMonthEnded(is);
			

			PreparedStatement preparedStatement = null;
			Connection connection;
			Statement statement;
			connection = DBConnectionUtil.getDBConnection();
		
			try {
				
				for (int i = 0; i < count; i++) {
					String sql = "insert into expenses(date2,description,amount) values (?,?,?)";
					preparedStatement = connection.prepareStatement(sql);
					preparedStatement.setString(1, request.getParameter("date"));
					preparedStatement.setString(2, description[i]);
					preparedStatement.setInt(3, amount[i]);
					preparedStatement.execute();

				}

				connection.commit();

			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		
			request.setAttribute("value", "date added");
			request.setAttribute("date", date);
			
			RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/calculated_income_statement.jsp?date="+date);
			dispatcher.forward(request, response);
			
			
		}
						
				
			
			
	
			
	
	

	}

}
