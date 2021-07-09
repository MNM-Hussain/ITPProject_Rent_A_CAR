package com.service;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.model.NewEmployee;
import com.util.DBconnect;

public class EmployeeImp implements Employee{

	private static Connection connection;
	private static PreparedStatement pt;
	private static CallableStatement ct;
	private static Statement st;
	
	@Override
	public void addEmpolyee(NewEmployee emp) {
		// TODO Auto-generated method stub
		
		
		
		try {
			connection=DBconnect.initializeddb();
			pt=connection.prepareStatement("insert into EmployeeDetails(FirstName,LastName,EmpID,NIC,Address,phoneNum,email,jobrole,basicSal) values(?,?,?,?,?,?,?,?,?)");
			pt.setString(1, emp.getFirstName()); 
			pt.setString(2, emp.getLastName());
			pt.setInt(3, emp.getEmpID());
			pt.setString(4, emp.getNIC());
			pt.setString(5, emp.getAddress());
			pt.setInt(6, emp.getPhoneNum());
			pt.setString(7, emp.getEmail());
			pt.setString(8, emp.getJobrole());
			pt.setInt(9, emp.getBasicSal());
		 
			pt.execute();
			
		
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	public ArrayList<NewEmployee> listemployee() {
ArrayList<NewEmployee> employee=new ArrayList();
		
		try {
			
			connection=DBconnect.initializeddb();
		pt=connection.prepareStatement("select * from EmployeeDetails");
		ResultSet result=pt.executeQuery();
		
		while(result.next()) {
			
			NewEmployee emp=new NewEmployee();
			
			emp.setFirstName(result.getString(1));
			emp.setLastName(result.getString(2));
			emp.setEmpID(result.getInt(3));
			emp.setNIC(result.getString(4));
			emp.setAddress(result.getString(5));
			emp.setPhoneNum(result.getInt(6));
			emp.setEmail(result.getString(7));
			emp.setJobrole(result.getString(8));
			emp.setBasicSal(result.getInt(9));
			
			employee.add(emp);
		 
			
			
		}
		
		}catch (Exception e){
			
			e.printStackTrace();
		}
		return employee;
	}

	public NewEmployee getemployee(String id) {
		// TODO Auto-generated method stub
           NewEmployee emp=new NewEmployee();
		
		try {
			connection=DBconnect.initializeddb();
			pt=connection.prepareStatement("select * from EmployeeDetails where NIC=?");
			pt.setString(1, id);
			ResultSet result=pt.executeQuery();
			
			while(result.next()){
				
				emp.setFirstName(result.getString(1));
				emp.setLastName(result.getString(2));
				emp.setEmpID(result.getInt(3));
				emp.setNIC(result.getString(4));
				emp.setAddress(result.getString(5));
				emp.setPhoneNum(result.getInt(6));
				emp.setEmail(result.getString(7));
				emp.setJobrole(result.getString(8));
				emp.setBasicSal(result.getInt(9));
				
				
				
			}
			
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return emp;
	}

	@Override
	public void updateEmployee(NewEmployee emp) {
		// TODO Auto-generated method stub
		
		try {
			connection=DBconnect.initializeddb();			
			pt=connection.prepareStatement("update  EmployeeDetails set FirstName=?,LastName=?, EmpID=?,Address=?,phoneNum=?,email=?,jobrole=?,basicSal=? where NIC=?");
			pt.setString(1,emp.getFirstName());
			pt.setString(2,emp.getLastName());
			pt.setInt(3,emp.getEmpID());
			pt.setString(4,emp.getAddress());
			pt.setInt(5,emp.getPhoneNum());
			pt.setString(6,emp.getEmail());
			pt.setString(7,emp.getJobrole());
			pt.setInt(8,emp.getBasicSal());
			pt.setString(9, emp.getNIC());
			  
			
			pt.executeUpdate();
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	
	//************************delete*********************************
	
	@Override
	public void removeEmployee(String NIC) {
		// TODO Auto-generated method stub
		
		
		try {
			
			
			connection=DBconnect.initializeddb();
			pt=connection.prepareStatement("Delete from EmployeeDetails where NIC=?");
			pt.setString(1,NIC);
			
			
			pt.execute();
			
			
			
		}catch (Exception e) {
			// TODO: handle exception
			
			System.out.println(e);
			
		} finally {
			/*
			 * Close prepared statement and database connectivity at the end of transaction
			 */
			try {
				if (pt != null) {
					pt.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				
			}
		}
	
	}
	
	
	
	
	
	/////////////////////////// add past employeee/////////////////////////
	
	public void addpastEmpolyee(NewEmployee emp) {
		// TODO Auto-generated method stub
		try {
			connection=DBconnect.initializeddb();
			pt=connection.prepareStatement("insert into Past_employees(FirstName,LastName,EmpID,NIC,Address,phoneNum,email,jobrole,basicSal) values(?,?,?,?,?,?,?,?,?)");
			pt.setString(1, emp.getFirstName()); 
			pt.setString(2, emp.getLastName());
			pt.setInt(3, emp.getEmpID());
			pt.setString(4, emp.getNIC());
			pt.setString(5, emp.getAddress());
			pt.setInt(6, emp.getPhoneNum());
			pt.setString(7, emp.getEmail());
			pt.setString(8, emp.getJobrole());
			pt.setInt(9, emp.getBasicSal());
		 
			pt.execute();
			
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}

	
	////////////Retrieve  past employeeee
	
	
	public ArrayList<NewEmployee> listPASTemployee() {
		ArrayList<NewEmployee> employee=new ArrayList();
				
				try {
					
					connection=DBconnect.initializeddb();
				pt=connection.prepareStatement("select * from Past_employees");
				ResultSet result=pt.executeQuery();
				
				while(result.next()) {
					
					NewEmployee emp=new NewEmployee();
					
					emp.setFirstName(result.getString(1));
					emp.setLastName(result.getString(2));
					emp.setEmpID(result.getInt(3));
					emp.setNIC(result.getString(4));
					emp.setAddress(result.getString(5));
					emp.setPhoneNum(result.getInt(6));
					emp.setEmail(result.getString(7));
					emp.setJobrole(result.getString(8));
					emp.setBasicSal(result.getInt(9));
					
					employee.add(emp);
				 
					
					
				}
				
				}catch (Exception e){
					
					e.printStackTrace();
				}
				return employee;
			}

	@Override
	public NewEmployee getemployeeSalary(String id) {
		  NewEmployee emp=new NewEmployee();
			
			try {
				connection=DBconnect.initializeddb();
				pt=connection.prepareStatement("select basicSal from EmployeeDetails where NIC=?");
				pt.setString(1, id);
				ResultSet result=pt.executeQuery();
				
				while(result.next()){
					
					 
					emp.setNIC(result.getString(1));
					emp.setBasicSal(result.getInt(2));
					
					
					
				}
				
				
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			return emp;
	}

	public NewEmployee getBasicSal(String id) {
		// TODO Auto-generated method stub
		 NewEmployee emp=new NewEmployee();
			
			try {
				connection=DBconnect.initializeddb();
				pt=connection.prepareStatement("select NIC,basicSal from EmployeeDetails where NIC=?" );
				pt.setString(1, id);
				ResultSet result=pt.executeQuery();
				
				while(result.next()){
					
					
					emp.setNIC(result.getString(1));
					emp.setBasicSal(result.getInt(2));
					
					
					
				}
				
				
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			return emp;
		
		
		
	}

	
	
	
	
	
	
}//final bracket
	
	
	
	


