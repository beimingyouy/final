package com.zy.out.controller;

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
import com.zy.out.entities.Out;
import com.zy.out.services.OutService;
import com.zy.out.view.View;

@Controller
@RequestMapping("/out")
public class OutController {

	@Autowired
	private CarService carService;

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
		Out out = outService.selectByPrimaryKey(id);
		model.addAttribute("out", out);
		return View.out.OUT_VIEW;
	}

	@RequestMapping(value = "/toAdd", method = RequestMethod.GET)
	public String addView() {
		return View.out.OUT_LIST;
	}

	

	@RequestMapping(value = "/toUpdate", method = RequestMethod.GET)
	public String toUpdate(Model model, Long id) {
		Out out = outService.selectByPrimaryKey(id);
		model.addAttribute("out", out);
		return View.out.OUT_UPDATE;
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> update(Out out, String state) {
		Map<String, Object> map = new HashMap<String, Object>();
		out.setState(Long.parseLong(state));
		
		Car car = carService.selectByPrimaryKey(out.getCarId());
		if(car.getCarCount()-out.getCarCount()<0){
			map.put("msg", "更新失败,车辆可用资源为"+car.getCarCount()+"辆");
			map.put("flag", "false");
			return map;
		}
		
		int isSuccess = outService.update(out,car);
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
				outService.delete(Long.parseLong(id));
			}
			map.put("msg", "删除成功");
			map.put("flag", "success");
		} catch (Exception e) {
			map.put("msg", "删除失败");
			map.put("flag", "false");
		}

		return map;
	}
	@RequestMapping(value = "/toCheck", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> toCheck(String ids) {
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			String[] idstr = ids.split(",");
			for (String id : idstr) {
				outService.check(Long.parseLong(id));
			}
			map.put("msg", "确认出库成功");
			map.put("flag", "success");
		} catch (Exception e) {
			map.put("msg", "确认失败");
			map.put("flag", "false");
		}

		return map;
	}

}
