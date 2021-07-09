package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Rates;

import service.IRateService;
import service.RateServiceimpl;

/**
 * Servlet implementation class UpdateRateServlet
 */
@WebServlet("/UpdateRateServlet")
public class UpdateRateServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateRateServlet() {
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
		doGet(request, response);
		
	
		
		Rates rates = new Rates();
		String RateId = request.getParameter("RateId");
		
		rates.setRateId(RateId);

		rates.setCategory(request.getParameter("VechileId"));
		rates.setAmount(request.getParameter("Amount"));

		IRateService iratesService = new RateServiceimpl();
		iratesService.updateRates(rates);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/Insert_Rates.jsp");
		dispatcher.forward(request, response);
		
	}

}
