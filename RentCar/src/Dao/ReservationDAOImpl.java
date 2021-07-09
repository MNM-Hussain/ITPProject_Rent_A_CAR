package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import Entity.Reservation;
import util.DBConnectionUtil;

public class ReservationDAOImpl implements ReservationDAO {

	Connection connection = null;
	Statement statement = null;
	ResultSet resultset = null;
	PreparedStatement preparedStatement = null;

	@Override
	public List<Reservation> get() {

		System.out.println("DAO");

		List<Reservation> list = null;
		Reservation reservation = null;

		try {
			list = new ArrayList<Reservation>();

			// create sql query
			String sql = "SELECT * FROM Reservation";

			// get db connection
			connection = DBConnectionUtil.getDBConnection();

			// create a statement
			statement = connection.createStatement();

			// execute sql query
			resultset = statement.executeQuery(sql);

			while (resultset.next()) {
				reservation = new Reservation();
				reservation.setRid(resultset.getInt("rid"));
				reservation.setTime1(resultset.getString("time1"));
				reservation.setLocation(resultset.getString("location"));
				reservation.setPickupdate(resultset.getString("pickupdate"));
				reservation.setReturndate(resultset.getString("returndate"));
			//	reservation.setNumofdays(resultset.getString("numofdays"));
				reservation.setNumofpassengers(resultset.getString("numofpassengers"));
				list.add(reservation);

			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		// reutn the list
		return list;
	}

	@Override
	public boolean save(Reservation r) {
		boolean flag = false;
		try {
			String sql = "insert into Reservation(location,time1,pickupdate,returndate,numofpassengers) values "
					+ " ('" + r.getLocation() + "','" + r.getTime1() + "','" + r.getPickupdate() + "','"
					+ r.getReturndate() + "','" + r.getNumofpassengers() + "')";
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			flag = true;
		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		return flag;

	}

	@Override
	public Reservation get(int rid) {
		Reservation r = null;

		try {
			r = new Reservation();
			String sql = "SELECT * FROM Reservation where rid=" + rid;
			connection = DBConnectionUtil.getDBConnection();
			statement = connection.createStatement();
			resultset = statement.executeQuery(sql);
			while (resultset.next()) {

				r.setRid(resultset.getInt("rid"));
				r.setLocation(resultset.getString("location"));
				r.setTime1(resultset.getString("time1"));
				r.setPickupdate(resultset.getString("pickupdate"));
				r.setReturndate(resultset.getString("returndate"));
//				r.setNumofdays(resultset.getString("numofdays"));
				r.setNumofpassengers(resultset.getString("numofpassengers"));

			}

		} catch (SQLException ex) {
			ex.printStackTrace();
		}
		System.out.println("location :" + r.getLocation());
		return r;
	}


	@Override
	public boolean update(Reservation r) {
		boolean flag = false;
		try {  
			String sql = "UPDATE Reservation set location='"+r.getLocation()+"',time1='"+r.getTime1()+"',pickupdate='"+r.getPickupdate()+"',returndate='"+r.getReturndate()+"',numofpassengers='"+r.getNumofpassengers()+"'where rid="+r.getRid();       
			connection = DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			flag = true;
		}catch (SQLException ex) {
			ex.printStackTrace();
		}
		return  flag;
	}
	
	
	@Override
	public boolean delete(int rid) {
		boolean flag = false;
		try {
			String sql = "DELETE FROM Reservation where rid="+rid;
			connection= DBConnectionUtil.getDBConnection();
			preparedStatement = connection.prepareStatement(sql);
			preparedStatement.executeUpdate();
			flag = true;
			
		}catch(SQLException e) {
			e.printStackTrace();
		}
		return flag;
	}

}
