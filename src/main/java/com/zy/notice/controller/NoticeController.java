package com.zy.notice.controller;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zy.notice.entity.Notice;
import com.zy.notice.service.NoticeService;

@Controller
@RequestMapping(value = "/notice")
public class NoticeController {
	@Autowired
	private NoticeService noticeService;

	// 跳转到list页面
	@RequestMapping(value = "/notice_list.do", method = RequestMethod.GET)
	public String demoList() {
		return "/WEB-INF/view/notice/notice_list";
	}

	// 加载list
	@RequestMapping(value = "/list.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> loadMenu(
			HttpServletRequest request, String notice_title) {
		Notice notice = new Notice();
		notice.setNotice_title(notice_title);
		int rows = Integer.valueOf(request.getParameter("rows"));
		int page = Integer.valueOf(request.getParameter("page"));
		Map<String, Object> map = new HashMap<String, Object>();
		map = noticeService.queryAll(rows, page, notice);
		return map;
	}

	// 跳转add页面
	@RequestMapping(value = "/notice_add.do", method = RequestMethod.GET)
	public String addView() {
		return "/WEB-INF/view/notice/notice_add";
	}

	// 添加提交
	@RequestMapping(value = "/submit.do", method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> add(Notice notice,String end_date1) {
		Map<String, Object> map = new HashMap<String, Object>();


		
		DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		 Date end_date = null;
		 try {   
			 end_date = sdf.parse(end_date1);  
		       
		    } catch (Exception e) {   
		        e.printStackTrace();   
		    } 
		
		
		notice.setEnd_date(end_date);
		int isSuccess =noticeService.insert(notice);
		System.out.println(1);
		if (isSuccess == 0) {
			map.put("msg", "添加失败");
			map.put("flag", "false");
		} else {
			map.put("msg", "添加成功");
			map.put("flag", "success");
		}
		return map;
	}

	
	//删除
	@RequestMapping(value="/toDelete.do",method = RequestMethod.POST)
	public @ResponseBody Map<String, Object> update(String ids) {		
		Map<String, Object> map = new HashMap<String, Object>();
		try {
			String[] idstr = ids.split(",");
			for (String id : idstr) {
				System.out.println(id);
				noticeService.delete(Long.valueOf(id));
			}
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
	public String toView(Model model, Long id) {
		Notice notice = noticeService.selectByPrimaryKey(id);
		DateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		if(null != notice.getEnd_date()){
			String end_date = sdf.format(notice.getEnd_date());
			model.addAttribute("end_date", end_date);
		}
		model.addAttribute("create_date", sdf.format(notice.getCreate_date()));
		model.addAttribute("notice", notice);
		return "/WEB-INF/view/notice/notice_view";
	}
}
