package service;

import java.util.ArrayList;

import Model.Suppliermodel;

public interface Isupplier {

	public void insert(Suppliermodel sm);

	public ArrayList<Suppliermodel> get_supplier_details();

	public void updateSupplier(Suppliermodel sm);

	// primary key i have used name here but need to change
	public void removeSupplier(int SuppID);

}
