package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.NewEmployee;
import com.model.Salary;
import com.service.Employee;
import com.service.EmployeeImp;
import com.service.ISalary;
import com.service.SalaryImpl;

import service.IIncomeStatementService;
import service.IncomeStatementServiceimpl;

/**
 * Servlet implementation class AddSalary
 */
@WebServlet("/AddSalary")
public class AddSalary extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddSalary() {
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

		Salary salary = new Salary();

		System.out.println("salary1");
		
		salary.setNIC(request.getParameter("NIC"));
		salary.setDate(request.getParameter("date"));

		System.out.println("salary2");
		
		salary.setBasSal(Float.parseFloat(request.getParameter("basSal")));

		System.out.println("salary23333"+Float.parseFloat(request.getParameter("basSal")));
		
		salary.setAttendnce(Integer.parseInt(request.getParameter("attendance")));
		
		System.out.println("11111");
		
		salary.setEPF(Float.parseFloat(request.getParameter("EPF")));
		salary.setETF(Float.parseFloat(request.getParameter("ETF")));
		
		System.out.println("ahmed");
		salary.setNetSal(Float.parseFloat(request.getParameter("NetSal")));
		
	

		

		ISalary ISAL = new SalaryImpl();

		ISAL.addSalary(salary);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/EmployeeSalary.jsp");
		dispatcher.forward(request, response);

	}

}
