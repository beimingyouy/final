package com.zy.out.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zy.out.entities.Out;

public interface OutMapper {
	int deleteByPrimaryKey(Long id);

	int insert(Out record);

	int insertSelective(Out record);

	Out selectByPrimaryKey(Long id);

	int updateByPrimaryKeySelective(Out record);

	int updateByPrimaryKey(Out record);

	List<Out> queryAll(@Param("start") int start, @Param("end") int end, @Param("outId") String outId);

	Integer getTotal(@Param("outId") String outId);
}