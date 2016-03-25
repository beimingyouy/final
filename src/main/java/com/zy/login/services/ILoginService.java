package com.zy.login.services;

import com.zy.login.entities.Admin;

public interface ILoginService {

	public Admin selectByPrimaryKey(String username);

}
