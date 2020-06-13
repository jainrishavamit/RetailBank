package com.tcs.ilp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tcs.ilp.bean.NewCustomer;
import com.tcs.ilp.util.DBConnection;
public class NewCustDAo {

	
	public static boolean insertCust(NewCustomer newCust)
	{
//		boolean status = false;
		Connection conn = null;
		PreparedStatement ps = null;
		PreparedStatement ps1 = null;
		conn = DBConnection.getConnection();
		if(conn != null)
		{
			try {	
					ps1=conn.prepareStatement("SELECT CI_Cus_SSN_ID FROM customer_info WHERE CI_Cus_SSN_ID like ?");
					ps1.setLong(1,newCust.getCustomerSSNId());
					ResultSet rs=ps1.executeQuery();
					if(rs.next()) {
						newCust.setCustomerSSNId(-1L);
						return false;
					}
				ps1.close();
				ps = conn.prepareStatement("insert into customer_info(CI_Cus_SSN_ID,CI_Cus_Name,CI_Cus_Age,CI_Cus_Address,CI_Cus_State,CI_Cus_City) values (?,?,?,?,?,?)");
				ps.setLong(1, newCust.getCustomerSSNId());
				ps.setString(2, newCust.getCusomerName());
				ps.setInt(3, newCust.getAge());
				ps.setString(4, newCust.getAddress());
				ps.setString(5, newCust.getState());
				ps.setString(6, newCust.getCity());
				
				ps.execute();
				
			} catch (SQLException e) {
				
				e.printStackTrace();
			}
			finally {
				try {
					ps.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
		}
		else
		{
			newCust.setCustomerSSNId(-2L);
			return false;
		}
		return true;
		
				
		
	}
	
}
