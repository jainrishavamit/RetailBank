/**
 * 
 */
package com.tcs.ilp.service;

import java.util.ArrayList;

import com.tcs.ilp.bean.AccountBean;
//import com.tcs.ilp.bean.CustomerBean;
//import com.tcs.ilp.dao.CustomerDao;
import com.tcs.ilp.dao.AccountDao;

/**
 * @author SUNIDHI HARRISON
 *
 */
public class AccountService {

	
	//function to view account status
	
			public ArrayList<AccountBean> viewAccountStatus()
			{
				
				ArrayList<AccountBean> accountsFromDb=new AccountDao().viewAccountStatus();
				
				if(accountsFromDb!=null) 
				{
					return accountsFromDb;
				}
				return null;
				
			}		
	
	
}
