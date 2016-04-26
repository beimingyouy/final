package com.zy.in.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.car.entities.Car;
import com.zy.car.services.CarService;
import com.zy.in.entities.In;
import com.zy.in.services.InService;
import com.zy.in.view.View;

@Controller
@RequestMapping("/in")
public class InController {

	@Autowired
	private CarService CarService;
	
	@Autowired
	private InService inService;

	

	@RequestMapping("/inList")
	public String inList() {

		return View.in.IN_LIST;
	}

	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> loadMenu(HttpServletRequest request, String inId) {
		In in =  new In();
		in.setInId(inId);
		int rows = Integer.valueOf(request.getParameter("rows"));
		int page = Integer.valueOf(request.getParameter("page"));
		Map<String, Object> map = new HashMap<String, Object>();
		map = inService.queryAll(rows, page, in);
		return map;
	}

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view(Model model, Long id) {
		In in = inService.selectByPrimaryKey(id);
		model.addAttribute("in", in);
		return View.in.IN_VIEW;
	}
	

	@RequestMapping(value = "/toAdd", method = RequestMethod.GET)
	public String addView() {
		return View.in.IN_ADD;
	}

	@RequestMapping(value = "/submit", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> add(Car Car) {
		Map<String, Object> map = new HashMap<String, Object>();
		int isSuccess = CarService.insert(Car);
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
	public String toUpdate(Model model, Long id) {
		Car Car = CarService.selectByPrimaryKey(id);
		model.addAttribute("car", Car);
		return View.in.IN_VIEW;
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> update(Car Car) {
		Map<String, Object> map = new HashMap<String, Object>();
		int isSuccess = CarService.update(Car);

		if (isSuccess == 0) {
			map.put("msg", "更新失败");
			map.put("flag", "false");
		} else {
			map.put("msg", "更新成功");
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
				CarService.delete(Long.parseLong(id));
			}
			map.put("msg", "删除成功");
			map.put("flag", "success");
		} catch (Exception e) {
			map.put("msg", "删除失败");
			map.put("flag", "false");
		}

		return map;
	}

}
