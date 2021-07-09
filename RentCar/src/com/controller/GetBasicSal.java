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
 * Servlet implementation class GetBasicSal
 */
@WebServlet("/GetBasicSal")
public class GetBasicSal extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetBasicSal() {
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
		String id=(request.getParameter("id"));
		 EmployeeImp empimp=new EmployeeImp();
		NewEmployee emp=new NewEmployee();
		 emp=empimp.getBasicSal(id);
		
		request.setAttribute("x",emp);
		
		RequestDispatcher dispatcher=getServletContext().getRequestDispatcher("/Add_Salary.jsp");
		dispatcher.forward(request, response);
		doGet(request, response);
	}

}
