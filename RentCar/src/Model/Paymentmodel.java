package Model;

public class Paymentmodel {

	private int payID;
	private float Totpay;
	private String payType;
	private String holdername;
	private String cardnumber;
	private String expDate;
	private int ccv;
	private int bid;
	private String date_curr;
	
	
	
	
	// getters and setters
	
	
	

	public String getDate_curr() {
		return date_curr;
	}

	public void setDate_curr(String date_curr) {
		this.date_curr = date_curr;
	}

	public int getPayID() {
		return payID;
	}

	public int getBid() {
		return bid;
	}

	public void setBid(int bid) {
		this.bid = bid;
	}

	public String getCardnumber() {
		return cardnumber;
	}

	public void setCardnumber(String cardnumber) {
		this.cardnumber = cardnumber;
	}

	public void setPayID(int payID) {
		this.payID = payID;
	}

	public float getTotpay() {
		return Totpay;
	}

	public void setTotpay(float totpay) {
		Totpay = totpay;
	}

	public String getPayType() {
		return payType;
	}

	public void setPayType(String payType) {
		this.payType = payType;
	}

	public String getHoldername() {
		return holdername;
	}

	public void setHoldername(String holdername) {
		this.holdername = holdername;
	}

	public String getExpDate() {
		return expDate;
	}

	public void setExpDate(String expDate) {
		this.expDate = expDate;
	}

	public int getCcv() {
		return ccv;
	}

	public void setCcv(int ccv) {
		this.ccv = ccv;
	}



}
