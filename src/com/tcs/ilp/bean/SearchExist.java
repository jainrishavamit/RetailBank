package com.tcs.ilp.bean;

public class SearchExist {
	private int customer_age;
	private String customer_address;
	private String customer_city;
	private String customer_state;
	private long CustId;
	private long AccId;
	private Long customer_ssn_id;
	private String customer_name;
	
	public long getCustomer_ssn_id() {
		return customer_ssn_id;
	}
	public void setCustomer_ssn_id(long customer_ssn_id) {
		this.customer_ssn_id = customer_ssn_id;
	}
	public String getCustomer_name() {
		return customer_name;
	}
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	public int getCustomer_age() {
		return customer_age;
	}
	public void setCustomer_age(int customer_age) {
		this.customer_age = customer_age;
	}
	public String getCustomer_address() {
		return customer_address;
	}
	public void setCustomer_address(String customer_address) {
		this.customer_address = customer_address;
	}
	public String getCustomer_city() {
		return customer_city;
	}
	public void setCustomer_city(String customer_city) {
		this.customer_city = customer_city;
	}
	public String getCustomer_state() {
		return customer_state;
	}
	public void setCustomer_state(String customer_state) {
		this.customer_state = customer_state;
	}
	
	
	public long getCustId() {
		return CustId;
	}
	public void setCustId(long custId) {
		CustId = custId;
	}
	public long getAccId() {
		return AccId;
	}
	public void setAccId(long accId) {
		AccId = accId;
	}
	
}
