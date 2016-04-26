package com.zy.out.services;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zy.out.dao.OutMapper;
import com.zy.out.entities.Out;
@Service
public class OutServiceImpl implements OutService {

	@Autowired 
	private OutMapper OutMapper;
	
	
	public  Map<String, Object> queryAll(int rows,int pagenum ,Out Out) {
		
		Map<String, Object> datemap = new HashMap<String, Object>();	
		int start = rows*(pagenum-1);
		int end = rows*pagenum;
		Integer tatol = OutMapper.getTotal(Out.getOutId());
		datemap.put("rows", OutMapper.queryAll(start,end,Out.getOutId()));
		datemap.put("total", tatol);
		return datemap;
	}
	public int insert(Out Out) {
		
		return OutMapper.insertSelective(Out);
	}
	public int update(Out Out) {
		
		return OutMapper.updateByPrimaryKeySelective(Out);
	}
	public int delete(Long id) {
		
		return OutMapper.deleteByPrimaryKey(id);
	}
	@Override
	public Out selectByPrimaryKey(Long id) {
		
		return OutMapper.selectByPrimaryKey(id);
	}

}
