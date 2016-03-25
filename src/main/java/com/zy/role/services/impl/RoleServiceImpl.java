package com.zy.role.services.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.zy.role.dao.MenuMapper;
import com.zy.role.dao.RoleMapper;
import com.zy.role.dao.RoleMenuMapper;
import com.zy.role.entities.Menu;
import com.zy.role.entities.Role;
import com.zy.role.entities.RoleMenu;
import com.zy.role.services.roleService;

@Service
public class RoleServiceImpl implements roleService {

	@Autowired
	RoleMapper roleMapper;
	@Autowired
	MenuMapper menuMaper;
	@Autowired
	RoleMenuMapper roleMenuMapper;

	public Map<String, Object> queryAll(int rows, int pagenum, Role role) {
		Map<String, Object> datemap = new HashMap<String, Object>();
		int tatol = roleMapper.getTotal(role.getRoleName());
		int start = rows * (pagenum - 1);
		int end = rows * pagenum;
		datemap.put("rows", roleMapper.queryAll(start, end, role.getRoleName()));
		datemap.put("total", tatol);
		return datemap;
	}

	public Role selectByPrimaryKey(Long roleId) {

		return roleMapper.selectByPrimaryKey(roleId);
	}

	public List<Map<String, Object>> getMenuTree(Long roleId) {
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
			treeNode.put("text", menuName);

		
			/*
			 * 只有在角色修改时，SQL语句中才有role_menu_id字段
			 */
			if (!StringUtils.isEmpty(roleId)) {
				List<RoleMenu> list = roleMenuMapper.selectByRole(roleId);
				for (RoleMenu roleMenu : list) {
					Long roleMenuId  = roleMenu.getMenuId();
					if (roleMenuId == menuId) {
						treeNode.put("checked", true);
					}
				}
				
			}
			
			
			id_nodeMap.put(menuId + "", treeNode);
			if ("0".equals(parentId + "")) {
				listTree.add(treeNode);
			} else {
				/**
				 * 节点要挂到对应的父节点上
				 */

				Map<String, Object> parentNode = id_nodeMap.get(parentId + "");
				parentNode.put("state", "closed");
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

		listTree.get(listTree.size() - 1).put("state", "open");
		return listTree;
	}

	public int add(String total_checked_id, String roleName, String note) {
		Role role = new Role();
		role.setRoleName(roleName);
		role.setNote(note);
		if(roleMapper.querybyName(roleName)!=null){
			
			return 0;
		}
		int i = roleMapper.insertSelective(role);
		if (i == 0) {
			return 0;
		} else {
			String[] string = total_checked_id.split(",");
			Role role2 = roleMapper.querybyName(roleName);
			Long roleid = role2.getRoleId();
			
			for (String id : string) {			
				RoleMenu roleMenu = new RoleMenu();
				roleMenu.setMenuId(Long.valueOf(id));
				roleMenu.setRoleId(roleid);
				int n = roleMenuMapper.insertSelective(roleMenu);
				if(0 == n){
					return 0;
				}

			}
			return 1;
		}
		
	}

	public int delete(Long id) {
		if(1==roleMapper.deleteByPrimaryKey(id)){
			
			if(1==roleMenuMapper.deleteByPrimaryKey(id)){
				return 1;
			}
			else{
				return 0;
			}
		}
		
		else{
			return 0;
		}	
		
	}

	public int update(Role role, String total_checked_id) {
		if(0 == roleMapper.updateByPrimaryKeySelective(role)){
			return 0;
		}
		System.out.println("1");
		if(0 !=roleMenuMapper.deleteByPrimaryKey(role.getRoleId())){
			System.out.println("2");
			String [] strings = total_checked_id.split(",");
			for (String string : strings) {
				RoleMenu roleMenu = new RoleMenu();
				roleMenu.setRoleId(role.getRoleId());
				roleMenu.setMenuId(Long.valueOf(string));
				System.out.println("3");
				if(0==roleMenuMapper.insertSelective(roleMenu)){
					System.out.println("insert error");
					return 0;
				}
			}

			return 1;
		}else{
			return 0;
		}
	
	}

}
