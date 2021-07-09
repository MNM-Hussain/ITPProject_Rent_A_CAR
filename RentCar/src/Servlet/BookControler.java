package Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Model.Book;

import service.ResDAO;
import service.ResDAOimpl;

/**
 * Servlet implementation class BookControler
 */
@WebServlet("/BookControler")
public class BookControler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	RequestDispatcher dispatcher = null;
	ResDAO bookDAO = null;
    public BookControler() {
        
    	bookDAO = new ResDAOimpl();
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
    					
    				case "Allocate job":
    					getSinglereservation(request, response);
    					break;
    					
    				default:
    					listEvent(request, response);
    					break;
    					
    			}
    			
    		}
    		// delete event
    	private void deleteEvent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    			
    			String bookid = request.getParameter("bookid");
    		
    			if(bookDAO.delete(Integer.parseInt(bookid))) {
    				request.setAttribute("NOTIFICATION", "Reservation Deleted Successfully!");
    			}
    			
    			listEvent(request, response);
    		}
    	//get single record of an event
    	private void getSingleEvent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    		
    		String bookid = request.getParameter("bookid");
    		
    		Book theEvent = bookDAO.get(Integer.parseInt(bookid));
    		
    		request.setAttribute("event", theEvent);
    		
    		dispatcher = request.getRequestDispatcher("/addwork.jsp");
    		
    		dispatcher.forward(request, response);
    	}
    	
private void getSinglereservation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    		
    		String bookid = request.getParameter("bookid");
    		
    		Book theEvent = bookDAO.get(Integer.parseInt(bookid));
    		
    		request.setAttribute("event", theEvent);
    		
    		dispatcher = request.getRequestDispatcher("/work.jsp");
    		
    		dispatcher.forward(request, response);
    	}
    	
    	

    	//list all event 
    	private void listEvent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		
    		List<Book> theList = bookDAO.get();
    		
    		request.setAttribute("list", theList);
    		
    		dispatcher = request.getRequestDispatcher("/dashbook.jsp");
    		
    		dispatcher.forward(request, response);
    	}
    		
    		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		String bookid = request.getParameter("bookid");
    			
    			Book e = new Book();
    			e.setPickuplocation(request.getParameter("pickuplocation"));
    			e.setPickupdate(request.getParameter("pickupdate"));
    			e.setPickuptime(request.getParameter("pickuptime"));
    			e.setReturndate(request.getParameter("returndate"));
    			
    			e.setNoofperson(Integer.parseInt(request.getParameter("noofperson")));
    			
    			
    			if(bookid.isEmpty() || bookid == null) {
    				
    				if(bookDAO.save(e)) {
    					request.setAttribute("NOTIFICATION", "Reservation Saved Successfully!");
    					request.setAttribute("startdate", e.getPickupdate());
    					
    					request.setAttribute("enddate", e.getReturndate());
    				}
    			
    			}else {
    				
    				e.setBookid(Integer.parseInt(bookid));
    				if(bookDAO.update(e)) {
    					request.setAttribute("NOTIFICATION", "Reservation update succesfully Updated Successfully!");
    				}
    				
    			}
    			
    			listEvent(request, response);
    		}
    		}


