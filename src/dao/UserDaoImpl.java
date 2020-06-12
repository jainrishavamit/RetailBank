package dao;

import model.UserModel;
import java.sql.*;

public class UserDaoImpl implements UserDao{

	@Override
	public UserModel findUserById(String l_username) {
		
		try {
			Connection con=DBConnection.getConnection();
			PreparedStatement ps=con.prepareStatement("SELECT * FROM `login` WHERE L_Username like ?");
			ps.setString(1, l_username);
			ResultSet rs=ps.executeQuery();
			if(rs.next()) {
				UserModel user=new UserModel();
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
