package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.I_Inquiry;
import service.InquiryImp;




/**
 * Servlet implementation class DeleteInquiry
 */
@WebServlet("/DeleteInquiry")
public class DeleteInquiry extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteInquiry() {
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
		int inquiryID = Integer.parseInt(request.getParameter("inquiryID"));


		I_Inquiry i_inquiry = new InquiryImp();
		i_inquiry.removeInquiry(inquiryID);

		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/ViewInquiry.jsp");
		dispatcher.forward(request, response);
	}
	

}
