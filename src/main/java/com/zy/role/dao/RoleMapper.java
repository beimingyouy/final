package com.zy.role.dao;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zy.role.entities.Role;

public interface RoleMapper {
    int deleteByPrimaryKey(Long roleId);

    int insert(Role record);

    int insertSelective(Role record);

    Role selectByPrimaryKey(Long roleId);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);

	List<Role> queryAll(@Param("start")int start,@Param("end")int end,@Param("roleName")String roleName);

	Integer getTotal(@Param("roleName")String roleName);

	Role querybyName(String roleName);
}