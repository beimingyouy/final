package com.zy.user.services.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zy.user.dao.UserMapper;
import com.zy.user.entities.User;
import com.zy.user.services.UserService;
@Service
public class UserServiceImpl implements UserService {

	@Autowired 
	private UserMapper userMapper;
	public User selectByPrimaryKey(String username) {
		
		return userMapper.selectByPrimaryKey(username);
	}
	public  Map<String, Object> queryAll(int rows,int pagenum ,User user) {
		
		Map<String, Object> datemap = new HashMap<String, Object>();
		
		int start = rows*(pagenum-1);
		int end = rows*pagenum;
		Integer tatol = userMapper.getTotal(user.getUsername(),user.getSex());
		datemap.put("rows", userMapper.queryAll(start,end,user.getUsername(),user.getSex()));
		datemap.put("total", tatol);
		return datemap;
	}
	public int insert(User user) {
		
		return userMapper.insertSelective(user);
	}
	public int update(User user) {
		
		return userMapper.updateByPrimaryKeySelective(user);
	}
	public int delete(Long id) {
		
		return userMapper.deleteByPrimaryKey(id);
	}

}
