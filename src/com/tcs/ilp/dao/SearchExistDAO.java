package com.tcs.ilp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tcs.ilp.bean.SearchExist;
import com.tcs.ilp.util.DBConnection;

public class SearchExistDAO {

	public boolean custexist(SearchExist search) {
		
		
		System.out.println("helloasdsaca");
		
		if(search.getCustId()==0)
		{
				Connection con=DBConnection.getConnection();
				PreparedStatement ps = null;
				try {
					ps = con.prepareStatement("SELECT * FROM `customer_info` WHERE CI_Customer_ID = (SELECT AI_Cus_ID FROM `account_info` WHERE AI_Acc_ID like ?)");
					ps.setLong(1, search.getAccId());
					ResultSet rs=ps.executeQuery();
					if(rs.next()) {
						search.setCustomer_address(rs.getString("CI_Cus_Address"));
						search.setCustomer_age(rs.getInt("CI_Cus_Age"));
						search.setCustomer_city(rs.getString("CI_Cus_City"));
						search.setCustomer_name(rs.getString("CI_Cus_Name"));
						search.setCustomer_ssn_id(rs.getLong("CI_Cus_SSN_ID"));
						search.setCustomer_state(rs.getString("CI_Cus_State"));
						ps.close();
						return true;
						}
					else {ps.close();return false;}
				} catch (SQLException e) {e.printStackTrace();}
				
		}
		else if(search.getAccId()==0)
		{
			Connection con=DBConnection.getConnection();
			PreparedStatement ps1 = null;
			try {
				ps1 = con.prepareStatement("SELECT * FROM `customer_info` WHERE CI_Customer_ID like ?");
				ps1.setLong(1, search.getCustId());
				ResultSet rs1=ps1.executeQuery();
				if(rs1.next()) {
					search.setCustomer_address(rs1.getString("CI_Cus_Address"));
					search.setCustomer_age(rs1.getInt("CI_Cus_Age"));
					search.setCustomer_city(rs1.getString("CI_Cus_City"));
					search.setCustomer_name(rs1.getString("CI_Cus_Name"));
					search.setCustomer_ssn_id(rs1.getLong("CI_Cus_SSN_ID"));
					search.setCustomer_state(rs1.getString("CI_Cus_State"));
					ps1.close();
					return true;
					}
				else {ps1.close();return false;}
			} catch (SQLException e) {e.printStackTrace();}
		}
		
		
		return false;
	}
}