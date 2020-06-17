package com.tcs.ilp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.tcs.ilp.bean.DepWithBean;
import com.tcs.ilp.util.DBConnection;

public class DepoDAO {

	public boolean depo(DepWithBean depo) {
		
		Connection con=DBConnection.getConnection();
		PreparedStatement ps = null;
		PreparedStatement ps1 = null;
		try {
				ps = con.prepareStatement("UPDATE `account_info` SET `AI_Balance` = `AI_Balance` + ? , `AI_Status` = '1' WHERE `AI_Acc_ID` = ?");
				ps.setLong(1, depo.getAmount());
				ps.setLong(2, depo.getAccId());
				ps.execute();
				ps.close();
				ps1 = con.prepareStatement("INSERT INTO `transactions` (`T_ACC_ID`,`T_Amount`,`T_Description`) VALUES (?,?,'deposit')");
				ps1.setLong(1,depo.getCustId());
				ps1.setLong(2,depo.getAmount());
				ps1.execute();
				ps1.close();
				return true;
			
		} catch (SQLException e) {e.printStackTrace();}
		
		
		return false;
	}

	public boolean with(DepWithBean depo) {
		Connection con=DBConnection.getConnection();
		PreparedStatement ps = null;
		PreparedStatement ps1 = null;
		try {
				ps = con.prepareStatement("UPDATE `account_info` SET `AI_Balance` = `AI_Balance` - ? , `AI_Status` = '1' WHERE `AI_Acc_ID` = ?");
				ps.setLong(1, depo.getAmount());
				ps.setLong(2, depo.getAccId());
				ps.execute();
				ps.close();
				ps1 = con.prepareStatement("INSERT INTO `transactions` (`T_ACC_ID`,`T_Amount`,`T_Description`) VALUES (?,?,'withdraw')");
				ps1.setLong(1,depo.getAccId());
				ps1.setLong(2,depo.getAmount());
				ps1.execute();
				ps1.close();
				return true;
			
		} catch (SQLException e) {e.printStackTrace();}
		
		
		return false;
	}

	public boolean Transfer(DepWithBean depo) {
		Connection con=DBConnection.getConnection();
		PreparedStatement ps = null;
		PreparedStatement ps1 = null;
		PreparedStatement ps2 = null;
		PreparedStatement ps3 = null;
		PreparedStatement ps4 = null;
		try {
				
				ps = con.prepareStatement("SELECT AI_Status,AI_Acc_Type FROM `account_info` WHERE AI_Acc_ID Like ? ");
				ps.setLong(1, depo.getDesAccId());
				ResultSet rs=ps.executeQuery();
				if(rs.next()) 
				{
					int state = rs.getInt("AI_Status");
					String desTy=rs.getString("AI_Acc_Type");
					if(state>0)
					{
						ps1 = con.prepareStatement("UPDATE `account_info` SET `AI_Balance` = `AI_Balance` - ?  WHERE `AI_Acc_ID` = ?");
						ps1.setLong(1,depo.getAmount());
						ps1.setLong(2,depo.getAccId());
						ps1.execute();
						ps1.close();
						ps2 = con.prepareStatement("UPDATE `account_info` SET `AI_Balance` = `AI_Balance` + ?  WHERE `AI_Acc_ID` = ?");
						ps2.setLong(1,depo.getAmount());
						ps2.setLong(2,depo.getDesAccId());
						ps2.execute();
						ps2.close();
						ps3 = con.prepareStatement("INSERT INTO `transactions`(`T_ACC_ID`,`T_Source_Acc_Type`,`T_Target_Acc_Type`,`T_Amount`,`T_Description`) VALUES (?,?,?,?,?)");
						ps3.setLong(1, depo.getDesAccId());
						ps3.setString(2,desTy);
						ps3.setString(3, depo.getSource());
						ps3.setLong(4, depo.getAmount());
						ps3.setString(5,"deposit");
						ps3.execute();
						ps3.close();
						ps4 = con.prepareStatement("INSERT INTO `transactions`(`T_ACC_ID`,`T_Source_Acc_Type`,`T_Target_Acc_Type`,`T_Amount`,`T_Description`) VALUES (?,?,?,?,?)");
						ps4.setLong(1, depo.getAccId());
						ps4.setString(2,depo.getSource());
						ps4.setString(3, desTy);
						ps4.setLong(4, depo.getAmount());
						ps4.setString(5,"Withdraw");
						ps4.execute();
						ps4.close();
						return true;
					}
					else
					{	ps.close();
						depo.setStatus("InActive");
						return false;
					}
				}
				else
				{	ps.close();
					depo.setDesAccId(-1L);
					return false;
				}
			
		} catch (SQLException e) {e.printStackTrace();}
		return false;
	}

}
