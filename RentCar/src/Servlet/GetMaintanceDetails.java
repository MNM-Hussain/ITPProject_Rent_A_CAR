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


import Model.RepairAndMaintenance;
import util.DBConnectionUtil;

/**
 * Servlet implementation class GetMaintanceDetails
 */
@WebServlet("/GetMaintanceDetails")
public class GetMaintanceDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetMaintanceDetails() {
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

	public RepairAndMaintenance get_values_of_Maintance(String End_Date) {

		RepairAndMaintenance repairandmaintenance = new RepairAndMaintenance();
		DBConnectionUtil dbConnectionUtil = new DBConnectionUtil();
		@SuppressWarnings("static-access")
		Connection connection = dbConnectionUtil.getDBConnection();

		PreparedStatement preparedstatement = null;
		ResultSet resultset = null;

	

		try {

			String sql = "select * from maintenance where End_Date LIKE ? ";

			preparedstatement = connection.prepareStatement(sql);
			preparedstatement.setString(1, "%"+End_Date+"%");
			resultset = preparedstatement.executeQuery();

			while (resultset.next()) {

				
				repairandmaintenance.setEnd_Date(resultset.getString("End_Date"));
				
				repairandmaintenance.setVehicleID(resultset.getString("VehicleID"));
				repairandmaintenance.setRepairID(resultset.getString("RepairID"));
				repairandmaintenance.setStart_Date(resultset.getString("Start_Date"));
				
				repairandmaintenance.setDescription(resultset.getString("Description"));
				repairandmaintenance.setMaintenance_Cost(resultset.getString("Maintenance_Cost"));

				

			}

		} catch (Exception e) {
			System.out.println(e);
		}

		if (repairandmaintenance.getEnd_Date() == null) {

			return null;
		} else {
			return repairandmaintenance;
		}

	}
}

//final bracket
