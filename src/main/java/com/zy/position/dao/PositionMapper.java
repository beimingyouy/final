package com.zy.position.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zy.position.entities.Position;

public interface PositionMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Position record);

    int insertSelective(Position record);

    Position selectByPrimaryKey(Long id);

    int updateByPrimaryKeySelective(Position record);

    int updateByPrimaryKey(Position record);
    
    List<Position> queryAll(@Param("start")int start,@Param("end")int end,@Param("pId")String pId);

   	Integer getTotal(@Param("pId")String pId);
   	
   	List<Position> pType();
}