package service;

import dao.UserDaoImpl;
import model.UserModel;

public class UserService {
	
	public boolean verifyUser(UserModel usr) {
		
		UserModel usrFromDb=new UserDaoImpl().findUserById(usr.getL_username());
		
		if(usrFromDb!=null && usrFromDb.getL_password().equals(usr.getL_password())) {
			
			
			usr.setL_role(usrFromDb.getL_role());
			usr.setL_status(usrFromDb.getL_status());
			usr.setL_id(usrFromDb.getL_id());
			return true;
		}
		return false;
		
	}

}