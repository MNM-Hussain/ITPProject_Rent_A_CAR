package Servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AddExpenseServlet
 */
@WebServlet("/AddExpenseServlet")
public class AddExpenseServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddExpenseServlet() {
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
		
		System.out.println("entered inside");
		
		int count=Integer.parseInt(request.getParameter("count"));
		System.out.println("count : "+count);
		
		String[] description =new String[10] ;
		int[] amount=new int[10];

		System.out.println("count1 : "+count);
		
//		description[i]=request.getParameter("description"+i);
//		 amount[]=Integer.parseInt(request.getParameter("amount"));
//		
		
		
		
		for(int i=0;i<count;i++){
			System.out.println("loop"+i);
			
			 description[i]=request.getParameter("description"+i);
			 amount[i]=Integer.parseInt(request.getParameter("amount"+i));
				
		}
		/////
		
		System.out.println("count2 : "+count);
		for(int i=0;i<count;i++){
				
			

			System.out.println("des"+description[i]);
			System.out.println("amt"+amount[i]);
			
			}
		
		///
		
		
		
		System.out.println("count3 : "+count);
		
		
		
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/input.jsp");
		dispatcher.forward(request, response);
		
	}

}
