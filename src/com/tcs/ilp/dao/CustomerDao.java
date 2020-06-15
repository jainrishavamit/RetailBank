package com.tcs.ilp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tcs.ilp.bean.CustomerBean;
import com.tcs.ilp.util.DBConnection;


public class CustomerDao {

	
	//search customer function using SSN ID or Customer ID
	
	public CustomerBean searchCustomer(int id, String search_criteria)
	{
		
		try
		{
			
			Connection con=DBConnection.getConnection();
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `customer_info` WHERE "+search_criteria+"=? and CI_isActive=1" );
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) 
			{
				CustomerBean cus=new CustomerBean();
				cus.setCustomer_ssn_id(rs.getInt("CI_Cus_SSN_ID"));
				cus.setCustomer_id(rs.getInt("CI_Customer_ID"));
				cus.setCustomer_name(rs.getString("CI_Cus_Name"));
				cus.setCustomer_age(rs.getInt("CI_Cus_Age"));
				cus.setCustomer_address(rs.getString("CI_Cus_Address"));
				cus.setCustomer_city(rs.getString("CI_Cus_City"));
				cus.setCustomer_state(rs.getString("CI_Cus_State"));
				
				return cus;
			}
			
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		return null;
		
		
	}
	
	
	
	//update customer information function
	
	public boolean updateCustomer(CustomerBean cus)
	{
		try
		{
			Connection con=DBConnection.getConnection();
			PreparedStatement ps=con.prepareStatement("UPDATE `customer_info` SET CI_Cus_Name=? , CI_Cus_Age=? , CI_Cus_Address=?  WHERE CI_Customer_ID=? ");
			ps.setString(1,cus.getCustomer_name());
			ps.setInt(2,cus.getCustomer_age());
			ps.setString(3,cus.getCustomer_address());
			ps.setInt(4,cus.getCustomer_id());
			int rs=ps.executeUpdate();
			if(rs==1) 
			{
				return true;
			}
						
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return false;
	}
	
	
	
	//delete customer function using SSN ID or Customer ID
	
	public boolean deleteCustomer(int id, String delete_criteria)
	{
		try
		{
			Connection con=DBConnection.getConnection();
			PreparedStatement ps=con.prepareStatement("update customer_info set ci_isactive=0 WHERE "+delete_criteria+"=? ");
			ps.setInt(1,id);
			int rs=ps.executeUpdate();
			if(rs==1) 
			{
				return true;
			}
						
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		
		return false;
	}
	
	
	
}
