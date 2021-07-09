package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import Model.Driver;
import com.util.DBconnection;

public class DriverDaoimpl implements DriverDao {

	
	Connection connection = null;
	ResultSet resultSet = null;
	Statement statement = null;
	PreparedStatement preparedStatement = null;
	@Override
	public List<Driver> get() {
		List<Driver> list = null;
		Driver driver = null;
		
		try {
			
			list = new ArrayList<Driver>();
			String sql = "select * from driver";
			connection = DBconnection.openConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()) {
				driver = new Driver();
				driver.setDriverid(resultSet.getInt("driverid"));
				driver.setName(resultSet.getString("name"));
				driver.setEmail(resultSet.getString("email"));
				driver.setAddress(resultSet.getString("address"));
				driver.setDob(resultSet.getString("dob"));
				driver.setMobile(resultSet.getString("mobile"));
				driver.setLicence_num(resultSet.getString("licence_num"));
				driver.setSalary(resultSet.getFloat("salary"));
				
				
				list.add(driver);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Driver get(int driverid) {
		Driver driver = null;
		try {
			driver = new Driver();
			String sql = "SELECT * FROM driver where driverid ="+driverid;
			connection = DBconnection.openConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);
			if(resultSet.next()) {
				driver.setDriverid(resultSet.getInt("driverid"));
				driver.setName(resultSet.getString("name"));
				driver.setEmail(resultSet.getString("email"));
				driver.setAddress(resultSet.getString("address"));
				driver.setDob(resultSet.getString("dob"));
				driver.setMobile(resultSet.getString("mobile"));
				driver.setLicence_num(resultSet.getString("licence_num"));
				driver.setSalary(resultSet.getFloat("salary"));
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return driver;
	}

	@Override
	public boolean save(Driver d) {
		boolean flag = false;
		try {
			String sql = "INSERT INTO driver(name, address,email,licence_num,dob,mobile,salary)VALUES"
					+ "('"+d.getName()+"','"+d.getAddress()+"', '"+d.getEmail()+"', '"+d.getLicence_num()+"','"+d.getDob()+"','"+d.getMobile()+"','"+d.getSalary()+"')";
			connection = DBconnection.openConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			flag = true;
		}catch(SQLException ex) {
			ex.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean delete(int driverid) {
		boolean flag = false;
		try {
			String sql = "DELETE FROM driver where driverid="+driverid;
			connection = DBconnection.openConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			flag = true;
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public boolean update(Driver d) {
		boolean flag = false;
		try {
			String sql = "UPDATE driver  SET name = '"+d.getName()+"', "
					+ " address = '"+d.getAddress()+"', email = '"+d.getEmail()+"',mobile = '"+d.getMobile()+"',licence_num = '"+d.getLicence_num()+"',dob = '"+d.getDob()+"',salary = '"+d.getSalary()+"' where driverid="+d.getDriverid();
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
