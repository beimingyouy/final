package com.zy.role.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zy.role.entities.Menu;



public interface MenuMapper {
    int deleteByPrimaryKey(Long menuId);

    int insert(Menu record);

    int insertSelective(Menu record);

    Menu selectByPrimaryKey(Long menuId);

    int updateByPrimaryKeySelective(Menu record);

    int updateByPrimaryKey(Menu record);
    
    List<Menu> selectByUserId(Long userId);
    
	List<Menu> selectChirdren(@Param("userId") Long userId,@Param("menuId") Long menuId);

	List<Menu> queryAll();
    

}