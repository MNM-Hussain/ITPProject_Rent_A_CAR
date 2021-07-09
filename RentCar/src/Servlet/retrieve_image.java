package Servlet;

import java.io.IOException;
import java.io.OutputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import util.DBConnectionUtil;

/**
 * Servlet implementation class retrieve_image
 */
@WebServlet("/retrieve_image")
public class retrieve_image extends HttpServlet {
	private static final long serialVersionUID = 1L;
       Connection con;
       PreparedStatement stat;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public retrieve_image() {
        super();
        // TODO Auto-generated constructor stub
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)  
            throws ServletException, IOException {  
        //response.setContentType("text/html;charset=UTF-8");  
        response.setContentType("image/jpg");  
        //PrintWriter out = response.getWriter();  
        Blob ePhoto = null;  
        byte[] rawBytes = null;  
        OutputStream ot = response.getOutputStream();  
        try {  
            /* 
             * TODO output your page here. You may use following sample code. 
             */  
            //byte[] rawBytes = null;  
            String id = request.getParameter("id");  
            
            con = DBConnectionUtil.getDBConnection();  
            stat = con.prepareStatement("select CarImage from inventory where carID=?");  
            stat.setString(1, id);  
            ResultSet rs = stat.executeQuery();  
            rs.next();  
             
           ePhoto=rs.getBlob(1);
           
            rawBytes = ePhoto.getBytes(1,(int)ePhoto.length());  
            ot.write(rawBytes);  
//           
            ot.flush();  
            stat.close();  
        } catch (Exception ex) {  
            System.out.println(ex.getMessage());  
        } finally {  
            try {  
                con.close();  
                ot.close();  
            } catch (Exception ex) {  
            }  
        }  
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
	}

}
