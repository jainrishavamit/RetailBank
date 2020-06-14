package com.tcs.ilp.service;

import com.tcs.ilp.bean.CustomerBean;
import com.tcs.ilp.dao.CustomerDao;

public class CustomerService {


	
	public CustomerBean searchCustomer(int id, String search_criteria)
	{
		
		CustomerBean cusFromDb=new CustomerDao().searchCustomer(id,search_criteria);
		
		if(cusFromDb!=null) 
		{
			return cusFromDb;
		}
		return null;
		
	}
	
	
	
}
