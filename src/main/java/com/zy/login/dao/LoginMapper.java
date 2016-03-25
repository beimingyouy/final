package com.zy.login.dao;

import com.zy.login.entities.Admin;

public interface LoginMapper {

	Admin selectByPrimaryKey(String username);

}
