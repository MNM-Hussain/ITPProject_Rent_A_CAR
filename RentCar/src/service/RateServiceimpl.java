package service;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Model.Rates;

import util.DBConnectionUtil;

public class RateServiceimpl implements IRateService {

	private PreparedStatement preparedStatement;

	private static Connection connection;
	private ResultSet resultset;

	Statement statement;

	public void addRate(Rates rate) {

		try {
			String sql = "insert into Rates(category,Amount) values (?,?)";

			connection = DBConnectionUtil.getDBConnection();

			/*
			 * Query is available in sql
			 */
			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, rate.getCategory());

			preparedStatement.setString(2, rate.getAmount());

			preparedStatement.execute();
			connection.commit();

		} catch (Exception e) {

			System.out.println(e);
		} finally {
			/*
			 * Close prepared statement and database connectivity at the end of transaction
			 */
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {

			}
		}

	}

	// Retrieve Rates Details from Rates table
	public ArrayList<Rates> get_Rates_details() {

		connection = DBConnectionUtil.getDBConnection();

		preparedStatement = null;

		ArrayList<Rates> arraylist = new ArrayList<>();

		try {

			String sql = "select* from Rates";
			preparedStatement = connection.prepareStatement(sql);
			resultset = preparedStatement.executeQuery();

			while (resultset.next()) {

				Rates rates = new Rates();

				rates.setRateId(resultset.getString("RateId"));
				rates.setCategory(resultset.getString("category"));
				rates.setAmount(resultset.getString("Amount"));

				arraylist.add(rates);

			}

		} catch (Exception e) {

			System.out.println(e);
		} finally {
			/*
			 * Close prepared statement and database connectivity at the end of transaction
			 */
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {

			}
		}

		return arraylist;

	}

	// Update existing Event
	public void updateRates(Rates rates) {

		try {
			connection = DBConnectionUtil.getDBConnection();

			String sql = "update Rates set category=?,Amount=? where RateId=? ";

			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, rates.getCategory());
			preparedStatement.setString(2, rates.getAmount());

			preparedStatement.setString(3, rates.getRateId());

			preparedStatement.executeUpdate();

		} catch (Exception e) {

			System.out.println(e);
		} finally {
			/*
			 * Close prepared statement and database connectivity at the end of transaction
			 */
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {

			}
		}

	}

	// Remove existing Event
	public void removeRate(String RateId) {
		try {
			connection = DBConnectionUtil.getDBConnection();

			String sql = "Delete   from Rates where RateId=?";
			PreparedStatement preparedstatement = connection.prepareStatement(sql);

			preparedstatement.setString(1, RateId);
			preparedstatement.executeUpdate();

		} catch (Exception e) {

			System.out.println(e);
		} finally {
			/*
			 * Close prepared statement and database connectivity at the end of transaction
			 */
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {

			}
		}

	}

}// final bracket
