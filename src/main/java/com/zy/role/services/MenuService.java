package com.zy.role.services;

import java.util.List;
import java.util.Map;

import com.zy.role.entities.Menu;

public interface MenuService {

	List<Menu> getMainList(Long userid);

	List<Map<String, Object>> getMenuTreeByParentId(Long userId,Long menuId);

	Menu selectByPrimaryKey(Long id);

	List<Map<String, Object>> getMenuTree();

	int insert(Menu menu);

	void delete(Long valueOf);

	void deleteByParentId(Long id);

	int update(Menu menu);

}
