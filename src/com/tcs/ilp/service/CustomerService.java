package com.tcs.ilp.service;

import java.util.ArrayList;
				   
import com.tcs.ilp.bean.CustomerBean;
import com.tcs.ilp.dao.CustomerDao;

public class CustomerService {


	
	//function to search customer based on ID/SSN ID
	
	public CustomerBean searchCustomer(int id, String search_criteria,boolean considerInactives)
	{
		
		CustomerBean cusFromDb=new CustomerDao().searchCustomer(id,search_criteria,considerInactives);
		
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
		
 
  
									
		
		public boolean hasActiveAccounts(CustomerBean cus) {
			return new CustomerDao().hasActiveAccounts(cus);
	   					   
		}
			   

		//function to view customer status
		
		public ArrayList<CustomerBean> viewCustomerStatus()
		{
			
			ArrayList<CustomerBean> customersFromDb=new CustomerDao().viewCustomerStatus();
			
			if(customersFromDb!=null) 
			{
				return customersFromDb;
			}
			return null;
			
		}			
}
