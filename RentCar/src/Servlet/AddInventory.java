package Servlet;

import java.io.File;

import java.io.IOException;
import java.io.InputStream;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import Model.Inventory;
import service.IInventoryService;
import service.InventoryServiceimpl;

/**
 * Servlet implementation class AddInventory
 */
@WebServlet("/AddInventory")
@MultipartConfig
public class AddInventory extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddInventory() {
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
		Inventory inventory=new Inventory();
		
		
		Part image = request.getPart("image");
		InputStream inputStream = image.getInputStream();
		inventory.setCarID(request.getParameter("cardid"));
		inventory.setModel(request.getParameter("model"));
		inventory.setCategory(request.getParameter("category"));
		inventory.setSupplierID(request.getParameter("supid"));
		inventory.setDescription(request.getParameter("description"));
		inventory.setNoOfPassengers(Integer.parseInt(request.getParameter("noOfpass")));
		inventory.setUrl(request.getParameter("url"));
		inventory.setImage(inputStream);
	
		
		IInventoryService inventoryService=new InventoryServiceimpl();
		inventoryService.insertInventory(inventory);

		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/view_inventories.jsp?id="+"2020");
		dispatcher.forward(request, response);
	}

}
