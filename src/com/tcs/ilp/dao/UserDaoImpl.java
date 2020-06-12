package com.tcs.ilp.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.tcs.ilp.bean.UserBean;
import com.tcs.ilp.util.DBConnection;

public class UserDaoImpl implements UserDao{

	@Override
	
	
	
	public UserBean findUserById(String l_username) {
		
		try {
			Connection con=DBConnection.getConnection();
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `login` WHERE L_Username like ?");
			ps.setString(1, l_username);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				UserBean user=new UserBean();
				user.setL_password(rs.getString("l_password"));
				user.setL_role(rs.getString("l_role"));
				user.setL_id(rs.getInt("l_id"));
				user.setL_username(l_username);
				return user;
		}
		
		}catch(Exception e) {
			e.printStackTrace();
		}
		return null; 
	}

	


}
