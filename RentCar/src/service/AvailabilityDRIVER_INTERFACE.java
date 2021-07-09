package service;

import java.util.List;

import Model.Availability_Driver;
import Model.Driver;

public interface AvailabilityDRIVER_INTERFACE {

	public void insertAvailability(Availability_Driver availability);
	
	public List<Driver> ListAvailability(String  startDate,String endDate);
	
	public boolean delete(int bookid);
}
