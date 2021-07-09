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
 * Servlet implementation class UpdateSupplier
 */
@WebServlet("/UpdateSupplier")
public class UpdateSupplier extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateSupplier() {
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

		String name = request.getParameter("fullname");
		sm.setName(name);

		int SuppID = Integer.parseInt(request.getParameter("SuppID"));
		sm.setSuppID(SuppID);

		sm.setEmail(request.getParameter("emailaddress"));
		sm.setVeh_name(request.getParameter("vehiclename"));

		sm.setVeh_mod(request.getParameter("moduleNum"));
		sm.setContactno(request.getParameter("ContactNumber"));
		sm.setAddress(request.getParameter("supAddress"));
		sm.setRentperiod(request.getParameter("rentperiod"));

		// casting

		float payment = Float.parseFloat(request.getParameter("payamt"));
		sm.setPay_amt(payment);

		System.out.println("payment" + request.getParameter("payamt"));

		Isupplier Is = new Supplierservice();
		Is.updateSupplier(sm);

		System.out.println("payment" + request.getParameter("vehiclename"));

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ViewSupplier.jsp");
		dispatcher.forward(request, response);

	}

}
