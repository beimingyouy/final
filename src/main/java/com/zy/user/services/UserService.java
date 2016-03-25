package com.zy.user.services;
import java.util.Map;

import com.zy.user.entities.User;


public interface UserService {

	public User selectByPrimaryKey(String username);

	public Map<String, Object> queryAll(int rows,int page,User user);

	public int insert(User user);

	public int update(User user);

	public int delete(Long long1);

}
