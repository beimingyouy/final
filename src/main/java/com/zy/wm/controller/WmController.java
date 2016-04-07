package com.zy.wm.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.role.entities.Role;
import com.zy.role.entities.UserRole;
import com.zy.role.services.UserRoleService;
import com.zy.role.services.roleService;
import com.zy.user.entities.User;
import com.zy.user.services.UserService;
import com.zy.wm.entities.Wm;
import com.zy.wm.services.WmService;
import com.zy.wm.view.View;

@Controller
@RequestMapping("/wm")
public class WmController {

	@Autowired
	private UserService userService;
	@Autowired
	private WmService wmService;
	@Autowired
	roleService roleService;

	@Autowired
	UserRoleService userRolerService;

	@RequestMapping("/wmList")
	public String wmList() {

		return View.wm.WM_LIST;
	}

	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> loadMenu(
			HttpServletRequest request, String wmId) {
		Wm wm = new Wm();
		wm.setWmId(wmId);
		int rows = Integer.valueOf(request.getParameter("rows"));
		int page = Integer.valueOf(request.getParameter("page"));
		Map<String, Object> map = new HashMap<String, Object>();
		map = wmService.queryAll(rows, page, wm);
		return map;
	}

	@RequestMapping(value = "/rolelist.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> rolelist(
			HttpServletRequest request, Long userid) {
		int rows = Integer.valueOf(request.getParameter("rows"));
		int page = Integer.valueOf(request.getParameter("page"));
		Map<String, Object> map = new HashMap<String, Object>();
		map = roleService.queryAll(rows, page, new Role());

		UserRole userrole = userRolerService.selectByPrimaryUserId(userid);
		if (null != userrole) {
			Long roleid = userrole.getRoleId();
			map.put("roleid", roleid);
		}
		return map;
	}

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view(Model model, Long id) {
		Wm wm = wmService.selectByPrimaryKey(id) ;
		model.addAttribute("user", wm);
		return View.wm.WM_ADD;
	}

	@RequestMapping(value = "/toAdd", method = RequestMethod.GET)
	public String addView() {
		return View.wm.WM_ADD;
	}

	@RequestMapping(value = "/submit", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> add(User user) {
		Map<String, Object> map = new HashMap<String, Object>();
		int isSuccess = userService.insert(user);

		if (isSuccess == 0) {
			map.put("msg", "添加失败");
			map.put("flag", "false");
		} else {
			map.put("msg", "添加成功");
			map.put("flag", "success");
		}
		return map;
	}

	@RequestMapping(value = "/toUpdate", method = RequestMethod.GET)
	public String toUpdate(Model model, String username) {
		User user = userService.selectByPrimaryKey(username);
		model.addAttribute("user", user);
		return View.wm.WM_ADD;
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> update(User user) {
		Map<String, Object> map = new HashMap<String, Object>();
		int isSuccess = userService.update(user);

		if (isSuccess == 0) {
			map.put("msg", "添加失败");
			map.put("flag", "false");
		} else {
			map.put("msg", "添加成功");
			System.out.println("1111");
			map.put("flag", "success");
		}
		return map;
	}

	@RequestMapping(value = "/toDelete", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> update(String ids) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			String[] idstr = ids.split(",");
			for (String id : idstr) {
				userService.delete(Long.valueOf(id));
			}
			map.put("msg", "删除成功");
			map.put("flag", "success");
		} catch (Exception e) {
			map.put("msg", "删除失败");
			map.put("flag", "false");
		}

		return map;
	}

	@RequestMapping(value = "/toGive.do", method = RequestMethod.GET)
	public String toGive(Model model, Long userid) {
		model.addAttribute("userid", userid);
		return View.wm.WM_ADD;
	}

	// 提交分配权限
	@RequestMapping(value = "/givesubmit", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> givesubmit(String roleid,
			Long userid) {
		Map<String, Object> map = new HashMap<String, Object>();
		UserRole newUserRole = new UserRole();
		System.out.println("roleid:" + roleid);
		System.out.println("userid:" + userid);
		newUserRole.setRoleId(Long.valueOf(roleid));
		newUserRole.setUserId(userid);
		UserRole userRole = userRolerService.selectByPrimaryUserId(userid);
		System.out.println(1);
		if (null != userRole) {
			System.out.println(2);
			int i = userRolerService.updateByPrimaryKeySelective(newUserRole);
			if (0 != i) {
				System.out.println(3);
				map.put("msg", "分配成功");
				map.put("flag", "true");
			} else {
				System.out.println(4);
				map.put("msg", "分配失败");
				map.put("flag", "false");
			}
		} else {
			int i = userRolerService.insertSelective(newUserRole);
			if (i == 1) {
				map.put("msg", "分配成功");
				map.put("flag", "true");
			} else {
				map.put("msg", "分配失败");
				map.put("flag", "false");
			}
		}
		return map;
	}

}
