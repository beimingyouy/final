package com.zy.role.services.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zy.role.dao.UserRoleMapper;
import com.zy.role.entities.UserRole;
import com.zy.role.services.UserRoleService;
@Service
public class UserRoleServiceImpl implements UserRoleService {
	@Autowired
	UserRoleMapper userRoleMapper;

	public UserRole selectByPrimaryUserId(Long userid) {

		return userRoleMapper.selectByPrimaryUserid(userid);
	}

	public int updateByPrimaryKeySelective(UserRole newUserRole) {
		
		return userRoleMapper.updateByPrimaryKeySelective(newUserRole);
	}

	public int insertSelective(UserRole newUserRole) {
		
		return userRoleMapper.insertSelective(newUserRole);
	}

}
