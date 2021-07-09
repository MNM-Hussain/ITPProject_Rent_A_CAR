package Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Allocation;
import Model.Availability_Driver;
import service.AllocateDAO;
import service.AllocateDAOimpl;
import service.AvailabilityDRIVER_impl;


/**
 * Servlet implementation class AllocationControler
 */
@WebServlet("/AllocationControler")
public class AllocationControler extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	RequestDispatcher dispatcher = null;
	AllocateDAO bookDAO = null;
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AllocationControler() {
        
    	bookDAO = new AllocateDAOimpl();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");
		
		if(action == null) {
			action = "LIST";
		}
		
		switch(action) {
			
			case "LIST":
				listEvent(request, response);
				break;
				
			case "EDIT":
				getSingleEvent(request, response);
				break;
				
			case "DELETE":
				deleteEvent(request, response);
				break;
				
			case "DELETE1":
				deleteEvent1(request, response);
				break;
				
			case "past":
				listEvent1(request, response);
				break;
				
			
				
			default:
				listEvent(request, response);
				break;
				
		}
	}
	
	// delete event
	private void deleteEvent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			
			String allocationid = request.getParameter("allocationid");
		
			if(bookDAO.delete(Integer.parseInt(allocationid))) {
				request.setAttribute("NOTIFICATION", "Reservation Deleted Successfully!");
			}
			
			listEvent(request, response);
		}
	
	private void deleteEvent1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		Allocation e = new Allocation();
		String allocationid = request.getParameter("allocationid");
		System.out.println(allocationid);
	    String bookid =request.getParameter("bookid");
	   
	
	    
	    e.setAllocationid(Integer.parseInt(request.getParameter("allocationid")));
	    e.setBookid(Integer.parseInt(request.getParameter("bookid")));
		e.setPickuplocation(request.getParameter("pickuplocation"));
		e.setPickupdate(request.getParameter("pickupdate"));
		e.setPickuptime(request.getParameter("pickuptime"));
		e.setReturndate(request.getParameter("returndate"));
		
		e.setNoofperson(Integer.parseInt(request.getParameter("noofperson")));
		e.setDriverid(Integer.parseInt(request.getParameter("driverid")));
		
	    
		if(bookDAO.delete(Integer.parseInt(allocationid))) {
			request.setAttribute("NOTIFICATION", "ALLocation Deleted Successfully!");
			
			  AvailabilityDRIVER_impl availabilityservice=new AvailabilityDRIVER_impl();
			  availabilityservice.delete(Integer.parseInt(bookid));
			  
			if(  bookDAO.savePast(e)) {
				request.setAttribute("NOTIFICATION1", "Deleted Allocation id   " +allocationid+ "  result saved on another table");
				
			}
			  
			  
			  
		
			
		}
		
		listEvent(request, response);
	}
	//get single record of an event
	private void getSingleEvent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		
		String allocationid = request.getParameter("allocationid");
		
		
		
		Allocation theEvent = bookDAO.get(Integer.parseInt(allocationid));
		
		request.setAttribute("event1", theEvent);
		
		dispatcher = request.getRequestDispatcher("/work1.jsp");
		
		dispatcher.forward(request, response);
	}
	

	
	

	//list all event 
	private void listEvent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Allocation> theList = bookDAO.get();
		
		request.setAttribute("list", theList);
		
		dispatcher = request.getRequestDispatcher("/dashjsp.jsp");
		
		dispatcher.forward(request, response);
	}
	
	
private void listEvent1(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<Allocation> theList = bookDAO.get1();
		
		request.setAttribute("list", theList);
		
		dispatcher = request.getRequestDispatcher("/pastAllocation.jsp");
		
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
 		String allocationid = request.getParameter("allocationid");
 		String bookid =request.getParameter("bookid");
		
		Allocation e = new Allocation();
		e.setBookid(Integer.parseInt(request.getParameter("bookid")));
		e.setPickuplocation(request.getParameter("pickuplocation"));
		e.setPickupdate(request.getParameter("pickupdate"));
		e.setPickuptime(request.getParameter("pickuptime"));
		e.setReturndate(request.getParameter("returndate"));
	
		e.setNoofperson(Integer.parseInt(request.getParameter("noofperson")));
		e.setDriverid(Integer.parseInt(request.getParameter("driverid")));
		
		
		Availability_Driver av = new Availability_Driver();
		av.setStartDate(request.getParameter("pickupdate"));
		av.setEndDate(request.getParameter("returndate"));
		av.setLisenceNUM(Integer.parseInt(request.getParameter("driverid")));
		av.setBookid(Integer.parseInt(request.getParameter("bookid")));
		
		if(allocationid.isEmpty() || allocationid == null) {
			
			if(bookDAO.save(e)) {
				request.setAttribute("NOTIFICATION", "Allocation Saved Successfully!");
				AvailabilityDRIVER_impl availabilityservice=new AvailabilityDRIVER_impl();
				availabilityservice.insertAvailability(av);
				
				bookDAO.updateStatus(Integer.parseInt(bookid));
				
				System.out.println(bookid);
				
			}
			
			else {
				request.setAttribute("NOTIFICATION", "The INSERT statement conflicted with the FOREIGN KEY constraint \"FK__ALLOCATE__driver__267ABA7A\n The conflict occurred in database \"rentacar\", table \"dbo.driver\", column 'driverid'\n given driver is not available in driver database ");
			}
		
		}else {
			
			e.setAllocationid(Integer.parseInt(allocationid));
			if(bookDAO.update(e)) {
				request.setAttribute("NOTIFICATION", "Allocation updated succesfully !");
			}
			
		}
		
		listEvent(request, response);
	}
	}


