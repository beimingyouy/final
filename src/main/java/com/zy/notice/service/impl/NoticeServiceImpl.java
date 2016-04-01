package com.zy.notice.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zy.notice.dao.NoticeMapper;
import com.zy.notice.entity.Notice;
import com.zy.notice.service.NoticeService;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired
	NoticeMapper noticeMapper;

	public Map<String, Object> queryAll(int rows, int page, Notice notice) {
		Map<String, Object> datemap = new HashMap<String, Object>();
		int start = rows * (page - 1);
		int end = rows * page;
		int tatol = noticeMapper.getTotal(notice.getNotice_title());
		datemap.put("rows",
				noticeMapper.queryAll(start, end, notice.getNotice_title()));
		datemap.put("total", tatol);
		return datemap;
	}

	public int insert(Notice notice) {

		return noticeMapper.insertSelective(notice);
	}

	public int delete(Long id) {

		if (1 == noticeMapper.deleteByPrimaryKey(id)) {
			return 1;
		} else {
			return 0;
		}
	}


	public Notice selectByPrimaryKey(Long id) {
		
		return noticeMapper.selectByPrimaryKey(id);
	}

}
