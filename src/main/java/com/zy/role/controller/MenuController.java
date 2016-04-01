package com.zy.role.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.role.entities.Menu;
import com.zy.role.services.MenuService;
import com.zy.role.view.View;

@Controller
@RequestMapping("/menu")
public class MenuController {

	@Autowired
	private MenuService menuService;

	// 跳转到list页面
	@RequestMapping(value = "/menu_list.do", method = RequestMethod.GET)
	public String demoList() {
		return View.menu.MENU_LIST;
	}

	// 跳转add页面
	@RequestMapping(value = "/add_parent.do", method = RequestMethod.GET)
	public String addParentView() {
		return View.menu.MENU_ADD_PARENT;
	}

	// 跳转add页面
	@RequestMapping(value = "/add_child.do", method = RequestMethod.GET)
	public String addChildView(Model model, Long parentid, Long grade) {
		model.addAttribute("parentid", parentid);
		model.addAttribute("grade", grade);
		return View.menu.MENU_ADD_CHILD;
	}

	// 添加提交
	@RequestMapping(value = "/submit.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> add(Menu menu) {
		Map<String, Object> map = new HashMap<String, Object>();
		Long id = menu.getMenuId();
		if (null == menuService.selectByPrimaryKey(id)) {

			int isSuccess = menuService.insert(menu);

			if (isSuccess == 0) {
				map.put("msg", "添加失败");
				map.put("flag", "false");
			} else {
				map.put("msg", "添加成功");
				map.put("flag", "success");
			}

		} else {
			System.out.println(menuService.selectByPrimaryKey(id).getMenuName());
			map.put("msg", "此id已经存在，请输入其他id");
			map.put("flag", "false");
		}
		return map;
	}

	// 跳转更新页面
	@RequestMapping(value = "/toUpdate.do", method = RequestMethod.GET)
	public String toUpdate(Model model, Long id) {
		Menu menu = menuService.selectByPrimaryKey(id);
		model.addAttribute("menu", menu);
		return View.menu.MENU_UPDATE;
	}

	// 提交更新
	@RequestMapping(value = "/update.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> update(Menu menu) {
		Map<String, Object> map = new HashMap<String, Object>();
		int isSuccess = menuService.update(menu);
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
	public @ResponseBody Map<String, Object> update(Long id) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			menuService.deleteByParentId(id);
			menuService.delete(id);
			map.put("msg", "删除成功");
			map.put("flag", "success");
		} catch (Exception e) {
			map.put("msg", "删除失败");
			map.put("flag", "false");

		}

		return map;
	}

	// 跳转更新页面
	@RequestMapping(value = "/view.do", method = RequestMethod.GET)

	public String toView(Model model, Long menuId) {
		Menu menu = menuService.selectByPrimaryKey(menuId);

		model.addAttribute("menu", menu);

		return View.menu.MENU_VIEW;

	}

	@RequestMapping(value = "/loadMenuTree.do", method = RequestMethod.GET)
	public @ResponseBody List<Map<String, Object>> loadMenuTree() {
		List<Map<String, Object>> map = this.menuService.getMenuTree();
		return map;
	}
}
