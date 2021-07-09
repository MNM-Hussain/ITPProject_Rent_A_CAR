package Servlet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import service.LoginDao;

import java.io.IOException;
import java.io.PrintWriter;


/**
 * Servlet implementation class LoginValidationServlet1
 */
@WebServlet("/LoginValidationServlet1")
public class LoginValidationServlet1 extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginValidationServlet1() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @param out
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String name1 = request.getParameter("name");
		String password = request.getParameter("password");

		PrintWriter out = response.getWriter();

		LoginDao dao = new LoginDao();

		Boolean condition = dao.check(name1, password);

	
		 if (condition.equals(true)) {

			HttpSession session = request.getSession();
			session.setAttribute("name", name1);
			
						if(name1.equals("ahmed")) {
							out.println("<script type=\"text/javascript\">");
							   out.println("alert('Welcome');");
							   out.println("location='View_IncomeStatement.jsp';");
							   out.println("</script>");
							
						}
						else if(name1.equals("madula")) {
							out.println("<script type=\"text/javascript\">");
							   out.println("alert('Welcome');");
							   out.println("location='Present_employees.jsp';");
							   out.println("</script>");
							
						}
						else if(name1.equals("ikshu")) {
							out.println("<script type=\"text/javascript\">");
							   out.println("alert('Welcome');");
							   out.println("location='view_inventories.jsp';");
							   out.println("</script>");
							
						}
						else if(name1.equals("lakshi")) {
							out.println("<script type=\"text/javascript\">");
							   out.println("alert('Welcome');");
							   out.println("location='AdminViewCustomer.jsp';");
							   out.println("</script>");
							
						}
						else if(name1.equals("hussain")) {
							out.println("<script type=\"text/javascript\">");
							   out.println("alert('Welcome');");
							   out.println("location='ViewSupplier.jsp';");
							   out.println("</script>");
							
						}
						else if(name1.equals("janany")) {
							out.println("<script type=\"text/javascript\">");
							   out.println("alert('Welcome');");
							   out.println("location='ViewMaintenance.jsp';");
							   out.println("</script>");
							
						}
						else if(name1.equals("aagash")) {
							out.println("<script type=\"text/javascript\">");
							   out.println("alert('Welcome');");
							   out.println("location='BookControler';");
							   out.println("</script>");
							
						}
						else if(name1.equals("saajid")) {
							out.println("<script type=\"text/javascript\">");
							   out.println("alert('Welcome');");
							   out.println("location='ReservationController';");
							   out.println("</script>");
							
						}
				
						
						
			
			
			
	

		} else {
			
			out.println("<script type=\"text/javascript\">");
			   out.println("alert('User name or password incorrect');");
			   out.println("location='Adminlogin.jsp';");
			   out.println("</script>");

		//	RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/login.jsp");
		//dispatcher.forward(request, response);

		}

	}

}
