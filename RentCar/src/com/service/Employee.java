package com.service;

import java.util.ArrayList;

import com.model.NewEmployee;

public interface Employee {
	
	public void addEmpolyee(NewEmployee emp);
	public ArrayList<NewEmployee> listemployee();
	public NewEmployee getemployee(String id);
	public void updateEmployee(NewEmployee emp);
	
	
	public void removeEmployee(String NIC);

	public void addpastEmpolyee(NewEmployee emp);
	public ArrayList<NewEmployee> listPASTemployee();
	public NewEmployee getemployeeSalary(String id);
	
	public NewEmployee getBasicSal(String id);
	
	
	
	
	
}
