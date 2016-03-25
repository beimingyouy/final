package com.zy.role.services;

import java.util.List;
import java.util.Map;

import com.zy.role.entities.Role;

public interface roleService {
 
	
	public  Map<String, Object> queryAll(int rows,int page,Role role);

	public Role selectByPrimaryKey(Long roleId);

	public List<Map<String, Object>> getMenuTree(Long roleId);

	public int add(String total_checked_id, String roleName, String note);

	public int delete(Long id);

	public int update(Role role, String total_checked_id);

		
		
	
}
