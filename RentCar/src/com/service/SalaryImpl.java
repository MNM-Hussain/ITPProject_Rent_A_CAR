package com.service;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.model.NewEmployee;
import com.model.Salary;
import com.util.DBconnect;

import Model.IncomeStatement;

public class SalaryImpl implements ISalary {
	
	
	private static Connection connection;
	private static PreparedStatement pt;
	private static CallableStatement ct;
	private static Statement st;
	
	private ResultSet resultset;
	
	
	public void addSalary(Salary sal) {
		// TODO Auto-generated method stub
		try {
			connection=DBconnect.initializeddb();
			pt=connection.prepareStatement("insert into Salary(Nic,date,basic_salary,attendence,epf,etf,netsalary) values(?,?,?,?,?,?,?)");
	
	
					
						
			
			pt.setString(1, sal.getNIC());
			pt.setString(2, sal.getDate());
			pt.setFloat(3, sal.getBasSal());
			pt.setInt(4, sal.getAttendnce());
			pt.setFloat(5, sal.getEPF());
			pt.setFloat(6, sal.getETF());
			pt.setFloat(7, sal.getNetSal());
		
			
			
			
		
		 
			pt.execute();
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	
//retrieving salary details
	
	public ArrayList<Salary> listsalary() {
		ArrayList<Salary> salary=new ArrayList();

		System.out.println("nnnnnnnnnnnnnn");
				try {
					
					connection=DBconnect.initializeddb();
				pt=connection.prepareStatement("select * from Salary");
				ResultSet result=pt.executeQuery();
				
				while(result.next()) {
					
					Salary sal1=new Salary();
					
					sal1.setNIC(result.getString("Nic"));
					sal1.setDate(result.getString("date"));
					sal1.setBasSal(result.getFloat("basic_salary"));
					sal1.setAttendnce(result.getInt("attendence"));
					
					sal1.setEPF(result.getFloat("epf"));
					sal1.setETF(result.getFloat("etf"));
					sal1.setNetSal(result.getFloat("netsalary"));
					
					
				
					
					
					salary.add(sal1);
					
				}
				
				}catch (Exception e){
					
					e.printStackTrace();
				}
				
				System.out.println("hhhhhhhhhhhhhhhhhhh");
				return salary;
			}

	
	
	
	
	
	
	
}//final bracket
