package service;

import java.util.List;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;


import com.util.*;
import Model.Book;


public class ResDAOimpl implements ResDAO {

	Connection connection = null;
	ResultSet resultSet = null;
	Statement statement = null;
	PreparedStatement preparedStatement = null;

	@Override
	public List<Book> get() {
		List<Book> list = null;
		Book book = null;
		
		try {
			
			list = new ArrayList<Book>();
			String sql = "SELECT * FROM RES";
			connection = DBconnection.openConnection();
			statement = connection.createStatement();
			resultSet = statement.executeQuery(sql);
			while(resultSet.next()) {
				book = new Book();
				book.setBookid(resultSet.getInt("bookid"));
				book.setPickuplocation(resultSet.getString("pickuplocation"));
				book.setPickupdate(resultSet.getString("pickupdate"));
				book.setReturndate(resultSet.getString("returndate"));
				
				book.setNoofperson(resultSet.getInt("noofperson"));
				book.setPickuptime(resultSet.getString("pickuptime"));
				book.setStatus(resultSet.getString("Status"));
				
				list.add(book);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public Book get(int bookid) {
		Book book = null;
		try {
			book = new Book();
			String sql = "SELECT * FROM RES where bookid="+bookid;
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
				book.setStatus(resultSet.getString("Status"));
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return book;
	}

	@Override
	public boolean save(Book e) {
		boolean flag = false;
		try {
			String sql = "INSERT INTO RES(pickuplocation, pickupdate,pickuptime,returndate,noofperson)VALUES"
					+ "('"+e.getPickuplocation()+"','"+e.getPickupdate()+"', '"+e.getPickuptime()+"', '"+e.getReturndate()+"','"+e.getNoofperson()+"')";
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
	public boolean delete(int bookid) {
		boolean flag = false;
		try {
			String sql = "DELETE FROM RES where bookid="+bookid;
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
	public boolean update(Book book) {
		// TODO Auto-generated method stub
		return false;
	}

}
