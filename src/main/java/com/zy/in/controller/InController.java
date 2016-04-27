package com.zy.in.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.in.entities.In;
import com.zy.in.services.InService;
import com.zy.in.view.View;
import com.zy.out.entities.Out;
import com.zy.out.services.OutService;
import com.zy.position.entities.Position;
import com.zy.position.services.PositionService;
import com.zy.wm.entities.Wm;
import com.zy.wm.services.WmService;


@Controller
@RequestMapping("/in")
public class InController {

	@Autowired
	private WmService wmService;
	@Autowired
	private PositionService pService;
	
	private OutService outService;

	@Autowired
	private InService inService;

	private static final Logger log = Logger.getLogger((InController.class));

	@RequestMapping("/inList")
	public String inList() {

		return View.in.IN_LIST;
	}

	@RequestMapping(value = "/list", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> loadMenu(HttpServletRequest request, String inId) {
		In in = new In();
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
	public @ResponseBody Map<String, Object> add(In in) {
		
		Map<String, Object> map = new HashMap<String, Object>();


		
		Wm wm = wmService.selectByWmId(in.getWmId());
		Position p = pService.selectByPId(in.getpId());
		
		if (wm.getWmCount() < in.getWmCount()) {
			System.out.println(wm.getWmCount() <= in.getWmCount());
			map.put("msg", "仓储资源可用数量只有" + wm.getWmCount() + "个");
			map.put("flag", "false");
			return map;
		} else if (p.getpCount() < in.getpCount()) {
			map.put("msg", "仓位资源可用位置只有" + wm.getWmCount() + "立方米");
			map.put("flag", "false");
			return map;
		} else {
			p.setpCount(p.getpCount()-in.getpCount());
			wm.setWmCount(wm.getWmCount() - in.getWmCount());
			
		}

		int isSuccess = inService.insert(in,wm,p);
		
		
		if (isSuccess == 0) {
			map.put("msg", "");
			map.put("flag", "false");
		} else {
			map.put("msg", "添加成功");
			map.put("flag", "success");
		}

		return map;
	}

	@RequestMapping(value = "/toUpdate", method = RequestMethod.GET)
	public String toUpdate(Model model, Long id) {
		In in = inService.selectByPrimaryKey(id);
		model.addAttribute("in", in);
		
		System.out.println(in.getState());
		System.out.println(in.getState());
		System.out.println(in.getState());
		System.out.println(in.getState());
		System.out.println(in.getState());
		return View.in.IN_UPDATE;
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> update(In in,String state) {
		Map<String, Object> map = new HashMap<String, Object>();
	
		System.out.println(in.getInId());
		System.out.println(in.getInId());
		System.out.println(in.getInId());
		System.out.println(in.getInId());
		System.out.println(in.getInId());
		int isSuccess = inService.update(in,state);
		
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
				System.out.println(id+"!!!!!!!!!!!!!");
				inService.delete(Long.parseLong(id));
			}
			map.put("msg", "删除成功");
			map.put("flag", "success");
		} catch (Exception e) {
			e.printStackTrace();
			log.info("删除失败!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!");
			map.put("msg", "删除失败");
			map.put("flag", "false");
		}

		return map;
	}
	


}
