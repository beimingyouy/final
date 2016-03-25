package com.zy.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zy.role.entities.Role;
import com.zy.user.entities.User;

public interface UserMapper {
    int deleteByPrimaryKey(Long userid);

    int insert(User user);

    int insertSelective(User record);

    User selectByPrimaryKey(String username);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

	List<Role> queryAll(@Param("start")int start,@Param("end")int end,@Param("username")String  username,@Param("sex")Long sex);

	Integer getTotal(@Param("username")String  username,@Param("sex")Long sex);
}