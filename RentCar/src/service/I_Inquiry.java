package service;

import java.util.ArrayList;

import Model.Inquiry;

public interface I_Inquiry {
	public void  AddInquiry(Inquiry inquiry);
	
	
	public ArrayList<Inquiry> get_Inquiry_details();
	public void removeInquiry(int inquiryID);

}
