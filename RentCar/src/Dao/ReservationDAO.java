package Dao;

import java.util.List;

import Entity.Reservation;

public interface ReservationDAO {
	
	List<Reservation> get();
	
	boolean save(Reservation r);
	
	Reservation get(int rid); 
	
	boolean update(Reservation r);
	
	boolean delete(int rid);

}
