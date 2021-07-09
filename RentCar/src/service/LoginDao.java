package service;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;





public class LoginDao {
	
	

	String sql ="select * from Admin where Name=? and password=?";
	
	public boolean  check (String name, String password)
	{
		try {
				
		
	
		
		
		
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		Connection con = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=master","ahmed","ahmed");
		
		
		PreparedStatement ps =con.prepareStatement(sql);
		
		ps.setString(1,name);
		ps.setString(2,password);
		
		ResultSet rs = ps.executeQuery();
		
		if(rs.next())
		{
			return true;
			
	
		}
		
		}catch(Exception e)
		{}
		
		return false;
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
