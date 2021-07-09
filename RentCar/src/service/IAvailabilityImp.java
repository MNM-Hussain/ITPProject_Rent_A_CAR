package service;

import java.beans.Statement;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Model.Availability;
import util.DBConnectionUtil;

public class IAvailabilityImp implements IAvailability {


	private PreparedStatement preparedStatement;

	private static Connection connection;

	Statement statement;
	
	FileInputStream fs=null;
	
	private ResultSet resultset;

	@Override
	public void insertAvailability(Availability availability) {
		try {
			String sql="insert into Availability (pickupdate,returndate,carID) values(?,?,?)";
			
			connection = DBConnectionUtil.getDBConnection();		
			preparedStatement = connection.prepareStatement(sql);

			//preparedStatement.setInt(1,availability.getRid());
			preparedStatement.setString(1,availability.getStartDate());
			preparedStatement.setString(2,availability.getEndDate());
			preparedStatement.setString(3,availability.getCarID());
			
			boolean sc=preparedStatement.execute();
			if(sc)
				System.out.println("insert successfully");
			else
				System.out.println("not successfull");
			connection.commit();
			
		
		} catch(Exception e) {
			e.printStackTrace();
		
		}

	}
}
