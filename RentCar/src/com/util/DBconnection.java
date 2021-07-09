package com.util;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBconnection {
	
	
	//define database properties
	
		private static final String url="jdbc:sqlserver://localhost:1433;databaseName=master;";
		
		
		private static final String uname="ahmed";
		
		private static final String pass="ahmed";
		
		
		private static final String driver="com.microsoft.sqlserver.jdbc.SQLServerDriver";
		
		
		private static Connection connection=null;
		
		
		//define static method to get connection
		public static Connection openConnection(){
			
			//check the connection
			
			if(connection != null) {
				return connection;
			}
			else {
				try {
					
			//Load the driver
				Class.forName(driver);
			//Get the connection
				connection=DriverManager.getConnection(url, uname, pass);
				System.out.println("connected");
				
				}catch(Exception e) {
					e.printStackTrace();
					System.out.println("error");
				}
			// return the connection
			return connection;
		}
		
	}

}
