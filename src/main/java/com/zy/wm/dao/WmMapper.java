package com.zy.wm.dao;

import com.zy.wm.entities.Wm;

public interface WmMapper {
    int deleteByPrimaryKey(Long wmId);

    int insert(Wm record);

    int insertSelective(Wm record);

    Wm selectByPrimaryKey(Long wmId);

    int updateByPrimaryKeySelective(Wm record);

    int updateByPrimaryKey(Wm record);
}