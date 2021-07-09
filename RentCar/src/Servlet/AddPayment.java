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
 * Servlet implementation class AddPayment
 */
@WebServlet("/AddPayment")
public class AddPayment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddPayment() {
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

		// System.out.println("first1");

		// setting using setters of model class and getting that

		// casting

		 float totalpayment =Float.parseFloat(request.getParameter("Totalpayment"));
		 pm.setTotpay(totalpayment);

		// casting

		// int payID=Integer.parseInt(request.getParameter("payID"));
		// pm.setPayID(payID);

		pm.setPayType(request.getParameter("Paytype"));

		// System.out.println("final"+request.getParameter("Paytype"));
		pm.setHoldername(request.getParameter("Cardholdername"));

		// casting
		// int cardnumber=Integer.parseInt(request.getParameter("cnumber"));
		// pm.setCardnumber(cardnumber);

		pm.setCardnumber(request.getParameter("cnumber"));

		pm.setExpDate(request.getParameter("expire_date"));

		// casting
		int ccvnum = Integer.parseInt(request.getParameter("ccv"));
		pm.setCcv(ccvnum);

	//	pm.setCoupon(request.getParameter("couponcode"));

		// interface class object

		Ipayment IP = new Paymentservice();
		IP.insert(pm);

		// to move to next page

		
		
		request.setAttribute("value", "inserted");
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Payment.jsp");
		dispatcher.forward(request, response);

	}

}
