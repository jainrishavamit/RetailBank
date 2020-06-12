package dao;

import model.UserModel;

public interface UserDao {
	UserModel findUserById(String  l_username);
}