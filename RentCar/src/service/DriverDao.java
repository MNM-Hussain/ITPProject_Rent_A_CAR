package service;

import java.util.List;

import Model.Driver;

public interface DriverDao {
	

	List<Driver> get();
	
	Driver get(int driverid);
	
	boolean save(Driver driver);
	
	boolean delete(int driverid);
	
	boolean update(Driver driver);

}
