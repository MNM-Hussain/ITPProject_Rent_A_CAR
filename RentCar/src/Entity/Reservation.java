package Entity;

public class Reservation {
	
	private int rid;
	private String location;
	private String time1;
	private String pickupdate;
	private String returndate;
	//private String numofdays;
	private String numofpassengers;
	public int getRid() {
		return rid;
	}
	public void setRid(int rid) {
		this.rid = rid;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getTime1() {
		return time1;
	}
	public void setTime1(String time1) {
		this.time1 = time1;
	}
	public String getPickupdate() {
		return pickupdate;
	}
	public void setPickupdate(String pickupdate) {
		this.pickupdate = pickupdate;
	}
	public String getReturndate() {
		return returndate;
	}
	public void setReturndate(String returndate) {
		this.returndate = returndate;
	}

	public String getNumofpassengers() {
		return numofpassengers;
	}
	public void setNumofpassengers(String numofpassengers) {
		this.numofpassengers = numofpassengers;
	}
	@Override
	public String toString() {
		return "Reservation [rid=" + rid + ", location=" + location + ", time1=" + time1 + ", pickupdate=" + pickupdate
				+ ", returndate=" + returndate + ",numofpassengers=" + numofpassengers
				+ "]";
	}
	
	

}
