package Model;

public class Driver {
	
	private int driverid;
	
	private String name;
    private String address;
    private String email;
    private String licence_num;
    private String dob;
    
    private String mobile;
    private float salary;
    
    
	public float getSalary() {
		return salary;
	}
	public void setSalary(float salary) {
		this.salary = salary;
	}
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public int getDriverid() {
		return driverid;
	}
	public void setDriverid(int driverid) {
		this.driverid = driverid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getLicence_num() {
		return licence_num;
	}
	public void setLicence_num(String licence_num) {
		this.licence_num = licence_num;
	}
	public String getDob() {
		return dob;
	}
	public void setDob(String dob) {
		this.dob = dob;
	}
	@Override
	public String toString() {
		return "Driver [driverid=" + driverid + ", name=" + name + ", address=" + address + ", email=" + email
				+ ", licence_num=" + licence_num + ", dob=" + dob + ", mobile=" + mobile + ", salary=" + salary + "]";
	}
	
	
	
	
	
	
	
	
	
	
    
    
}
