package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Model.Allocation;

import com.util.DBconnection;

public class AllocateDAOimpl implements AllocateDAO {

	
	Connection connection = null;
	ResultSet resultSet = null;
	Statement statement = null;
	PreparedStatement preparedStatement = null;
	@Override
	public List<Allocation> get() {
		List<Allocation> list = null;
		Allocation book = null;
		
		try {
			
			list = new ArrayList<Allocation>();
			String sql = "SELECT * FROM ALLOCATE";
			connection = DBconnection.openConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()) {
				book = new Allocation();
				book.setBookid(resultSet.getInt("bookid"));
				book.setPickuplocation(resultSet.getString("pickuplocation"));
				book.setPickupdate(resultSet.getString("pickupdate"));
				book.setReturndate(resultSet.getString("returndate"));
				
				book.setNoofperson(resultSet.getInt("noofperson"));
				book.setPickuptime(resultSet.getString("pickuptime"));
				book.setDriverid(resultSet.getInt("driverid"));
				book.setAllocationid(resultSet.getInt("allocationid"));
			
				
				
				
				list.add(book);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Allocation get(int allocationid) {
		Allocation book = null;
		try {
			book = new Allocation();
			String sql = "SELECT * FROM ALLOCATE where allocationid="+allocationid;
			connection = DBconnection.openConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);
			if(resultSet.next()) {
			
				book.setBookid(resultSet.getInt("bookid"));
				book.setPickuplocation(resultSet.getString("pickuplocation"));
				book.setPickupdate(resultSet.getString("pickupdate"));
				book.setReturndate(resultSet.getString("returndate"));
			
				book.setNoofperson(resultSet.getInt("noofperson"));
				book.setPickuptime(resultSet.getString("pickuptime"));
				book.setDriverid(resultSet.getInt("driverid"));
				book.setAllocationid(resultSet.getInt("allocationid"));
				
			
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return book;
	}

	@Override
	public boolean save(Allocation e) {
		boolean flag = false;
		try {
			String sql = "INSERT INTO ALLOCATE(pickuplocation, pickupdate,pickuptime,returndate,noofperson,driverid,bookid)VALUES"
					+ "('"+e.getPickuplocation()+"','"+e.getPickupdate()+"', '"+e.getPickuptime()+"', '"+e.getReturndate()+"','"+e.getNoofperson()+"','"+e.getDriverid()+"','"+e.getBookid()+"')";
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
	public boolean delete(int allocationid) {
		boolean flag = false;
		try {
			String sql = "DELETE FROM ALLOCATE where allocationid ="+allocationid;
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
	public boolean update(Allocation d) {
		boolean flag = false;
		try {
			String sql = "UPDATE ALLOCATE  SET driverid = '"+d.getDriverid()+"', "
					+ " bookid = '"+d.getBookid()+"', pickuplocation = '"+d.getPickuplocation()+"',pickupdate = '"+d.getPickupdate()+"',pickuptime = '"+d.getPickuptime()+"',returndate = '"+d.getReturndate()+"',noofperson = '"+d.getNoofperson()+"' where allocationid="+d.getAllocationid();
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
	public boolean savePast(Allocation e) {
		boolean flag = false;
		try {
			String sql = "INSERT INTO pALLOCATE(allocationid,pickuplocation, pickupdate,pickuptime,returndate,noofperson,driverid,bookid)VALUES"
					+ "('"+e.getAllocationid()+"','"+e.getPickuplocation()+"','"+e.getPickupdate()+"', '"+e.getPickuptime()+"', '"+e.getReturndate()+"','"+e.getNoofperson()+"','"+e.getDriverid()+"','"+e.getBookid()+"')";
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
	public List<Allocation> get1() {
		List<Allocation> list = null;
		Allocation book = null;
		
		try {
			
			list = new ArrayList<Allocation>();
			String sql = "SELECT * FROM pALLOCATE";
			connection = DBconnection.openConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()) {
				book = new Allocation();
				book.setBookid(resultSet.getInt("bookid"));
				book.setPickuplocation(resultSet.getString("pickuplocation"));
				book.setPickupdate(resultSet.getString("pickupdate"));
				book.setReturndate(resultSet.getString("returndate"));
				
				book.setNoofperson(resultSet.getInt("noofperson"));
				book.setPickuptime(resultSet.getString("pickuptime"));
				book.setDriverid(resultSet.getInt("driverid"));
				book.setAllocationid(resultSet.getInt("allocationid"));
			
				
				
				
				list.add(book);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public boolean updateStatus(int bookid) {
		boolean flag = false;
		try {
			String sql = "update RES set Status ='allocated' where bookid="+bookid;
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
