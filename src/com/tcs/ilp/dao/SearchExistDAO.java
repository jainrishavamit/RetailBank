package com.tcs.ilp.dao;

import java.sql.Connection;
//import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tcs.ilp.bean.SearchExist;
import com.tcs.ilp.util.DBConnection;

public class SearchExistDAO {

	public boolean custexist(SearchExist search) {
		if(search.getCustId()==0)
		{
				Connection con=DBConnection.getConnection();
				PreparedStatement ps = null;
				try {
					ps = con.prepareStatement("SELECT * FROM `account_info` WHERE AI_Acc_ID like ?");
					ps.setLong(1, search.getAccId());
					ResultSet rs=ps.executeQuery();
					if(rs.next()) {
						String acc = rs.getString("AI_Acc_Type");
						if(acc.matches("C"))
						{
							search.setCustId(rs.getLong("AI_Cus_ID"));
							search.setAccIdC(rs.getLong("AI_Acc_ID"));
							search.setBalanceC(rs.getLong("AI_Balance"));
							int a = rs.getInt("AI_Status");
							if(a==0)
							{search.setStatusC("InActive");}
							else
							{search.setStatusC("Active");}
							
							
							java.sql.Time stime = rs.getTime("AI_Date_of_Creation");
							java.sql.Date sdate = rs.getDate("AI_Date_of_Creation");
							String date= sdate.toString()+" "+stime.toString();
							search.setDateCreationC(date);
							java.sql.Time stimeu = rs.getTime("AI_Last_Updated");
							java.sql.Date sdateu = rs.getDate("AI_Last_Updated");
							String dateu= sdateu.toString()+" "+stimeu.toString();
							search.setDateUpdateC(dateu);
						}if(acc.matches("S"))
						{
							
							search.setCustId(rs.getLong("AI_Cus_ID"));
							search.setAccIdS(rs.getLong("AI_Acc_ID"));
							search.setBalanceS(rs.getLong("AI_Balance"));
							int a = rs.getInt("AI_Status");
							if(a==0)
							{search.setStatusS("InActive");}
							else
							{search.setStatusS("Active");}
							java.sql.Time stime = rs.getTime("AI_Date_of_Creation");
							java.sql.Date sdate = rs.getDate("AI_Date_of_Creation");
							String date= sdate.toString()+" "+stime.toString();
							search.setDateCreationS(date);
							java.sql.Time stimeu = rs.getTime("AI_Last_Updated");
							java.sql.Date sdateu = rs.getDate("AI_Last_Updated");
							String dateu= sdateu.toString()+" "+stimeu.toString();
							search.setDateUpdateS(dateu);
						}
						ps.close();
						return true;
						}
					else {ps.close();return false;}
				} catch (SQLException e) {e.printStackTrace();}
				
		}
		else if(search.getAccId()==0)
		{
			int ac=1;
			Connection con=DBConnection.getConnection();
			PreparedStatement ps1 = null;
			
			try {
				ps1 = con.prepareStatement("SELECT * FROM `account_info` WHERE AI_Cus_ID like ?");
				ps1.setLong(1, search.getCustId());
				ResultSet rs1=ps1.executeQuery();
				while(rs1.next()) 
				{
					ac=0;
					String acc = rs1.getString("AI_Acc_Type");
					if(acc.equals("C"))
					{	
						search.setCustId(rs1.getLong("AI_Cus_ID"));
						search.setAccIdC(rs1.getLong("AI_Acc_ID"));
						search.setBalanceC(rs1.getLong("AI_Balance"));
						
						int a = rs1.getInt("AI_Status");
						if(a==1)
						{search.setStatusC("Active");}
						else
						{search.setStatusC("InActive");}
						
						
						java.sql.Time stime = rs1.getTime("AI_Date_of_Creation");
						java.sql.Date sdate = rs1.getDate("AI_Date_of_Creation");
						String date= sdate.toString()+" "+stime.toString();
						search.setDateCreationC(date);
						java.sql.Time stimeu = rs1.getTime("AI_Last_Updated");
						java.sql.Date sdateu = rs1.getDate("AI_Last_Updated");
						String dateu= sdateu.toString()+" "+stimeu.toString();
						search.setDateUpdateC(dateu);
					}else
					{
						search.setCustId(rs1.getLong("AI_Cus_ID"));
						search.setAccIdS(rs1.getLong("AI_Acc_ID"));
						search.setBalanceS(rs1.getLong("AI_Balance"));
						int a = rs1.getInt("AI_Status");
						if(a==1)
						{search.setStatusS("Active");}
						else
						{search.setStatusS("InActive");}
						java.sql.Time stime = rs1.getTime("AI_Date_of_Creation");
						java.sql.Date sdate = rs1.getDate("AI_Date_of_Creation");
						String date= sdate.toString()+" "+stime.toString();
						search.setDateCreationS(date);
						java.sql.Time stimeu = rs1.getTime("AI_Last_Updated");
						java.sql.Date sdateu = rs1.getDate("AI_Last_Updated");
						String dateu= sdateu.toString()+" "+stimeu.toString();
						search.setDateUpdateS(dateu);
					}
				}
				if(ac==1) {
						PreparedStatement ps2 = null;
						ps2 = con.prepareStatement("SELECT CI_Customer_ID FROM `customer_info` WHERE CI_Customer_ID Like ?");
						ps2.setLong(1, search.getCustId());
						ResultSet rs2=ps2.executeQuery();
						if(rs2.next()) {
							search.setCust(1);
							}
						return false;
						}
				ps1.close();
				return true;
			} catch (SQLException e) {e.printStackTrace();}
		}
		
		
		return false;
	}
}