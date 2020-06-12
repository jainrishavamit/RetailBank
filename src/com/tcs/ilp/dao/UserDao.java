package com.tcs.ilp.dao;

import com.tcs.ilp.bean.UserBean;

public interface UserDao {
	UserBean findUserById(String  l_username);
}