package com.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.NewEmployee;
import com.service.EmployeeImp;

/**
 * Servlet implementation class UpdateEmployee
 */
@WebServlet("/UpdateEmployee")
public class UpdateEmployee extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateEmployee() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
			EmployeeImp empimp=new EmployeeImp();
			NewEmployee emp=new NewEmployee();
			
			emp.setFirstName(request.getParameter("fname"));
			emp.setLastName(request.getParameter("lname"));
			emp.setEmpID(Integer.parseInt(request.getParameter("empid")));
			emp.setNIC(request.getParameter("nic"));
			emp.setAddress(request.getParameter("address"));
			emp.setPhoneNum(Integer.parseInt(request.getParameter("phone")));
			emp.setEmail(request.getParameter("email"));
			emp.setJobrole(request.getParameter("job"));
			emp.setBasicSal(Integer.parseInt(request.getParameter("bsal")));
			
			empimp.updateEmployee(emp);
			RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/Present_employees.jsp");
			dispatcher.forward(request, response);
	}

}
