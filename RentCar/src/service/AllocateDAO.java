package service;

import java.util.List;

import Model.Allocation;
import Model.Driver;

public interface AllocateDAO {

	List<Allocation> get();
	
	List<Allocation> get1();
	
	Allocation get(int allocationid);
	
	

	boolean save(Allocation event);
	
	boolean savePast(Allocation event);
	
	boolean delete(int bookid);
	
	boolean update(Allocation event);
	
   boolean updateStatus(int bookid);
}
