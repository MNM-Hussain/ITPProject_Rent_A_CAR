package service;
import java.util.List;

import Model.Book;
public interface ResDAO {

	List<Book> get();
	
	Book get(int bookid);
	
	boolean save(Book event);
	
	boolean delete(int bookid);
	
	boolean update(Book book);

}

	
	
	

	

