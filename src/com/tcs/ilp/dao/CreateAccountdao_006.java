package com.tcs.ilp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tcs.ilp.util.DBConnection;



public class CreateAccountdao_006 {
	public boolean Account(String CustomerId) {
		boolean result = false;
		try { 
			
			Connection con=DBConnection.getConnection();
			PreparedStatement ps=con.prepareStatement("SELECT * FROM customer_info WHERE CI_Customer_ID LIKE ?");
			ps.setString(1,CustomerId);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {			
				
				result = true;
		}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result; 
	} 
	public boolean InsertAccount(String CustomerId,String AccountType,String Balance) {
		try { if(AccountType.equals("Current")) {
			AccountType="C";
		} else { AccountType="S";}  
		
			Connection con=DBConnection.getConnection(); 
			java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
			PreparedStatement ps=con.prepareStatement("Insert into account_info (AI_Cus_ID,AI_Acc_Type,AI_Balance,AI_Date_Of_Creation,AI_Last_Updated,AI_Status,AI_Message) values (?,?,?,?,?,?,?)");
			ps.setString(1,CustomerId); 	
			
			ps.setString(2,AccountType);
			ps.setString(3,Balance); 
			ps.setTimestamp(4, date);
			ps.setTimestamp(5, date);
			ps.setInt(6, 1);
			ps.setString(7, "Account Created");
			int rs=0;
			 rs=ps.executeUpdate();
			if(rs>0) { 
				return true;
		}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false; 
	} 
	
	public boolean checkcustomer(String CustomerId,String AccountType) {
		boolean result=false;
		try { 
			
			if(AccountType.equals("Current")) {
			AccountType="C";
		} else { AccountType="S";}  
		
			Connection con=DBConnection.getConnection(); 
			
			PreparedStatement ps=con.prepareStatement("Select AI_Cus_ID,AI_Acc_Type from account_info where AI_Cus_ID = ? And AI_Acc_Type= ? ");
			ps.setString(1,CustomerId); 	
			ps.setString(2,AccountType);
			
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {			
				
				result = true;
		
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	public boolean AddTransection(String CustomerId,String Balance,String AccountType) { 
		try {   if(AccountType.equals("Current")) {
			AccountType="C";
		} else { AccountType="S";} 
		
			Connection con=DBConnection.getConnection(); 
			java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
			PreparedStatement ps=con.prepareStatement("Insert into transactions (T_Acc_ID,T_Transaction_Date,T_Source_Acc_Type,T_Target_Acc_Type,T_Amount,T_Description) values (?,?,?,?,?,?)");
		
			ps.setString(1,CustomerId); 	
			ps.setTimestamp(2, date);
			ps.setString(3, AccountType);
			ps.setString(4,AccountType);
			ps.setString(5,Balance); 
			ps.setString(6, "deposit");
			int rs=0;
			 rs=ps.executeUpdate();
			if(rs>0) { 
				return true;
		}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return false;
		
	} 
	public String FindAccID(String CustomerId,String AccountType) {
	   String result ="";
		try { 
			if(AccountType.equals("Current"))
			{
			AccountType="C";
		} 
		else
		{ AccountType="S";
		}

			Connection con=DBConnection.getConnection(); 
			
			PreparedStatement ps=con.prepareStatement("Select AI_Acc_ID from account_info where AI_Cus_ID = ? And AI_Acc_Type= ? ");
			ps.setString(1,CustomerId); 	
			ps.setString(2,AccountType);
			
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {			
				
				result=rs.getString("AI_Acc_ID");
		
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return result;
	}

}
