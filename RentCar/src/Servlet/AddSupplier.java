package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Suppliermodel;
import service.Isupplier;
import service.Supplierservice;

/**
 * Servlet implementation class AddSupplier
 */
@WebServlet("/AddSupplier")
public class AddSupplier extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddSupplier() {
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

		Suppliermodel sm = new Suppliermodel();

		// setting using setters of model class and getting that
		//in the parameter the values are which is in input field name

		sm.setName(request.getParameter("fullname"));
		sm.setEmail(request.getParameter("emailaddress"));
		sm.setVeh_name(request.getParameter("vehiclename"));
		sm.setVeh_mod(request.getParameter("moduleNum"));
		sm.setContactno(request.getParameter("ContactNumber"));
		sm.setAddress(request.getParameter("supAddress"));
		sm.setRentperiod(request.getParameter("rentperiod"));

		// System.out.println("before"+request.getParameter("fullname"));

		// casting
		float payment = Float.parseFloat(request.getParameter("payamt"));
		sm.setPay_amt(payment);

		// interface class object

		Isupplier Is = new Supplierservice();
		Is.insert(sm);

		// System.out.println("final"+request.getParameter("fullname"));

		// to move to next page

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ViewSupplier.jsp");
		dispatcher.forward(request, response);

	}

}
