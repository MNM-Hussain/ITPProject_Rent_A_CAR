package service;

import java.util.ArrayList;

import Model.Paymentmodel;
import Model.Suppliermodel;

public interface Ipayment {

	public void insert(Paymentmodel pm);

	public ArrayList<Paymentmodel> get_payment_details();

	public void updatePayment(Paymentmodel pm);

	// primary key i have used holdername here but need to change
	public void removePayment(int payID);

}
