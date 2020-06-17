package com.tcs.ilp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tcs.ilp.util.DBConnection;



public class CreateAccountdao {
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
		} else AccountType="S";
			Connection con=DBConnection.getConnection(); 
			java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
			PreparedStatement ps=con.prepareStatement("Insert into account_info (AI_Acc_ID,AI_Cus_ID,AI_Acc_Type,AI_Balance,AI_Date_Of_Creation,AI_Last_Updated,AI_Status,AI_Message) values (?,?,?,?,?,?,?,?)");
			ps.setString(1,CustomerId); 	
			ps.setString(2,CustomerId);
			ps.setString(3,AccountType);
			ps.setString(4,Balance); 
			ps.setTimestamp(5, date);
			ps.setTimestamp(6, date);
			ps.setString(7,"active");
			ps.setString(8, "message");
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
	

}
