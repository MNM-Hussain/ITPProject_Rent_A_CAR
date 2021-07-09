package service;

import java.util.ArrayList;

import Model.Customer;

public interface ICustomer {
	public void  AddCustomer(Customer customer);
	public ArrayList<Customer> get_Customer_details();
	public void updateCustomer(Customer customer);
	
	
	public void removeCustomer(String NIC);


	public void addpastCustomer(Customer customer);
	public ArrayList<Customer> getpast_Customer_details();

}
