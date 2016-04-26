package com.zy.in.services;
import java.util.Map;

import com.zy.in.entities.In;
import com.zy.position.entities.Position;
import com.zy.wm.entities.Wm;


public interface InService {

	public In selectByPrimaryKey(Long id);

	public Map<String, Object> queryAll(int rows,int page,In in);

	public int insert(In In,Wm wm,Position p);
	

	public int update(In In);

	public int delete(Long long1);

}
