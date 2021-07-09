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

import Model.Suppliermodel;
import util.DBConnectionUtil;

/**
 * Servlet implementation class GetSupplier
 */
@WebServlet("/GetSupplier")
public class GetSupplier extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetSupplier() {
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

	public Suppliermodel get_values_from_Supplier(String SuppID) {

		// System.out.println("name"+name);

		DBConnectionUtil obj_DB_Connection = new DBConnectionUtil();

		@SuppressWarnings("static-access")
		Connection connection = obj_DB_Connection.getDBConnection();
		PreparedStatement ps = null;
		ResultSet resultset = null;

		// System.out.println("name"+name);

		Suppliermodel sm = new Suppliermodel();

		try {

			String query = "select* from Supplier where SuppID=?";

			ps = connection.prepareStatement(query);
			ps.setString(1, SuppID);
			resultset = ps.executeQuery();

			while (resultset.next()) {
				sm.setSuppID(resultset.getInt("SuppID"));
				sm.setName(resultset.getString("fullname"));
				sm.setEmail(resultset.getString("emailaddress"));
				sm.setVeh_name(resultset.getString("vehiclename"));
				sm.setVeh_mod(resultset.getString("moduleNum"));
				sm.setContactno(resultset.getString("ContactNumber"));
				sm.setAddress(resultset.getString("supAddress"));
				sm.setRentperiod(resultset.getString("rentperiod"));
				sm.setPay_amt(resultset.getFloat("payamt"));

			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return sm;

	}

}
