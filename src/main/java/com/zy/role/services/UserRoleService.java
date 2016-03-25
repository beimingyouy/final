package com.zy.role.services;

import com.zy.role.entities.UserRole;

public interface UserRoleService {

	UserRole selectByPrimaryUserId(Long userid);

	int updateByPrimaryKeySelective(UserRole newUserRole);

	int insertSelective(UserRole newUserRole);

}
