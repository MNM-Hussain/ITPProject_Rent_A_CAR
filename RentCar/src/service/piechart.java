package service;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import Model.IncomeStatement;
import Model.Rates;
import util.DBConnectionUtil;

public class piechart {
	
	
	
	
	

	//retreive the total income details
	public float[] get_values_of_IncomeStatement(String date)
	{
		float[] amount = new float[12];
		DBConnectionUtil dbConnectionUtil = new DBConnectionUtil();
		@SuppressWarnings("static-access")
		Connection connection=dbConnectionUtil.getDBConnection();
	
			PreparedStatement preparedstatement=null;
				ResultSet resultset=null;
	
	IncomeStatement IS = new IncomeStatement();
	
	
	
	try {
		

		
	
		String sql="select TOTAL_INCOME from IncomeStatement where date1 LIKE ?";
		
		preparedstatement=connection.prepareStatement(sql);
		preparedstatement.setString(1,date+"%");
		resultset=preparedstatement.executeQuery();
		
	
		int i=0;
		while(resultset.next())
		{
			amount[i]=(resultset.getFloat("TOTAL_INCOME"));
			i=i+1;
						
		}
	
		
	
	
	}catch(Exception e)
    	{
		System.out.println(e);
    	}
	
	return amount;
	

	
	
	}
	
	
	
	
	
	
	
	
	

	//retreive the total expenses details
	public float[] get_total_expenses_of_IncomeStatement(String date)
	{
		float[] amount = new float[12];
		DBConnectionUtil dbConnectionUtil = new DBConnectionUtil();
		@SuppressWarnings("static-access")
		Connection connection=dbConnectionUtil.getDBConnection();
	
			PreparedStatement preparedstatement=null;
				ResultSet resultset=null;
	
	IncomeStatement IS = new IncomeStatement();
	
	
	
	try {
		

		
	
		String sql="select TOTAL_Expense from IncomeStatement where date1 LIKE ?";
		
		preparedstatement=connection.prepareStatement(sql);
		preparedstatement.setString(1,date+"%");
		resultset=preparedstatement.executeQuery();
		
	
		int i=0;
		while(resultset.next())
		{
			amount[i]=(resultset.getFloat("TOTAL_Expense"));
			i=i+1;
						
		}
	
		
	
	
	}catch(Exception e)
    	{
		System.out.println(e);
    	}
	
	return amount;
	

	
	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}//final bracket
