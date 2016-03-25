package com.zy.login.dao;

import com.zy.login.entities.Admin;

public interface LoginMapper {
	void test();
	Admin selectByPrimaryKey(String username);

}
