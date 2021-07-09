package util;

import java.sql.Connection;
import java.sql.DriverManager;
import util.DBConnectionUtil;


public class DBConnectionUtil {
	
	

	@SuppressWarnings("static-access")
	public static void main(String[] args)
	{
		DBConnectionUtil dbConnectionUtil = new DBConnectionUtil();
		
		System.out.println(dbConnectionUtil.getDBConnection());
		
	}
	
	
	public static Connection getDBConnection()
	{
		Connection connection=null;	
		
		
		try {
			

		
			
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		connection = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=master","ahmed","ahmed");
		
		
		
		
		
		
		}catch(Exception e)
		 {
			System.out.println(e);
		 }
		
		return connection;
		
	}
	
	
	
	
	

}
