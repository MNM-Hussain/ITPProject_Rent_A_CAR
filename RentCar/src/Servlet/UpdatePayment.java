package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Paymentmodel;
import service.Ipayment;

import service.Paymentservice;

/**
 * Servlet implementation class UpdatePayment
 */
@WebServlet("/UpdatePayment")
public class UpdatePayment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdatePayment() {
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

		Paymentmodel pm = new Paymentmodel();

		int ccv = Integer.parseInt(request.getParameter("ccv"));
		pm.setCcv(ccv);
		
		 float totalpayment =Float.parseFloat(request.getParameter("Totalpayment"));
		 pm.setTotpay(totalpayment);

	//	String Paymenttype = request.getParameter("Paytype");
//		pm.setPayType(Paymenttype);

		//String cardholdername = request.getParameter("Cardholdername");
		//pm.setHoldername(cardholdername);

		// casting
		// int cardnumber = Integer.parseInt(request.getParameter("cnumber"));
		// pm.setCardnumber(cardnumber);

		//pm.setCardnumber(request.getParameter("cnumber"));

		//pm.setExpDate(request.getParameter("expire_date"));

		// casting

		//int ccv = Integer.parseInt(request.getParameter("ccv"));
		//pm.setCcv(ccv);

		//pm.setCoupon(request.getParameter("couponcode"));

		Ipayment Ip = new Paymentservice();
		Ip.updatePayment(pm);

		// System.out.println("payment"+request.getParameter("payamt"));

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ViewPayment.jsp");
		dispatcher.forward(request, response);

	}

}
