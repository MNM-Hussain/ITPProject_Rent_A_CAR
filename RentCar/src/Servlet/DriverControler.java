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
import Model.Driver;
import service.DriverDao;
import service.DriverDaoimpl;
import service.ResDAO;

/**
 * Servlet implementation class DriverControler
 */
@WebServlet("/DriverControler")
public class DriverControler extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	RequestDispatcher dispatcher = null;
	DriverDao driverdao = null;
    public DriverControler() {
        
    	driverdao = new DriverDaoimpl();
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
    					
    				case "ADDSAL":
    					getSinglesal(request, response);
    					break;
    					
    					
    					
    				case "DELETE":
    					deleteEvent(request, response);
    					break;
    					
    				
    					
    				default:
    					listEvent(request, response);
    					break;
    					
    			}
    			
    		}
    		// delete event
    	private void deleteEvent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    			
    			String driverid = request.getParameter("driverid");
    		
    			if(driverdao.delete(Integer.parseInt(driverid))) {
    				request.setAttribute("NOTIFICATION", "Driver deleted  Successfully!");
    			}
    			
    			listEvent(request, response);
    		}
    	//get single record of an event
    	private void getSingleEvent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    		
    		String driverid = request.getParameter("driverid");
    		
    		Driver theEvent = driverdao.get(Integer.parseInt(driverid));
    		
    		request.setAttribute("driver", theEvent);
    		
    		dispatcher = request.getRequestDispatcher("/changedriver.jsp");
    		
    		dispatcher.forward(request, response);
    	}
    	
    	//get single record of an event
    	private void getSinglesal(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
    		
    		String driverid = request.getParameter("driverid");
    		
    		Driver theEvent = driverdao.get(Integer.parseInt(driverid));
    		
    		request.setAttribute("driver", theEvent);
    		
    		dispatcher = request.getRequestDispatcher("/adddriversalary.jsp");
    		
    		dispatcher.forward(request, response);
    	}
    	

    	
    	

    	//list all event 
    	private void listEvent(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		
    		List<Driver> theList = driverdao.get();
    		
    		request.setAttribute("list", theList);
    		
    		dispatcher = request.getRequestDispatcher("/dashdriver.jsp");
    		
    		dispatcher.forward(request, response);
    	}
    		
    		protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    		String driverid = request.getParameter("driverid");
    			
    			Driver d = new Driver();
    			d.setName(request.getParameter("name"));
    			d.setAddress(request.getParameter("address"));
    			d.setEmail(request.getParameter("email"));
    			d.setDob(request.getParameter("dob"));
    			d.setMobile(request.getParameter("mobile"));
    			d.setLicence_num(request.getParameter("licence_num"));
    			
    			String LNUM =request.getParameter("licence_num");
    			d.setSalary(Float.parseFloat(request.getParameter("salary")));
    			
    			
    			
    			if(driverid.isEmpty() || driverid == null) {
    				
    				if(driverdao.save(d)) {
    					request.setAttribute("NOTIFICATION", " New driver added to the system");
    					
    				}
    				else {
    					request.setAttribute("NOTIFICATION", "INSERT STATEMENT FAILED Licence number must be UNIQUE "+LNUM+" Already in the system");
    				}
    			
    			}else {
    				
    				d.setDriverid(Integer.parseInt(driverid));
    				if(driverdao.update(d)) {
    					request.setAttribute("NOTIFICATION", "Driver details  Updated Successfully!");
    				}
    				
    			}
    			
    			listEvent(request, response);
    		}
    		}


