package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.IInventoryService;

import service.InventoryServiceimpl;

/**
 * Servlet implementation class DeleteInventoryServlet
 */
@WebServlet("/DeleteInventoryServlet")
public class DeleteInventoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteInventoryServlet() {
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
		
		
		
		
		String RateId = (String)request.getParameter("CarID");	
		
		IInventoryService iInventoryService = new InventoryServiceimpl();
		iInventoryService.removeInventory(RateId);
	
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/view_inventories.jsp");
		dispatcher.forward(request, response);
		
		
		
		
		
	}

}
