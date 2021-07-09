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

import Model.Paymentmodel;
import util.DBConnectionUtil;

/**
 * Servlet implementation class GetPayment
 */
@WebServlet("/GetPayment")
public class GetPayment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public GetPayment() {
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

	public Paymentmodel get_values_from_Payment(String ccv) {

		DBConnectionUtil obj_DB_Connection = new DBConnectionUtil();

		@SuppressWarnings("static-access")
		Connection connection = obj_DB_Connection.getDBConnection();
		PreparedStatement ps = null;
		ResultSet resultset = null;

		Paymentmodel pm = new Paymentmodel();

		try {

//small change
			
			System.out.println("payemnt id inside  getpayment"+ccv);

			//String query = "select* from Payment where payID=?";
			String query="select p.Totalpayment,p.paytype,p.Cardholdername,p.cnumber,p.expire_date,p.ccv,r.rid from Payment p, Reservation r where r.rid=p.bookingRef and p.ccv=?";

			//System.out.println("payemnt id inside  getpayment   atr"+payID);
			
			ps = connection.prepareStatement(query);
			ps.setString(1, ccv);
			resultset = ps.executeQuery();

			while (resultset.next()) {
			
				pm.setTotpay(resultset.getFloat("Totalpayment"));
				pm.setPayType(resultset.getString("Paytype"));
				pm.setHoldername(resultset.getString("Cardholdername"));
				pm.setCardnumber(resultset.getString("cnumber"));

				pm.setExpDate(resultset.getString("expire_date"));
				pm.setCcv(resultset.getInt("ccv"));
				pm.setBid(resultset.getInt("rid"));
				//pm.setCoupon(resultset.getString("couponcode"));

			}

		} catch (Exception e) {
			System.out.println(e);
		}

		return pm;

	}

}
