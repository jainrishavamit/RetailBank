package com.tcs.ilp.service;

import com.tcs.ilp.bean.CustomerBean;
import com.tcs.ilp.dao.CustomerDao;

public class CustomerService {


	
	//function to search customer based on ID/SSN ID
	
	public CustomerBean searchCustomer(int id, String search_criteria)
	{
		
		CustomerBean cusFromDb=new CustomerDao().searchCustomer(id,search_criteria);
		
		if(cusFromDb!=null) 
		{
			return cusFromDb;
		}
		return null;
		
	}
	
	
	
	
	//function to update customer based on ID/SSN ID
	
	public boolean updateCustomer(CustomerBean cus)
	{
		boolean update_status=new CustomerDao().updateCustomer(cus);
		return update_status;
	}
	
	
	
	
	//function to delete customer based on ID/SSN ID
	
		public boolean deleteCustomer(int id, String delete_criteria)
		{
			boolean update_status=new CustomerDao().deleteCustomer(id,delete_criteria);
			return update_status;
		}
		
	
		
}
