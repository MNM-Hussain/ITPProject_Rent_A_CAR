package Model;

public class Allocation {
	
	private int allocationid;
	private int bookid;
	private String pickuplocation ;
	
	private int noofperson ;
	private String pickupdate ;
	private String returndate ;
	private String pickuptime ;
	private int driverid;


	public int getAllocationid() {
		return allocationid;
	}
	public void setAllocationid(int allocationid) {
		this.allocationid = allocationid;
	}
	public int getBookid() {
		return bookid;
	}
	public void setBookid(int bookid) {
		this.bookid = bookid;
	}
	public String getPickuplocation() {
		return pickuplocation;
	}
	public void setPickuplocation(String pickuplocation) {
		this.pickuplocation = pickuplocation;
	}
	
	public int getNoofperson() {
		return noofperson;
	}
	public void setNoofperson(int noofperson) {
		this.noofperson = noofperson;
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
	public String getPickuptime() {
		return pickuptime;
	}
	public void setPickuptime(String pickuptime) {
		this.pickuptime = pickuptime;
	}
	public int getDriverid() {
		return driverid;
	}
	public void setDriverid(int driverid) {
		this.driverid = driverid;
	}
	@Override
	public String toString() {
		return "Allocation [allocationid=" + allocationid + ", bookid=" + bookid + ", pickuplocation=" + pickuplocation
				+ ", noofperson=" + noofperson + ", pickupdate=" + pickupdate + ", returndate=" + returndate
				+ ", pickuptime=" + pickuptime + ", driverid=" + driverid + "]";
	}

	
	
	
	
	
	
	
	
	
	
	
	
	

}
