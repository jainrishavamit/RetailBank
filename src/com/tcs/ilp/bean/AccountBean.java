/**
 * 
 */
package com.tcs.ilp.bean;

import java.util.Date;
//import java.time.LocalDateTime;

/**
 * @author SUNIDHI HARRISON
 *
 */
public class AccountBean {
	
	private int account_id;
	private int customer_id;
	private String account_type;
	private int balance;			
	private Date date_of_acc_creation;
	private Date last_updated;
	private int account_status;
	private String account_message;
	private int account_duration;

	
	public AccountBean()
	{
		
	}
	
	public AccountBean(int account_id,int customer_id,String account_type,int balance,Date date_of_acc_creation,Date last_updated,int account_status,String account_message,int account_duration)
	{
		this.account_id=account_id;
		this.customer_id=customer_id;
		this.account_type=account_type;
		this.balance=balance;
		this.date_of_acc_creation=date_of_acc_creation;
		this.last_updated=last_updated;
		this.account_status=account_status;
		this.account_message=account_message;
		this.account_duration=account_duration;
		
	}
	
	
	/**
	 * @return the account_id
	 */
	public int getAccount_id()
	{
		return account_id;
	}
	
	
	

	/**
	 * @return the customer_id
	 */
	public int getCustomer_id()
	{
		return customer_id;
	}
	
	
	
	/**
	 * @return the account_type
	 */
	public String getAccount_type()
	{
		return account_type;
	}
	
	
	/**
	 * @return the balance
	 */
	public int getBalance()
	{
		return balance;
	}
	
	
	
	
	/**
	 * @return the date_of_acc_creation
	 */
	public Date getDate_of_acc_creation()
	{
		return date_of_acc_creation;
	}
	
	
	
	/**
	 * @return the last_updated
	 */
	public Date getLast_updated()
	{
		return last_updated;
	}
	
	
	
	/**
	 * @return the account_status
	 */
	public int getAccount_status()
	{
		return account_status;
	}
	
	
	
	
	/**
	 * @return the account_message
	 */
	public String getAccount_message()
	{
		return account_message;
	}
	
	
	
	/**
	 * @return the account_duration
	 */
	public int getAccount_duration()
	{
		return account_duration;
	}
	
	
	
	/**
	 * @param account_id the account_id to set
	 */
	public void setAccount_id(int account_id)
	{
		this.account_id=account_id;
	}
	
	
	

	/**
	 * @param customer_id the customer_id to set
	 */
	public void setCustomer_id(int customer_id)
	{
		this.customer_id=customer_id;
	}
	
	
	
	/**
	 * @param account_type the account_type to set
	 */
	public void setAccount_type(String account_type)
	{
		this.account_type=account_type;
	}
	
	
	/**
	 * @param balance the balance to set
	 */
	public void setBalance(int balance)
	{
		this.balance=balance;
	}
	
	
	
	/**
	 * @param date_of_acc_creation the date_of_acc_creation to set
	 */
	public void setDate_of_acc_creation(Date date_of_acc_creation)
	{
		this.date_of_acc_creation=date_of_acc_creation;
	}
	
	
	
	/**
	 * @param last_updated the last_updated to set
	 */
	public void setLast_updated(Date last_updated)
	{
		this.last_updated=last_updated;
	}
	
	
	
	/**
	 * @param account_status the account_status to set
	 */
	public void setAccount_status(int account_status)
	{
		this.account_status=account_status;
	}
	
	
	
	/**
	 * @param account_message the account_message to set
	 */
	public void setAccount_message(String account_message)
	{
		this.account_message=account_message;
	}
	
	
	/**
	 * @param account_duration the account_duration to set
	 */
	public void setAccount_duration(int account_duration)
	{
		this.account_duration=account_duration;
	}
	
	
	
}
