package com.zy.login.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zy.login.dao.LoginMapper;
import com.zy.login.entities.Admin;
import com.zy.login.services.ILoginService;

@Service
@Transactional
public class ILoginServiceImpl implements ILoginService {
	
	@Autowired
	private LoginMapper loginMapper;

	@Override
	public Admin selectByPrimaryKey(String username) {
		return loginMapper.selectByPrimaryKey(username);
	}
}
