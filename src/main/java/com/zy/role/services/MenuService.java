package com.zy.role.services;

import java.util.List;
import java.util.Map;

import com.zy.role.entities.Menu;

public interface MenuService {

	List<Menu> getMainList(Long userid);

	List<Map<String, Object>> getMenuTreeByParentId(Long userId,Long menuId);

}
