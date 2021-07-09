package Model;

public class Availability_Driver {

	int avid;
    String startDate ;
    String endDate;
	int lisenceNUM;
	int bookid;
	
	
	public int getBookid() {
		return bookid;
	}
	public void setBookid(int bookid) {
		this.bookid = bookid;
	}
	public int getAvid() {
		return avid;
	}
	public void setAvid(int avid) {
		this.avid = avid;
	}
	public String getStartDate() {
		return startDate;
	}
	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}
	public String getEndDate() {
		return endDate;
	}
	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}
	public int getLisenceNUM() {
		return lisenceNUM;
	}
	public void setLisenceNUM(int lisenceNUM) {
		this.lisenceNUM = lisenceNUM;
	}
	@Override
	public String toString() {
		return "Availability_Driver [avid=" + avid + ", startDate=" + startDate + ", endDate=" + endDate
				+ ", lisenceNUM=" + lisenceNUM + ", bookid=" + bookid + "]";
	}
	
	
	
}
