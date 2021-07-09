package service;

import java.beans.Statement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.model.NewEmployee;
import com.util.DBconnect;

import Model.IncomeStatement;
import util.DBConnectionUtil;

public class IS_for_the_year {
	
	
	private PreparedStatement preparedStatement;

	private static Connection connection;
	private ResultSet resultset;
	Statement statement;
	
	
	
	//validate year
	public  String CheckMonth(String date)  {
		
		String year=null;
		try {
		connection = DBConnectionUtil.getDBConnection();
		preparedStatement=connection.prepareStatement("select count(year) as 'value' from IncomeStatement_for_the_year where year LIKE ?");
		preparedStatement.setString(1, date + "%");
		resultset = preparedStatement.executeQuery();
		while (resultset.next()) {
			year=resultset.getString("value");
		}
		
	} catch (Exception e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
				
				
		return year;
					
	}
	
	
	
	
	
	
	
	
	
	
	public void Insert_IS_ForYearEnded(IncomeStatement IS) {

		try {
			String sql = "insert into IncomeStatement_for_the_year(year,Salary,maintance,electricity,rent_expenses,other_expenses,Rent_income,other_income,TOTAL_INCOME,TOTAL_Expense,profit_OR_loss) values (?,?,?,?,?,?,?,?,?,?,?)";

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
	
	
	
	
	
	
	
	
	
	
	
	
	
//RETREIVE INCOME STATEMENT VALUES TO CALCULATE INCOME STATEMENT FOR THE YEAR ENDED
	public IncomeStatement get_values_of_IncomeStatement_for_the_year(String date) {

		IncomeStatement IS = new IncomeStatement();
		DBConnectionUtil dbConnectionUtil = new DBConnectionUtil();
		@SuppressWarnings("static-access")
		Connection connection = dbConnectionUtil.getDBConnection();

		PreparedStatement preparedstatement = null;
		ResultSet resultset = null;

		String date1 = date;

		try {

			String sql = "SELECT count(date1) as'date1', sum(Salary)as 'Salary',sum(maintance)as'maintance',sum(electricity)as'electricity',	sum(rent_expenses)as'rent_expenses',sum(other_expenses)as'other_expenses',sum(Rent_income)as'Rent_income', 	sum(other_income)as'other_income',sum(TOTAL_INCOME)as'TOTAL_INCOME',sum(TOTAL_Expense)as'TOTAL_Expense',sum(profit_OR_loss)as'profit_OR_loss'FROM IncomeStatement 	WHERE date1  LIKE ?";

			preparedstatement = connection.prepareStatement(sql);

			preparedstatement.setString(1, date + "%");

			resultset = preparedstatement.executeQuery();

			while (resultset.next()) {

				IS.setDate(resultset.getString("date1"));

				IS.setSalary(resultset.getFloat("Salary"));
				IS.setMaintance(resultset.getInt("maintance"));
				IS.setElectricity(resultset.getInt("electricity"));
				IS.setRent_expenses(resultset.getInt("rent_expenses"));
				IS.setOther_expenses(resultset.getInt("other_expenses"));

				IS.setRent_income(resultset.getInt("Rent_income"));
				IS.setOther_income(resultset.getInt("other_income"));

				IS.setTOTAL_INCOME(resultset.getInt("TOTAL_INCOME"));
				IS.setTOTAL_Expense(resultset.getInt("TOTAL_Expense"));

				IS.setProfit_loss(resultset.getInt("profit_OR_loss"));
				// IS.setBudget(resultset.getInt("budget"));

			}

		} catch (Exception e) {
			System.out.println(e);
		}

		if (IS.getMaintance() == 0.0) {

			return null;
		} else {
			return IS;
		}

	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	// Retrieve income statement Details from income statement year table
		public ArrayList<IncomeStatement> get_IncomeStatement_forTheYear_details() {

			connection = DBConnectionUtil.getDBConnection();

			preparedStatement = null;

			ArrayList<IncomeStatement> arraylist = new ArrayList<>();

			try {

				String sql = "select* from IncomeStatement_for_the_year";
				preparedStatement = connection.prepareStatement(sql);
				resultset = preparedStatement.executeQuery();

				while (resultset.next()) {

					IncomeStatement IS = new IncomeStatement();

					IS.setDate(resultset.getString("year"));
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

	
	
	
	
	
	
		
		
		
		
		
		
		
		
		
		public IncomeStatement get_values_of_IncomeStatement_ForTheYear(String year) {

			IncomeStatement IS = new IncomeStatement();
			DBConnectionUtil dbConnectionUtil = new DBConnectionUtil();
			@SuppressWarnings("static-access")
			Connection connection = dbConnectionUtil.getDBConnection();

			PreparedStatement preparedstatement = null;
			ResultSet resultset = null;

			String date1 = year;

			try {

				String sql = "select * from IncomeStatement_for_the_year where year =?";
				
			
				preparedstatement = connection.prepareStatement(sql);
				preparedstatement.setString(1, year);
				resultset = preparedstatement.executeQuery();

				while (resultset.next()) {

					IS.setDate(resultset.getString("year"));

					IS.setSalary(resultset.getFloat("Salary"));
					IS.setMaintance(resultset.getInt("maintance"));
					IS.setElectricity(resultset.getInt("electricity"));
					IS.setRent_expenses(resultset.getInt("rent_expenses"));
					IS.setOther_expenses(resultset.getInt("other_expenses"));

					IS.setRent_income(resultset.getInt("Rent_income"));
					IS.setOther_income(resultset.getInt("other_income"));

					IS.setTOTAL_INCOME(resultset.getInt("TOTAL_INCOME"));
					IS.setTOTAL_Expense(resultset.getInt("TOTAL_Expense"));

					IS.setProfit_loss(resultset.getInt("profit_OR_loss"));
					

				}

			} catch (Exception e) {
				System.out.println(e);
			}

			if (IS.getDate() == null) {

				return null;
			} else {
				return IS;
			}

		}
		
		
		
		
		
		
		
		
	
	
	
	
		
		// display all the income statement for the month in the report
	
		
		public ArrayList<IncomeStatement> list_of_IncomeStatement(String date) {
			
			
			ArrayList<IncomeStatement> arraylist=new ArrayList();
			
			DBConnectionUtil dbConnectionUtil = new DBConnectionUtil();
			@SuppressWarnings("static-access")
			Connection connection = dbConnectionUtil.getDBConnection();

			PreparedStatement preparedstatement = null;
			ResultSet resultset = null;
			
			try {
				
				String sql = "select * from IncomeStatement where date1 LIKE ?";
				
				 String subdate = date.substring(0,4);
				preparedstatement = connection.prepareStatement(sql);
				preparedstatement.setString(1, subdate+"%");
				resultset = preparedstatement.executeQuery();
			
			while(resultset.next()) {
				
				IncomeStatement IS = new IncomeStatement();
				
				IS.setDate(resultset.getString("date1"));

				IS.setSalary(resultset.getFloat("Salary"));
				IS.setMaintance(resultset.getFloat("maintance"));
				IS.setElectricity(resultset.getFloat("electricity"));
				IS.setRent_expenses(resultset.getFloat("rent_expenses"));
				IS.setOther_expenses(resultset.getFloat("other_expenses"));

				IS.setRent_income(resultset.getFloat("Rent_income"));
				IS.setOther_income(resultset.getFloat("other_income"));

				IS.setTOTAL_INCOME(resultset.getFloat("TOTAL_INCOME"));
				IS.setTOTAL_Expense(resultset.getFloat("TOTAL_Expense"));

				IS.setProfit_loss(resultset.getFloat("profit_OR_loss"));
				
				arraylist.add(IS);
			 
				
				
			}
			
			}catch (Exception e){
				
				e.printStackTrace();
			}
			return arraylist;
		}

		

		
	
	
	
	
	
	
	

}// final bracket
