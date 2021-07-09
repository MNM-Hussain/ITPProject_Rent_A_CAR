package service;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Model.IncomeStatement;

import util.DBConnectionUtil;

public class IncomeStatementServiceimpl implements IIncomeStatementService {

	private PreparedStatement preparedStatement;

	private static Connection connection;
	private ResultSet resultset;
	Statement statement;
	
	
	
	
	
	
	public  boolean checkDate(String date)  {
		
		boolean find =false;
					
			try {
				connection = DBConnectionUtil.getDBConnection();
				preparedStatement=connection.prepareStatement("select* from IncomeStatement where date1=?");
				preparedStatement.setString(1, date);
				resultset = preparedStatement.executeQuery();
				find=resultset.next();
					
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		return find;
					
	}
	
	
	public  String CheckDay(String date)  {
		String NoOfDates=null;
				try {
				connection = DBConnectionUtil.getDBConnection();
				preparedStatement=connection.prepareStatement("select count(date1) as 'value' from IncomeStatement where date1 LIKE ?");
				preparedStatement.setString(1,date + "%");
				resultset = preparedStatement.executeQuery();
				while (resultset.next()) {
				 NoOfDates=resultset.getString("value");
				}
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
						
						
		return NoOfDates;
					
	}
	
	
	
	
	public  String CheckMonth(String date)  {
		
		String months=null;
		try {
		connection = DBConnectionUtil.getDBConnection();
		preparedStatement=connection.prepareStatement("select count(date1) as 'value' from IncomeStatement where date1 LIKE ?");
		preparedStatement.setString(1, date + "%");
		resultset = preparedStatement.executeQuery();
		while (resultset.next()) {
			months=resultset.getString("value");
		}
		
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
				
				
		return months;
					
	}
	
	
	
	
	
	
	
	
	
	
	

	public void Insert_IS_ForMonthEnded(IncomeStatement IS) {

		try {
			String sql = "insert into IncomeStatement(date1,Salary,maintance,electricity,rent_expenses,other_expenses,Rent_income,other_income,TOTAL_INCOME,TOTAL_Expense,profit_OR_loss) values (?,?,?,?,?,?,?,?,?,?,?)";

			connection = DBConnectionUtil.getDBConnection();

			/*
			 * Query is available in sql
			 */
			preparedStatement = connection.prepareStatement(sql);

			preparedStatement.setString(1, IS.getDate());

			preparedStatement.setFloat(2, IS.getSalary());
			preparedStatement.setFloat(3, IS.getMaintance());
			preparedStatement.setFloat(4, IS.getElectricity());
			preparedStatement.setFloat(5, IS.getRent_expenses());
			preparedStatement.setFloat(6, IS.getOther_expenses());
			preparedStatement.setFloat(7, IS.getRent_income());
			preparedStatement.setFloat(8, IS.getOther_income());

			preparedStatement.setFloat(9, IS.getTOTAL_INCOME());

			preparedStatement.setFloat(10, IS.getTOTAL_Expense());

			preparedStatement.setFloat(11, IS.getProfit_loss());

			
			
			
			preparedStatement.execute();
			
			
			connection.commit();

		} catch (Exception e) {

			System.out.println(e);
		} finally {
			/*
			 * System.out.println("boolean value is"+isTrue);
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
	public ArrayList<IncomeStatement> get_IncomeStatement_details() {

		connection = DBConnectionUtil.getDBConnection();

		preparedStatement = null;

		ArrayList<IncomeStatement> arraylist = new ArrayList<>();

		try {

			String sql = "select* from IncomeStatement";
			preparedStatement = connection.prepareStatement(sql);
			resultset = preparedStatement.executeQuery();

			while (resultset.next()) {

				IncomeStatement IS = new IncomeStatement();

				IS.setDate(resultset.getString("date1"));
				IS.setTOTAL_INCOME(resultset.getFloat("TOTAL_INCOME"));
				IS.setTOTAL_Expense(resultset.getFloat("TOTAL_Expense"));
				IS.setProfit_loss(resultset.getFloat("profit_OR_loss"));

				arraylist.add(IS);

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

	

	
	// ********************************delete expense ************************************************************
	
	public void removeexpense(String date) {
		// TODO Auto-generated method stub

		connection = DBConnectionUtil.getDBConnection();

		try {

			String query2 = "Delete   from expenses where date2=?";
		
			
			
			
		
			preparedStatement = connection.prepareStatement(query2);

			preparedStatement.setString(1, date);

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

	
	
	
	
	
	
	// ********************************delete incomeStatement************************************************************


	public void removeIncomeStatement(String date) {
		// TODO Auto-generated method stub

		connection = DBConnectionUtil.getDBConnection();

		try {

			String query1 = "Delete   from IncomeStatement where date1=?";
			
			
			
			preparedStatement = connection.prepareStatement(query1);
			

			preparedStatement.setString(1, date);

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


	@Override
	public void Insertexpense(String date) {
		// TODO Auto-generated method stub
		
	}

	
	
	
	
	
	
	
	
	
}// final bracket
