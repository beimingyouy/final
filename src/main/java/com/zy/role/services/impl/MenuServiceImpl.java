package com.zy.role.services.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zy.role.dao.MenuMapper;
import com.zy.role.entities.Menu;
import com.zy.role.services.MenuService;

@Service
public class MenuServiceImpl implements MenuService {

	@Autowired
	private MenuMapper menuMaper;

	public List<Menu> getMainList(Long userid) {

		return menuMaper.selectByUserId(userid);
	}

	@SuppressWarnings("unchecked")
	public List<Map<String, Object>> getMenuTreeByParentId(Long userId,Long menuId) {

		List<Map<String, Object>> listTree = new ArrayList<Map<String, Object>>();

		List<Menu> list = menuMaper.selectChirdren(userId, menuId);
		
		
		Map<String, Object> treeNode = null;
		Map<String, Map<String, Object>> id_nodeMap = new LinkedHashMap<String, Map<String, Object>>();
		Long menu_id = null;
		Long parentId = null;
		String menuName = "";
		String menuHref = "";
		Short isLeaf = null;
		for (Menu menu : list) {
			menu_id = menu.getMenuId();
			
			parentId = menu.getParentid();
			menuName = menu.getMenuName();
			menuHref = menu.getMenuHref();
			isLeaf = menu.getIsleft();

			treeNode = new HashMap<String, Object>();
			treeNode.put("id", menu_id);
			treeNode.put("text", menuName);
			treeNode.put("parentid", parentId);
			treeNode.put("menu_href", menuHref);
			treeNode.put("isLeaf", isLeaf);
			id_nodeMap.put(menu_id + "", treeNode);
			
			if (parentId==0) {
				listTree.add(treeNode);
			} else {
				
				Map<String, Object> parentNode = id_nodeMap.get(parentId+"");
				if (parentNode != null) {
					List<Map<String, Object>> childrenList = null;
					if (parentNode.get("children") == null) {
						childrenList = new ArrayList<Map<String, Object>>();
					} else {
						childrenList = (List<Map<String, Object>>) parentNode
								.get("children");
					}
					childrenList.add(treeNode);
					parentNode.put("children", childrenList);
				}
			}

		}
		return listTree;
	}

	public Menu selectByPrimaryKey(Long id) {
		
		return menuMaper.selectByPrimaryKey(id);
	}

	public List<Map<String, Object>> getMenuTree() {
		
		// 最大节
		List<Map<String, Object>> listTree = new ArrayList<Map<String, Object>>();
		// 树节点
		Map<String, Object> treeNode = null;
		// 叶子节点
		Map<String, Map<String, Object>> id_nodeMap = new LinkedHashMap<String, Map<String, Object>>();

		List<Menu> menuList = menuMaper.queryAll();

		for (Menu menu : menuList) {
			Long menuId = menu.getMenuId();
			String menuName = menu.getMenuName();
			Long parentId = menu.getParentid();
			treeNode = new LinkedHashMap<String, Object>();
			treeNode.put("id", menuId);
			treeNode.put("menuName", menu.getMenuName());
			treeNode.put("menuHref", menu.getMenuHref());
			treeNode.put("parentid", menu.getParentid());
			treeNode.put("isleft", menu.getIsleft());
			treeNode.put("grade", menu.getGrade());	
			id_nodeMap.put(menuId + "", treeNode);
			if ("0".equals(parentId + "")) {
				listTree.add(treeNode);
			} else {
				/**
				 * 节点要挂到对应的父节点上
				 */

				Map<String, Object> parentNode = id_nodeMap.get(parentId + "");
				parentNode.put("state", "open");
				List<Map<String, Object>> children = null;
				if (parentNode.get("children") == null) {
					children = new ArrayList<Map<String, Object>>();
				} else {
					children = (List<Map<String, Object>>) parentNode
							.get("children");
				}
				children.add(treeNode);
				parentNode.put("children", children);
			}
		}

		
		return listTree;
	}

	public int insert(Menu menu) {
		
		return menuMaper.insertSelective(menu);
	}

	public void delete(Long menuId) {
		menuMaper.deleteByPrimaryKey(menuId);		
	}

	public void deleteByParentId(Long id) {
		menuMaper.deleteByParentId(id);
		
	}

	public int update(Menu menu) {
		
		return menuMaper.updateByPrimaryKeySelective(menu);
	}

}
