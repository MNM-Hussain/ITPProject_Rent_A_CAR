package service;

import java.util.ArrayList;

import Model.Inventory;

public interface IInventoryService {
	
	public void insertInventory(Inventory inventory);
	public ArrayList<Inventory> get_Inventory_details();
	
	public void removeInventory(String CarID);
	
	public void updateInventory(Inventory inventory);
	
	public ArrayList<Inventory> get_InventoryCategory(String category);
	
	
	
}