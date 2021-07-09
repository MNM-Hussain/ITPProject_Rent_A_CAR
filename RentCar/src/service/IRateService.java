package service;



import java.util.ArrayList;

import Model.Rates;

public interface IRateService {
	
	//Add Registration details for  Registration table
		public void  addRate(Rates rates);
		
		
		public ArrayList<Rates> get_Rates_details();
		
		public void updateRates(Rates rates);
		
		
		public void removeRate(String EventName);
	
	

}
