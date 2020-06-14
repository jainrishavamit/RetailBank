package com.tcs.ilp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tcs.ilp.bean.CustomerBean;
import com.tcs.ilp.util.DBConnection;


public class CustomerDao {


	
	public CustomerBean searchCustomer(int id, String search_criteria)
	{

		
		try
		{
			
			Connection con=DBConnection.getConnection();
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `customer_info` WHERE "+search_criteria+"=? ");
			ps.setInt(1, id);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
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
	
}
