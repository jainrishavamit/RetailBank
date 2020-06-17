package com.tcs.ilp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import com.tcs.ilp.util.DBConnection;

public class DeleteAccountdao_007 {
	public boolean DeleteAccount(String CustomerId, String AccountType) {
		try {
			if (AccountType.equals("Current")) {
				AccountType = "C";
			} else
				AccountType = "S";
			Connection con = DBConnection.getConnection();

			PreparedStatement ps = con
					.prepareStatement("delete from account_info where AI_Acc_ID = ? And AI_Acc_Type=?");
			ps.setString(1, CustomerId);
			ps.setString(2, AccountType);

			int rs = 0;
			rs = ps.executeUpdate();
			if (rs > 0) {
				return true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return false;
	}

}
