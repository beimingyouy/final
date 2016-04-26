package com.zy.wm.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zy.wm.entities.Wm;

public interface WmMapper {
    int deleteByPrimaryKey(Long id);

    int insert(Wm record);

    int insertSelective(Wm record);

    Wm selectByPrimaryKey(Long id);
    
    Wm selectByWmId(String wmId);

    int updateByPrimaryKeySelective(Wm record);

    int updateByPrimaryKey(Wm record);
    
    List<Wm> queryAll(@Param("start")int start,@Param("end")int end,@Param("wmId")String wmId);

	Integer getTotal(@Param("wmId")String wmId);

	List<Wm> wmType();
}