/**
 * 
 */
package com.tcs.ilp.service;

import java.util.ArrayList;

//import com.tcs.ilp.bean.AccountBean;
import com.tcs.ilp.bean.TransactionBean;
import com.tcs.ilp.dao.AccStatementdao_014;
import com.tcs.ilp.dao.AccountDao;

/**
 * @author SUNIDHI HARRISON
 *
 */
public class TransactionService {

	
	//function to view account status

	public ArrayList<TransactionBean> getTransaction(int id,int noOfTransactions)
	{
		
		ArrayList<TransactionBean> transactionsFromDb=new AccStatementdao_014().getTransaction(id,noOfTransactions);
		
		if(transactionsFromDb!=null) 
		{
			return transactionsFromDb;
		}
		return null;
		
	}	
	public ArrayList<TransactionBean> getTransactionBetweenDates(int id,String start,String end)
	{
		
		ArrayList<TransactionBean> transactionsFromDb=new AccStatementdao_014().getTransactionBetweenDates(id,start,end);
		
		if(transactionsFromDb!=null) 
		{
			return transactionsFromDb;
		}
		return null;
		
	}	
	
}
