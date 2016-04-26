package com.zy.out.controller;

import java.util.ArrayList;
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

import com.zy.out.entities.Out;
import com.zy.out.services.OutService;
import com.zy.out.view.View;
import com.zy.position.entities.Position;
import com.zy.position.services.PositionService;


@Controller
@RequestMapping("/out")
public class OutController {

	@Autowired
	private PositionService PositionService;
	
	@Autowired
	private OutService outService;
	
	

	

	@RequestMapping("/list")
	public String PositionList() {

		return View.out.OUT_LIST;
	}

	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> loadMenu(HttpServletRequest request, String outId) {
		Out out = new Out();
		out.setOutId(outId);
		int rows = Integer.valueOf(request.getParameter("rows"));
		int page = Integer.valueOf(request.getParameter("page"));
		Map<String, Object> map = new HashMap<String, Object>();
		map = outService.queryAll(rows, page, out);
		return map;
	}

	@RequestMapping(value = "/view", method = RequestMethod.GET)
	public String view(Model model, Long id) {
		Position p = PositionService.selectByPrimaryKey(id);
		model.addAttribute("p", p);
		return View.out.OUT_LIST;
	}

	@RequestMapping(value = "/toAdd", method = RequestMethod.GET)
	public String addView() {
		return View.out.OUT_LIST;
	}

	@RequestMapping(value = "/submit", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> add(Position Position) {
		Map<String, Object> map = new HashMap<String, Object>();
		int isSuccess = PositionService.insert(Position);
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
		Position Position = PositionService.selectByPrimaryKey(id);
		model.addAttribute("p", Position);
		return View.out.OUT_LIST;
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> update(Position Position) {
		Map<String, Object> map = new HashMap<String, Object>();
		int isSuccess = PositionService.update(Position);

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
				PositionService.delete(Long.parseLong(id));
			}
			map.put("msg", "删除成功");
			map.put("flag", "success");
		} catch (Exception e) {
			map.put("msg", "删除失败");
			map.put("flag", "false");
		}

		return map;
	}
	@RequestMapping(value="/pType",method = RequestMethod.POST)
	public @ResponseBody List<Position> wmType(){
		List<Position> list  =  new ArrayList<Position>();
		list = PositionService.pType();
		return list;
	}
}
