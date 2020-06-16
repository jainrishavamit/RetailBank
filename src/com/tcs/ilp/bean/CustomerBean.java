/**
 * 
 */
package com.tcs.ilp.bean;
		
//import java.security.Timestamp;
import java.util.Date;
import java.time.LocalDateTime;
//import java.sql.Timestamp;
	  					
/**
 * @author SUNIDHI HARRISON
 *
 */
public class CustomerBean {

	private int customer_ssn_id;
	private int customer_id;
	private String customer_name;
	private int customer_age;
	private String customer_address;
	private String customer_city;
	private String customer_state;
	
	private int customer_is_active;
	private String customer_message;
	private Date date_of_cus_creation;
	private Date last_updated;
								 
								   
						   
	
	public CustomerBean() {						 
								 
	}
 
	public CustomerBean(int customer_ssn_id,int customer_id,String customer_name,int customer_age,String customer_address,String customer_state,String customer_city,int customer_is_active,String customer_message,Date date_of_cus_creation,Date last_updated)
	{
		this.customer_ssn_id=customer_ssn_id;
		this.customer_id=customer_id;
		this.customer_name=customer_name;
		this.customer_age=customer_age;
		this.customer_address=customer_address;
		this.customer_state=customer_state;
		this.customer_city=customer_city;
		this.customer_is_active=customer_is_active;
		this.customer_message=customer_message;
		this.date_of_cus_creation=date_of_cus_creation;
		this.last_updated=last_updated;
	}
	
 
	public CustomerBean(int customer_ssn_id,int customer_id,String customer_name,int customer_age,String customer_address,String customer_state,String customer_city)
	{
		this.customer_ssn_id=customer_ssn_id;
		this.customer_id=customer_id;
		this.customer_name=customer_name;
		this.customer_age=customer_age;
		this.customer_address=customer_address;
		this.customer_state=customer_state;
		this.customer_city=customer_city;
											   
										   
												   
								   
	}
	
	
	
	
	/**
	 * @return the customer_ssn_id
	 */
	public int getCustomer_ssn_id()
	{
		return customer_ssn_id;
	}
	
	
	
	/**
	 * @return the customer_id
	 */
	public int getCustomer_id()
	{
		return customer_id;
	}
	
	
	
	/**
	 * @return the customer_name
	 */
	public String getCustomer_name()
	{
		return customer_name;
	}
	
	
	
	/**
	 * @return the customer_age
	 */
	public int getCustomer_age()
	{
		return customer_age;
	}
	
	
	
	/**
	 * @return the customer_address
	 */
	public String getCustomer_address()
	{
		return customer_address;
	}
	
	
	
	/**
	 * @return the customer_city
	 */
	public String getCustomer_city()
	{
		return customer_city;
	}
	
	
	
	/**
	 * @return the customer_state
	 */
	public String getCustomer_state()
	{
		return customer_state;
	}
	
	
	/**
		

	/**
	 * @return the customer_is_active
	 */
	public int getCustomer_is_active()
	{
		return customer_is_active;
	}
	
	
	
	/**
	 * @return the customer_message
	 */
	public String getCustomer_message()
	{
		return customer_message;
	}
	
	
	/**
	 * @return the date_of_cus_creation
	 */
	public Date getDate_of_cus_creation()
	{
		return date_of_cus_creation;
	}
	
	
	/**
	 * @return the last_updated
	 */
	public Date getLast_updated()
	{
		return last_updated;
	}
	
	/**			
	 * @param customer_ssn_id the customer_ssn_id to set
	 */
	public void setCustomer_ssn_id(int customer_ssn_id) {
		this.customer_ssn_id = customer_ssn_id;
	}

	
	
	
	/**
	 * @param customer_id the customer_id to set
	 */
	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}
	
	
	
	
	/**
	 * @param customer_name the customer_name to set
	 */
	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}
	
	
	
	
	/**
	 * @param customer_age the customer_age to set
	 */
	public void setCustomer_age(int customer_age) {
		this.customer_age = customer_age;
	}

	
	
	
	
	/**
	 * @param customer_address the customer_address to set
	 */
	public void setCustomer_address(String customer_address) {
		this.customer_address = customer_address;
	}
	
	
	
	
	
	/**
	 * @param customer_city the customer_city to set
	 */
	public void setCustomer_city(String customer_city) {
		this.customer_city = customer_city;
	}
	
	
	
	
	
	/**
	 * @param customer_state the customer_state to set
	 */
	public void setCustomer_state(String customer_state) {
		this.customer_state = customer_state;
	}
	
 
	/**
	 * @param customer_is_active the customer_is_active to set
	 */
	public void setCustomer_is_active(int customer_is_active) {
		this.customer_is_active = customer_is_active;
	}

	
	/**
	 * @param customer_message the customer_message to set
	 */
	public void setCustomer_message(String customer_message) {
		this.customer_message = customer_message;
	}
	
	/**
	 * @param date_of_cus_creation the date_of_cus_creation to set
	 */
	public void setDate_of_cus_creation(Date date_of_cus_creation) {
		this.date_of_cus_creation = date_of_cus_creation;
	}
	
	
	/**
	 * @param last_updated the last_updated to set
	 */
	public void setLast_updated(Date last_updated) {
		this.last_updated = last_updated;
	}
	

	@Override
	public String toString() {
		return "CustomerBean [customer_ssn_id=" + customer_ssn_id + ", customer_id=" + customer_id + ", customer_name=" + customer_name + ", customer_age="
				+ customer_age + ", customer_address="
						+ customer_address + ", customer_state=" + customer_state + ", customer_city=" + customer_city + "]";
	}
	
}
