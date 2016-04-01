package com.zy.notice.service;

import java.util.Map;

import com.zy.notice.entity.Notice;

public interface NoticeService {

	Map<String, Object> queryAll(int rows, int page, Notice notice);

	int insert(Notice notice);

	int delete(Long id);

	Notice selectByPrimaryKey(Long id);



}
