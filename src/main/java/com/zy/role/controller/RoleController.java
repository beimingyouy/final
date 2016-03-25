package com.zy.role.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.role.entities.Role;
import com.zy.role.services.roleService;
import com.zy.role.view.View;

@Controller
@RequestMapping("/role")
public class RoleController {

	@Autowired
	roleService roleService;

	@RequestMapping("/roleList")
	public String roleList() {

		return View.role.ROLE_LIST;
	}

	@RequestMapping(value = "/list.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> loadRole(
			HttpServletRequest request, String roleName) {
		int rows = Integer.valueOf(request.getParameter("rows"));
		int page = Integer.valueOf(request.getParameter("page"));
		Role role = new Role();
		role.setRoleName(roleName);
		Map<String, Object> map = new HashMap<String, Object>();
		map = roleService.queryAll(rows, page, role);
		return map;
	}

	@RequestMapping(value = "/toAdd.do")
	public String addRole() {

		return View.role.ROLE_ADD;
	}

	@RequestMapping(value = "/add.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> add(String roleName, String note,
			String total_checked_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		int isSuccess = roleService.add(total_checked_id, roleName, note);
		if (isSuccess == 0) {
			map.put("msg", "添加失败，角色名已存在");
			map.put("flag", "false");
		} else {
			map.put("msg", "添加成功");
			map.put("flag", "success");
		}
		return map;
	}

	@RequestMapping(value = "/toUpdate.do", method = RequestMethod.GET)
	public String toUpdate(Model model, Long roleId) {
		Role role = roleService.selectByPrimaryKey(roleId);
		model.addAttribute("role", role);
		return View.role.EDIT_ROLE;
	}

	// 提交更新
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> update(Role role,String total_checked_id) {
		Map<String, Object> map = new HashMap<String, Object>();
		int isSuccess = roleService.update(role,total_checked_id);
		if (isSuccess == 0) {
			map.put("msg", "添加失败");
			map.put("flag", "false");
		} else {
			map.put("msg", "添加成功");

			map.put("flag", "success");
		}
		return map;
	}

	// 删除
	@RequestMapping(value = "/toDelete.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> update(String ids) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			String[] idstr = ids.split(",");
			for (String id : idstr) {
				roleService.delete(Long.valueOf(id));
			}
			map.put("msg", "删除成功");
			map.put("flag", "success");
		} catch (Exception e) {
			map.put("msg", "删除失败");
			map.put("flag", "false");
		}

		return map;
	}

	@RequestMapping(value = "/loadMenuTree.do", method = RequestMethod.GET)
	public @ResponseBody List<Map<String, Object>> loadMenuTree(Model model,
			Long roleId) {
		List<Map<String, Object>> map = this.roleService.getMenuTree(roleId);

		return map;
	}
}
