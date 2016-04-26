package com.zy.wm.services;
import java.util.List;
import java.util.Map;

import com.zy.wm.entities.Wm;


public interface WmService {

	public Wm selectByPrimaryKey(Long id);

	public Map<String, Object> queryAll(int rows,int page,Wm Wm);

	public int insert(Wm Wm);

	public int update(Wm Wm);

	public int delete(Long long1);
	
	public List<Wm> wmType();

	public Wm selectByWmId(String wmId);
	

}
