package Model;

import java.io.File;
import java.io.InputStream;

public class Inventory {
	InputStream image; 
    
	String carID;
    String model;
    String category;
	String supplierID;
    String description;
    int noOfPassengers;
    String url;
    String source;
   
    

	


	public String getSource() {
		return source;
	}


	public void setSource(String source) {
		this.source = source;
	}


	public void setImage(InputStream image) {
		this.image = image;
	}


	public String getUrl() {
		return url;
	}


	public void setUrl(String url) {
		this.url = url;
	}
	public InputStream getImage() {
		return image;
	}

//	public void setImage(Object image) {
	//	this.image = image;
	//}

	
//public Object getImage() {
	//	return image;
	//}


	public String getCarID() {
		return carID;
	}
	
	public void setCarID(String carID) {
		this.carID = carID;
	}
	public String getModel() {
		return model;
	}
	public void setModel(String model) {
		this.model = model;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getSupplierID() {
		return supplierID;
	}
	public void setSupplierID(String supplierID) {
		this.supplierID = supplierID;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
	
	
	public int getNoOfPassengers() {
		return noOfPassengers;
	}
	public void setNoOfPassengers(int noOfPassengers) {
		this.noOfPassengers = noOfPassengers;
	}
    
    
    
}
