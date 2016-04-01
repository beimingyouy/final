package com.zy.notice.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zy.notice.entity.Notice;



public interface NoticeMapper {
	int deleteByPrimaryKey(Long menuId);

	int insertSelective(Notice notice);

	Notice selectByPrimaryKey(Long notice_id);

	List<Notice> queryAll(@Param("start") int start, @Param("end") int end,
			@Param("notice_title") String notice_title);

	Integer getTotal(@Param("notice_title") String notice_title);
}
