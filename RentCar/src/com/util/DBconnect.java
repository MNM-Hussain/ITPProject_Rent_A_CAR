package com.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBconnect {
	
	public static Connection connection;
 
	public static Connection initializeddb() throws ClassNotFoundException,SQLException {
		if(connection==null || connection.isClosed()) {
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			String url="jdbc:sqlserver://localhost:1433;databaseName=master";
			connection=DriverManager.getConnection(url,"ahmed","ahmed");
		}
		
		return connection;
	}
	

}
