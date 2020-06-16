/**
 * 
 */
package com.tcs.ilp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import com.tcs.ilp.bean.AccountBean;
//import com.tcs.ilp.bean.CustomerBean;
import com.tcs.ilp.util.DBConnection;

/**
 * @author SUNIDHI HARRISON
 *
 */
public class AccountDao {

	
	//view account status function
	
			public ArrayList<AccountBean> viewAccountStatus()
			 
			{
				ArrayList<AccountBean> accountArray=new ArrayList<AccountBean>();
				
				try
				{
					
					Connection con=DBConnection.getConnection();
					PreparedStatement ps=con.prepareStatement("SELECT * FROM `account_info`");
					ResultSet rs=ps.executeQuery();
					while(rs.next()) 
					{
						AccountBean acc=new AccountBean();
						acc.setAccount_id(rs.getInt("AI_Acc_ID"));
						acc.setCustomer_id(rs.getInt("AI_Cus_ID"));
						acc.setAccount_type(rs.getString("AI_Acc_Type"));
						acc.setAccount_status(rs.getInt("AI_Status"));
						acc.setAccount_message(rs.getString("AI_Message"));
						acc.setLast_updated(rs.getTimestamp("AI_Last_Updated"));
						accountArray.add(acc);
					}
					return accountArray;
				}
				catch(Exception e)
				{
					e.printStackTrace();
				}
				return null;
				
			}	
	
}
