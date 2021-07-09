package Model;


	public class Customer {
		
		private String Date;
		private String FirstName;
		private String LastName;
		private String NIC;
		private String Address;
		private String Phone;
		private String Email;
		
		
		public String getDate() {
			return Date;
		}
		public void setDate(String date) {
			Date = date;
		}
		public String getFirstName() {
			return FirstName;
		}
		public void setFirstName(String firstName) {
			FirstName = firstName;
		}
		public String getLastName() {
			return LastName;
		}
		public void setLastName(String lastName) {
			LastName = lastName;
		}
		public String getNIC() {
			return NIC;
		}
		public void setNIC(String nIC) {
			NIC = nIC;
		}
		public String getAddress() {
			return Address;
		}
		public void setAddress(String address) {
			Address = address;
		}
		public String getPhone() {
			return Phone;
		}
		public void setPhone(String phone) {
			Phone = phone;
		}
		public String getEmail() {
			return Email;
		}
		public void setEmail(String email) {
			Email = email;
		}
		
		@Override
		public String toString() {
			return "Customer [Date=" + Date + ", FirstName=" + FirstName + ", LastName=" + LastName + ", NIC=" + NIC
					+ ", Address=" + Address + ", Phone=" + Phone + ", Email=" + Email + "]";
		}
		
		
		
		
	}


