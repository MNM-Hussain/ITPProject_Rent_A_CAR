package Servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.IncomeStatement;
import Model.Rates;
import util.DBConnectionUtil;

/**
 * Servlet implementation class GetIncomeStatement
 */
@WebServlet("/GetIncomeStatement")
public class GetIncomeStatement extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetIncomeStatement() {
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
	}

	public IncomeStatement get_values_of_IncomeStatement(String date) {

		IncomeStatement IS = new IncomeStatement();
		DBConnectionUtil dbConnectionUtil = new DBConnectionUtil();
		@SuppressWarnings("static-access")
		Connection connection = dbConnectionUtil.getDBConnection();

		PreparedStatement preparedstatement = null;
		ResultSet resultset = null;

		String date1 = date;

		try {

			String sql = "select * from IncomeStatement where date1 LIKE  '%' +?+ '%'";
			
		
			preparedstatement = connection.prepareStatement(sql);
			preparedstatement.setString(1, date);
			resultset = preparedstatement.executeQuery();

			while (resultset.next()) {

				IS.setDate(resultset.getString("date1"));

				IS.setSalary(resultset.getFloat("Salary"));
				IS.setMaintance(resultset.getFloat("maintance"));
				IS.setElectricity(resultset.getFloat("electricity"));
				IS.setRent_expenses(resultset.getFloat("rent_expenses"));
				IS.setOther_expenses(resultset.getFloat("other_expenses"));

				IS.setRent_income(resultset.getFloat("Rent_income"));
				IS.setOther_income(resultset.getFloat("other_income"));

				IS.setTOTAL_INCOME(resultset.getFloat("TOTAL_INCOME"));
				IS.setTOTAL_Expense(resultset.getFloat("TOTAL_Expense"));

				IS.setProfit_loss(resultset.getFloat("profit_OR_loss"));
				

			}

		} catch (Exception e) {
			System.out.println(e);
		}

		if (IS.getDate() == null) {

			return null;
		} else {
			return IS;
		}

	}
}

//final bracket
