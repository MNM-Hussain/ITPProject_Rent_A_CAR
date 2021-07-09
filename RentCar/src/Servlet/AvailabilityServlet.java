package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Availability;
import service.IAvailability;
import service.IAvailabilityImp;

/**
 * Servlet implementation class Availability
 */
@WebServlet("/AvailabilityServlet")
public class AvailabilityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AvailabilityServlet() {
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
		Availability availability=new Availability();
		
		System.out.println("inside ");
		//availability.setRid(nt(request.getParameter("carid")));
		//availability.setStartDate(request.getAttribute("startdate").toString());
		availability.setEndDate(request.getParameter("endDate"));
		availability.setStartDate(request.getParameter("startdate"));
		
		availability.setCarID(request.getParameter("carid"));
		
		
		
		System.out.println("satrt date: "+request.getParameter("startdate"));
		
		IAvailability availabilityservice=new IAvailabilityImp();
		availabilityservice.insertAvailability(availability);

		//to capture the total amount and pass to payment page through sending customer page
		Float finalcost=Float.parseFloat(request.getParameter("finalcost"));
		
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/AddCustomerDetails.jsp?finalcost="+finalcost);
		dispatcher.forward(request, response);

		
	}

}
