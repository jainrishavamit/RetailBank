package com.tcs.ilp.bean;

public class NewCustomer {
	private Long customerSSNId;
    private String cusomerName;
    private int age;
    private String address;
    private String state;
    private String city;
    
	
	public NewCustomer() {
		// TODO Auto-generated constructor stub
	}
	
	public Long getCustomerSSNId() {
		return customerSSNId;
	}

	public void setCustomerSSNId(Long customerSSNId) {
		this.customerSSNId = customerSSNId;
	}

	public String getCusomerName() {
		return cusomerName;
	}
	public void setCusomerName(String cusomerName) {
		this.cusomerName = cusomerName;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
}
