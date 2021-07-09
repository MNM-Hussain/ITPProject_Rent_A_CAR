package service;

import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.util.DBconnection;

import Model.Availability_Driver;
import Model.Driver;
import util.DBConnectionUtil;

public class AvailabilityDRIVER_impl implements AvailabilityDRIVER_INTERFACE {

	private PreparedStatement preparedStatement;

	private static Connection connection;

	Statement statement;
	
	FileInputStream fs=null;
	
	private ResultSet resultset;
	@Override
	public void insertAvailability(Availability_Driver availability) {
	
		try {
			String sql="insert into AvailabilityDRIVER (pickupdate,returndate,driverid,bookid) values(?,?,?,?)";
			
			connection = DBConnectionUtil.getDBConnection();		
			preparedStatement = connection.prepareStatement(sql);

			//preparedStatement.setInt(1,availability.getRid());
			preparedStatement.setString(1,availability.getStartDate());
			preparedStatement.setString(2,availability.getEndDate());
			preparedStatement.setInt(3,availability.getLisenceNUM());
			preparedStatement.setInt(4,availability.getBookid());
			
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
	@Override
	public List<Driver> ListAvailability(String startDate, String endDate) {
	
		List<Driver> list = null;
		Driver driver = null;
		
		try {
			
			list = new ArrayList<Driver>();
			String sql = "select * from driver where driverid NOT IN (select driverid from AvailabilityDRIVER where (pickupdate BETWEEN '"+startDate+"' AND '" +endDate +"') OR (returndate BETWEEN '"+startDate +"' AND '"+endDate +"'))";
			connection = DBconnection.openConnection();
			statement = connection.createStatement();
			resultset = statement.executeQuery(sql);
			while(resultset.next()) {
				driver = new Driver();
				driver.setDriverid(resultset.getInt("driverid"));
				driver.setName(resultset.getString("name"));
				driver.setEmail(resultset.getString("email"));
				driver.setAddress(resultset.getString("address"));
				driver.setDob(resultset.getString("dob"));
				driver.setMobile(resultset.getString("mobile"));
				driver.setLicence_num(resultset.getString("licence_num"));
				driver.setSalary(resultset.getFloat("salary"));
				
				
				
				list.add(driver);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
		
	}
	
	
	
	public boolean delete(int bookid) {
		boolean flag = false;
		try {
			String sql = "DELETE FROM AvailabilityDRIVER where bookid="+bookid;
			connection = DBconnection.openConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			flag = true;
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}
	}


