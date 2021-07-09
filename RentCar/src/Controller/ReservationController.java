package Controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Dao.ReservationDAO;
import Dao.ReservationDAOImpl;
import Entity.Reservation;
import Model.Book;
import service.ResDAO;
import service.ResDAOimpl;

@WebServlet("/ReservationController")
public class ReservationController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	RequestDispatcher dispatcher = null;

	// create a ref variable to reservation dao
	ReservationDAO reservationdao = null;

	// create constructor and initialze reservation dao
	public ReservationController() {
		reservationdao = new ReservationDAOImpl();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String action = request.getParameter("action");

		if (action == null) {
			action = "LIST";
		}
		switch (action) {
		case "LIST":
			listReservation(request, response);
			break;
			
		case "EDIT":
			getSingleReservation (request,response);
			break;
			
		case "DELETE":
			deleteReservation (request,response);
			break;
			
		default:
			listReservation(request,response);
			break;
			
		}

	}

	private void deleteReservation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String rid = request.getParameter("rid");
		if(reservationdao.delete(Integer.parseInt(rid))) {
			request.setAttribute("message", "Record has been deleted");
		}
		listReservation(request, response);
		
	}

	private void getSingleReservation(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String rid = request.getParameter("rid");
		Reservation reservation = reservationdao.get(Integer.parseInt(rid));
		
		request.setAttribute("reservation", reservation);
		 
		 dispatcher = request.getRequestDispatcher("add-reservation.jsp");
			dispatcher.forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String rid = request.getParameter("rid"); 
		String location = request.getParameter("location");
		String time1 = request.getParameter("time1");
		String pickupdate = request.getParameter("pickupdate");
		System.out.println("waa"+pickupdate);
		String returndate = request.getParameter("returndate");
		//String numofdays = request.getParameter("numofdays");
		String numofpassengers = request.getParameter("numofpassengers");
		
		

		Reservation r = new Reservation();
		
		
		r.setLocation(location);
		r.setTime1(time1);
		r.setPickupdate(pickupdate);
		r.setReturndate(returndate);
		//r.setNumofdays(numofdays);
		r.setNumofpassengers(numofpassengers);
		
		//agaash part
		
		Book e = new Book(); e.setPickuplocation(request.getParameter("location"));
		  e.setPickupdate(request.getParameter("pickupdate"));
		  e.setPickuptime(request.getParameter("time1"));
		  e.setReturndate(request.getParameter("returndate"));
		  
		  //System.out.println(sDate1);
		 

		e.setNoofperson(Integer.parseInt(request.getParameter("numofpassengers")));
		
		//end of agaash part
		
		if(rid.isEmpty() || rid==null) {
			if(reservationdao.save(r)) {
				request.setAttribute("message", "Saved successfully");
				request.setAttribute("startdate", r.getPickupdate());
			
				request.setAttribute("enddate", r.getReturndate());
				
				//agash
				ResDAO bookDAO = new ResDAOimpl();

				 bookDAO.save(e);
				//end
				
			}
		}else {

			r.setRid(Integer.parseInt(rid));

			if (reservationdao.update(r)) {
				request.setAttribute("message", "updated Successfully");
			}
			dispatcher = request.getRequestDispatcher("/dashbord.jsp");
			dispatcher.forward(request, response);
			//listReservation(request, response);
			
			
		}
		request.getRequestDispatcher("Product.jsp").forward(request, response);

	}

	public void listReservation(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		System.out.println("controller");
		// call dao method to get list of reservation
		List<Reservation> list = reservationdao.get();

		// add the reservations to request object
		request.setAttribute("list", list);

		dispatcher = request.getRequestDispatcher("/dashbord.jsp");
		dispatcher.forward(request, response);
	}

}
