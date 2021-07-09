package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Model.Paymentmodel;

import util.DBConnectionUtil;

public class Paymentservice implements Ipayment {

	private ResultSet resultset;

	// *******************************************insert******************************************

	@Override
	public void insert(Paymentmodel pm) {
		// TODO Auto-generated method stub

		DBConnectionUtil obj_DB_Connection = new DBConnectionUtil();
		Connection connection = obj_DB_Connection.getDBConnection();
		PreparedStatement ps = null;

		try {
			String query = "insert into  Payment(Totalpayment,Paytype,Cardholdername,cnumber,expire_date,ccv) values(?,?,?,?,?,?)";
			ps = connection.prepareStatement(query);

			ps.setFloat(1, pm.getTotpay());
			ps.setString(2, pm.getPayType());
			ps.setString(3, pm.getHoldername());
			ps.setString(4, pm.getCardnumber());
			ps.setString(5, pm.getExpDate());
			ps.setInt(6, pm.getCcv());
			
			
			
			
			
			System.out.println("Totpay: " + pm.getTotpay());
			System.out.println("payType: " + pm.getPayType());
			System.out.println("holdername: " + pm.getHoldername());
			System.out.println("cardnumber: " + pm.getCardnumber());
			System.out.println("expDate: " + pm.getExpDate());
			System.out.println("ccv: " + pm.getCcv());
			
			
			


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

		// *********************Retrieve payment Details from
		// payment*****************************************
		// table***********************************************

	}

	@Override
	public ArrayList<Paymentmodel> get_payment_details() {
		// TODO Auto-generated method stub

		DBConnectionUtil obj_DB_Connection = new DBConnectionUtil();
		Connection connection = obj_DB_Connection.getDBConnection();
		PreparedStatement ps = null;

		ArrayList<Paymentmodel> arraylist = new ArrayList<>();

		try {

			//String query = "select* from Payment";
			
			String query="select p.Totalpayment,p.paytype,p.Cardholdername,p.cnumber,p.expire_date,p.ccv,r.rid,p.datecurrent from Payment p, Reservation r where r.rid=p.bookingRef";
			
			
			
			ps = connection.prepareStatement(query);
			resultset = ps.executeQuery();

			while (resultset.next()) {

				
				//db name is given in parameter
				Paymentmodel pm = new Paymentmodel();

		
				pm.setTotpay(resultset.getFloat("Totalpayment"));
				pm.setPayType(resultset.getString("Paytype"));
				pm.setHoldername(resultset.getString("Cardholdername"));
				pm.setCardnumber(resultset.getString("cnumber"));
				pm.setExpDate(resultset.getString("expire_date"));
				pm.setCcv(resultset.getInt("ccv"));
				pm.setBid(resultset.getInt("rid"));
				pm.setDate_curr(resultset.getString("datecurrent"));
				

				arraylist.add(pm);

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

	// ********************************delete************************************************************

	@Override
	public void removePayment(int ccv) {
		// TODO Auto-generated method stub

		DBConnectionUtil obj_DB_Connection = new DBConnectionUtil();
		Connection connection = obj_DB_Connection.getDBConnection();
		PreparedStatement ps = null;

		try {

			String query = "Delete   from Payment where ccv=?";
			ps = connection.prepareStatement(query);

			ps.setInt(1, ccv);

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

	// **************************************update******************************************************************

	@Override
	public void updatePayment(Paymentmodel pm) {
		// TODO Auto-generated method stub

		DBConnectionUtil obj_DB_Connection = new DBConnectionUtil();
		Connection connection = obj_DB_Connection.getDBConnection();
		PreparedStatement ps = null;

		try {

		
			
			System.out.println("payemnt id is     :  "+ pm.getTotpay());
			//String query = "update Payment set Totalpayment=?,Paytype=?,Cardholdername=?,cnumber=?,expire_date=?,ccv=? where ccv=?";
			String query = "update Payment set Totalpayment=? where ccv=?";
			
			
			ps = connection.prepareStatement(query);

			ps.setFloat(1, pm.getTotpay());
			ps.setInt(2, pm.getCcv());
		
			
			//ps.setString(2, pm.getPayType());

			//ps.setString(3, pm.getHoldername());
			//ps.setString(4, pm.getCardnumber());
			//ps.setString(5, pm.getExpDate());
			//ps.setInt(6, pm.getCcv());
			//ps.setString(6, pm.getCoupon());

			

			System.out.println("waruthaaaaa" + pm.getCcv());

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
