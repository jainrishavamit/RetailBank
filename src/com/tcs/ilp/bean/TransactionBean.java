/**
 * 
 */
package com.tcs.ilp.bean;

import java.util.Date;

/**
 * @author SUNIDHI HARRISON
 *
 */
public class TransactionBean {

	private int t_id;
	private int t_acc_id;
	private Date t_transaction_date;
	private String t_source_acc;
	private String t_target_acc;
	private int t_amount;
	private String t_description;
	
	
	public TransactionBean()
	{
		
	}
	
	public TransactionBean(int t_id,int t_acc_id,Date t_transaction_date,String t_source_acc,String t_target_acc,int t_amount,String t_description)
	{
		this.t_id=t_id;
		this.t_acc_id=t_acc_id;
		this.t_transaction_date=t_transaction_date;
		this.t_source_acc=t_source_acc;
		this.t_target_acc=t_target_acc;
		this.t_amount=t_amount;
		this.t_description=t_description;
	}
	
	public int getT_id()
	{
		return this.t_id;
	}
	
	public int getT_acc_id()
	{
		return this.t_acc_id;
	}
	
	public Date getT_transaction_date()
	{
		return this.t_transaction_date;
	}
	
	public String getT_source_acc()
	{
		return this.t_source_acc;
	}
	
	public String getT_target_account()
	{
		return this.t_target_acc;
	}
	
	public int getT_amount()
	{
		return this.t_amount;
	}
	
	public String getT_description()
	{
		return this.t_description;
	}
	
	
	
	
	public void  setT_id(int t_id)
	{
		this.t_id=t_id;
	}
	
	public void setT_acc_id(int t_acc_id)
	{
		 this.t_acc_id=t_acc_id;
	}
	
	
	public void setT_transaction_date(Date t_transaction_date)
	{
		this.t_transaction_date=t_transaction_date;
	}
	
	public void setT_source_acc(String t_source_acc)
	{
		this.t_source_acc=t_source_acc;
	}
	
	public void setT_target_account(String t_target_acc)
	{
		this.t_target_acc=t_target_acc;
	}
	
	public void setT_amount(int t_amount)
	{
		this.t_amount=t_amount;
	}
	
	public void setT_description(String t_description)
	{
		this.t_description=t_description;
	}
	
}

