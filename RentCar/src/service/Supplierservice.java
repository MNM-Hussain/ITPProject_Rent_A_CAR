package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Model.Suppliermodel;
import util.DBConnectionUtil;

public class Supplierservice implements Isupplier {

	private ResultSet resultset;

	// *******************************************insert******************************************
	@Override
	public void insert(Suppliermodel sm) {
		// TODO Auto-generated method stub
		System.out.println("service");

		DBConnectionUtil obj_DB_Connection = new DBConnectionUtil();
		Connection connection = obj_DB_Connection.getDBConnection();
		PreparedStatement ps = null;

		try {
			String query = "insert into  Supplier(fullname,emailaddress,vehiclename,moduleNum,ContactNumber,supAddress,rentperiod,payamt) values(?,?,?,?,?,?,?,?)";
			ps = connection.prepareStatement(query);

			ps.setString(1, sm.getName());
			ps.setString(2, sm.getEmail());
			ps.setString(3, sm.getVeh_name());
			ps.setString(4, sm.getVeh_mod());
			ps.setString(5, sm.getContactno());
			ps.setString(6, sm.getAddress());
			ps.setString(7, sm.getRentperiod());
			ps.setFloat(8, sm.getPay_amt());

			// close
			ps.executeUpdate();
			connection.commit();

		} catch (Exception e) {
			System.out.println(e);
		}

		finally {
			/*
			 * Close prepared statement and database connectivity at the end of transaction
			 */
			try {
				if (ps != null) {
					ps.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {

			}

		}

	}

	// *********************Retrieve supplier Details from supplier
	// table***********************************************

	@Override
	public ArrayList<Suppliermodel> get_supplier_details() {
		// TODO Auto-generated method stub

		DBConnectionUtil obj_DB_Connection = new DBConnectionUtil();
		Connection connection = obj_DB_Connection.getDBConnection();
		PreparedStatement ps = null;

		ArrayList<Suppliermodel> arraylist = new ArrayList<>();

		try {

			String query = "select* from Supplier";
			ps = connection.prepareStatement(query);
			resultset = ps.executeQuery();

			while (resultset.next()) {

				Suppliermodel sm = new Suppliermodel();

				sm.setSuppID(resultset.getInt("SuppID"));
				sm.setName(resultset.getString("fullname"));
				sm.setEmail(resultset.getString("emailaddress"));
				sm.setVeh_name(resultset.getString("vehiclename"));
				sm.setVeh_mod(resultset.getString("moduleNum"));
				sm.setContactno(resultset.getString("ContactNumber"));
				sm.setAddress(resultset.getString("supAddress"));
				sm.setRentperiod(resultset.getString("rentperiod"));
				sm.setPay_amt(resultset.getFloat("payamt"));
				sm.setDate_current(resultset.getString("datecurrent"));

				arraylist.add(sm);

			}

		} catch (Exception e) {

			System.out.println(e);
		} finally {
			/*
			 * Close prepared statement and database connectivity at the end of transaction
			 */
			try {
				if (ps != null) {
					ps.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {

			}
		}

		return arraylist;

	}

//***********************************update**********************************************************************

	@Override
	public void updateSupplier(Suppliermodel sm) {
		// TODO Auto-generated method stub

		DBConnectionUtil obj_DB_Connection = new DBConnectionUtil();
		Connection connection = obj_DB_Connection.getDBConnection();
		PreparedStatement ps = null;

		try {

			String query = "update Supplier set fullname=?, emailaddress=?,vehiclename=?,moduleNum=?,ContactNumber=?,supAddress=?,rentperiod=?,payamt=? where SuppID=?";

			ps = connection.prepareStatement(query);

			ps.setString(1, sm.getName());

			ps.setString(2, sm.getEmail());
			ps.setString(3, sm.getVeh_name());
			ps.setString(4, sm.getVeh_mod());
			ps.setString(5, sm.getContactno());
			ps.setString(6, sm.getAddress());
			ps.setString(7, sm.getRentperiod());
			ps.setFloat(8, sm.getPay_amt());

			ps.setInt(9, sm.getSuppID());
			
			

			System.out.println("name: " + sm.getName());
			System.out.println("email: " + sm.getEmail());
			System.out.println("veh_name: " + sm.getVeh_name());
			System.out.println("veh_mod: " + sm.getVeh_mod());
			System.out.println("contactno: " + sm.getContactno());
			System.out.println("address: " + sm.getAddress());
			System.out.println("rentperiod: " + sm.getRentperiod());
			System.out.println("pay_amt: " + sm.getPay_amt());
			
			
	
			
			

			ps.executeUpdate();

		} catch (Exception e) {

			System.out.println(e);
		} finally {
			/*
			 * Close prepared statement and database connectivity at the end of transaction
			 */
			try {
				if (ps != null) {
					ps.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {

			}
		}
	}

//**********************************************delete**********************************************

	@Override
	public void removeSupplier(int SuppID) {
		// TODO Auto-generated method stub

		DBConnectionUtil obj_DB_Connection = new DBConnectionUtil();
		Connection connection = obj_DB_Connection.getDBConnection();
		PreparedStatement ps = null;

		// System.out.println("ddddd"+SuppID);

		try {

			String query = "Delete   from Supplier where SuppID=?";
			ps = connection.prepareStatement(query);

			ps.setInt(1, SuppID);

			ps.executeUpdate();

		} catch (Exception e) {

			System.out.println(e);
		} finally {
			/*
			 * Close prepared statement and database connectivity at the end of transaction
			 */
			try {
				if (ps != null) {
					ps.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {

			}
		}

	}

}
