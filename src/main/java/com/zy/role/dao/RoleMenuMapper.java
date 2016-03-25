package com.zy.role.dao;

import java.util.List;

import com.zy.role.entities.RoleMenu;

public interface RoleMenuMapper {
    int deleteByPrimaryKey(Long id);

    int insert(RoleMenu record);

    int insertSelective(RoleMenu record);

    RoleMenu selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(RoleMenu record);

    int updateByPrimaryKey(RoleMenu record);

	List<RoleMenu> selectByRole(Long roleId);
}