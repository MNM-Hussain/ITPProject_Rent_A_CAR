package Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Availability_Driver;
import Model.Driver;
import service.AvailabilityDRIVER_impl;

/**
 * Servlet implementation class Availability_Driver_Servlet
 */
@WebServlet("/Availability_Driver_Servlet")
public class Availability_Driver_Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	RequestDispatcher dispatcher = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Availability_Driver_Servlet() {
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
		
		Availability_Driver availability=new Availability_Driver();
		availability.setEndDate(request.getParameter("endDate"));
		String endDATE = availability.getEndDate();
		availability.setStartDate(request.getParameter("startdate"));
		String StartDATE = availability.getStartDate();
		/* availability.setLisenceNUM(request.getParameter("lisenceNUM")); */
		
		
		
	System.out.println(StartDATE);
		
		AvailabilityDRIVER_impl availabilityservice=new AvailabilityDRIVER_impl();
		List<Driver> theList= availabilityservice.ListAvailability(StartDATE, endDATE);
		
		request.setAttribute("list", theList);
		
		dispatcher = request.getRequestDispatcher("/listDriverAvailability.jsp");
		
		dispatcher.forward(request, response);
	}

}
