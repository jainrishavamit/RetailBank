package dao;

import bean.UserBean;

public interface UserDao {
	UserBean findUserById(String  l_username);
}