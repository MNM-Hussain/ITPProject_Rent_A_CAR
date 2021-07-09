package service;

import java.beans.Statement;
import java.io.FileInputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Base64;

import javax.servlet.http.Part;

import Model.Inventory;
import util.DBConnectionUtil;

public class InventoryServiceimpl implements IInventoryService{

	private PreparedStatement preparedStatement;

	private static Connection connection;

	Statement statement;
	
	FileInputStream fs=null;
	
	private ResultSet resultset;

	
	
	
	@Override
	public void insertInventory(Inventory inventory) {
		// TODO Auto-generated method stub

		try {
			String sql="insert into inventory (carID,model,category,supID,descriptionn,noOfPass,url,image) values(?,?,?,?,?,?,?,?)";
			
			connection = DBConnectionUtil.getDBConnection();
			
			preparedStatement = connection.prepareStatement(sql);
			//fs=new FileInputStream(inventory.getImage());
			
			preparedStatement.setString(1,inventory.getCarID());
			preparedStatement.setString(2,inventory.getModel());
			preparedStatement.setString(3,inventory.getCategory());
			preparedStatement.setString(4,inventory.getSupplierID());
			preparedStatement.setString(5,inventory.getDescription());
			preparedStatement.setInt(6,inventory.getNoOfPassengers());
			
			preparedStatement.setString(7,inventory.getUrl());
			
			if (inventory.getImage() != null) {
				
				preparedStatement.setBlob(8,inventory.getImage());
			}
			
			boolean sc=preparedStatement.execute();
			if(sc)
				System.out.println("insert successfully");
			else
				System.out.println("not successfull");
			connection.commit();
			
		
		} catch(Exception e) {
			e.printStackTrace();
			
		}
		
	}
	
	
	
	
	
	
	
	// Retrieve inventories Details from inventory table
	public ArrayList<Inventory> get_Inventory_details() {

		connection = DBConnectionUtil.getDBConnection();

		preparedStatement = null;

		ArrayList<Inventory> arraylist = new ArrayList<>();

		try {

			String sql = "select* from inventory";
			preparedStatement = connection.prepareStatement(sql);
			resultset = preparedStatement.executeQuery();

			while (resultset.next()) {

				Inventory inventory = new Inventory();

				
			
				
				
				
				 inventory.setCarID(resultset.getString("carID"));
				 inventory.setModel(resultset.getString("model"));
				 inventory.setCategory(resultset.getString("category"));
				
				 inventory.setSupplierID(resultset.getString("supID"));
				 inventory.setDescription(resultset.getString("descriptionn"));
				 
				 inventory.setNoOfPassengers(resultset.getInt("noOfPass"));
				 
				 inventory.setUrl(resultset.getString("url"));
				 
				 if (resultset.getBlob("image") != null) {
						
					 inventory.setImage(resultset.getBlob("image").getBinaryStream());
					 Blob blob=resultset.getBlob("image");
						
						byte[] imageBytes=blob.getBytes(1, (int)blob.length());
						
						String encodedImage=Base64.getEncoder().encodeToString(imageBytes);
					    String image="data:image/jpg;base64,"+encodedImage;
					    inventory.setSource(image);

					}
				 else {
					 inventory.setImage(null);
					 
				 }
				 
			
				 				

			
				
				arraylist.add(inventory);

			}

		} catch (Exception e) {
			
			System.out.println(e);
		} finally {
			/*
			 * Close prepared statement and database connectivity at the end of transaction
			 */
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				
			}
		}

		return arraylist;

	}
	
	
	
	
	
	
	
	
	
	

	// Remove existing Inventory
	public void removeInventory(String CarID) {
		try {
			connection = DBConnectionUtil.getDBConnection();

			String sql = "Delete   from inventory where CarID=?";
			PreparedStatement preparedstatement = connection.prepareStatement(sql);

			preparedstatement.setString(1, CarID);
			preparedstatement.executeUpdate();

		} catch (Exception e) {
			
			System.out.println(e);
		} finally {
			/*
			 * Close prepared statement and database connectivity at the end of transaction
			 */
			try {
				if (preparedStatement != null) {
					preparedStatement.close();
				}
				if (connection != null) {
					connection.close();
				}
			} catch (SQLException e) {
				
			}
		}

	}

	
	
	
	
	
	
	// Update existing Event
		public void updateInventory(Inventory inventory) {

			try {
				connection = DBConnectionUtil.getDBConnection();

				System.out.println(inventory.getCarID());
				
				String sql = "update inventory set model=?,descriptionn=?,noOfPass=?,url=?,image=? where carID=?";
				
				System.out.println(inventory.getModel());
				
				preparedStatement = connection.prepareStatement(sql);

				preparedStatement.setString(1, inventory.getModel());
				
				preparedStatement.setString(2, inventory.getDescription());
				
				preparedStatement.setInt(3, inventory.getNoOfPassengers());
				
				preparedStatement.setString(4, inventory.getUrl());
				
				preparedStatement.setString(6, inventory.getCarID());
				if (inventory.getImage() != null) {
					
					preparedStatement.setBlob(5,inventory.getImage());
			}
				
			preparedStatement.executeUpdate();

			} catch (Exception e) {
				
				System.out.println(e);
			} finally {
				/*
				 * Close prepared statement and database connectivity at the end of transaction
				 */
				try {
					if (preparedStatement != null) {
						preparedStatement.close();
					}
					if (connection != null) {
						connection.close();
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}

		}

	
	
	
	
	
	
	
		// Remove existing Event
		public void removeRate(String RateId) {
			try {
				connection = DBConnectionUtil.getDBConnection();

				String sql = "Delete   from Rates where RateId=?";
				PreparedStatement preparedstatement = connection.prepareStatement(sql);

				preparedstatement.setString(1, RateId);
				preparedstatement.executeUpdate();

			} catch (Exception e) {
				
				System.out.println(e);
			} finally {
				/*
				 * Close prepared statement and database connectivity at the end of transaction
				 */
				try {
					if (preparedStatement != null) {
						preparedStatement.close();
					}
					if (connection != null) {
						connection.close();
					}
				} catch (SQLException e) {
					
				}
			}

		}







		@Override
		public ArrayList<Inventory> get_InventoryCategory(String category) {
			// TODO Auto-generated method stub
			connection = DBConnectionUtil.getDBConnection();

			preparedStatement = null;

			ArrayList<Inventory> arraylist = new ArrayList<>();

			try {

				String sql = "select * from inventory where category=?";
				preparedStatement = connection.prepareStatement(sql);
				preparedStatement.setString(1,category);
				resultset = preparedStatement.executeQuery();

				while (resultset.next()) {

					Inventory inventory = new Inventory();

					
				
					
					
					
					 inventory.setCarID(resultset.getString("carID"));
					 inventory.setModel(resultset.getString("model"));
					 inventory.setCategory(resultset.getString("category"));
					
					 inventory.setSupplierID(resultset.getString("supID"));
					 inventory.setDescription(resultset.getString("descriptionn"));
					 
					 inventory.setNoOfPassengers(resultset.getInt("noOfPass"));
					

				
					
					arraylist.add(inventory);

				}

			} catch (Exception e) {
				
				System.out.println(e);
			} finally {
				/*
				 * Close prepared statement and database connectivity at the end of transaction
				 */
				try {
					if (preparedStatement != null) {
						preparedStatement.close();
					}
					if (connection != null) {
						connection.close();
					}
				} catch (SQLException e) {
					
				}
			}

			return arraylist;
		}

	
	
	
	
	
	
	
	
	
}//final
