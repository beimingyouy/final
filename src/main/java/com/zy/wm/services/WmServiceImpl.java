package com.zy.wm.services;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zy.wm.dao.WmMapper;
import com.zy.wm.entities.Wm;
@Service
public class WmServiceImpl implements WmService {

	@Autowired 
	private WmMapper WmMapper;
	
	
	public  Map<String, Object> queryAll(int rows,int pagenum ,Wm Wm) {
		
		Map<String, Object> datemap = new HashMap<String, Object>();
		
		int start = rows*(pagenum-1);
		int end = rows*pagenum;
		Integer tatol = WmMapper.getTotal(Wm.getWmId());
		datemap.put("rows", WmMapper.queryAll(start,end,Wm.getWmId()));
		datemap.put("total", tatol);
		return datemap;
	}
	public int insert(Wm Wm) {
		
		return WmMapper.insertSelective(Wm);
	}
	public int update(Wm Wm) {
		
		return WmMapper.updateByPrimaryKeySelective(Wm);
	}
	public int delete(Long id) {
		
		return WmMapper.deleteByPrimaryKey(id);
	}
	@Override
	public Wm selectByPrimaryKey(Long id) {
		
		return WmMapper.selectByPrimaryKey(id);
	}

}
