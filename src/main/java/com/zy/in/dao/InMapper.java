package com.zy.in.dao;

import java.math.BigDecimal;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zy.in.entities.In;

public interface InMapper {
    int deleteByPrimaryKey(BigDecimal id);

    int insert(In record);

    int insertSelective(In record);

    In selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(In record);

    int updateByPrimaryKey(In record);
    
    List<In> queryAll(@Param("start") int start, @Param("end") int end, @Param("inId") String inId);

	Integer getTotal(@Param("inId") String inId);
}