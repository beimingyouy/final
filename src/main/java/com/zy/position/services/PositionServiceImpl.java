package com.zy.position.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zy.position.dao.PositionMapper;
import com.zy.position.entities.Position;
@Service
public class PositionServiceImpl implements PositionService {

	@Autowired 
	private PositionMapper PositionMapper;
	
	
	public  Map<String, Object> queryAll(int rows,int pagenum ,Position Position) {
		
		Map<String, Object> datemap = new HashMap<String, Object>();	
		int start = rows*(pagenum-1);
		int end = rows*pagenum;
		Integer tatol = PositionMapper.getTotal(Position.getpId());
		datemap.put("rows", PositionMapper.queryAll(start,end,Position.getpId()));
		datemap.put("total", tatol);
		return datemap;
	}
	public int insert(Position Position) {
		
		return PositionMapper.insertSelective(Position);
	}
	public int update(Position Position) {
		
		return PositionMapper.updateByPrimaryKeySelective(Position);
	}
	public int delete(Long id) {
		
		return PositionMapper.deleteByPrimaryKey(id);
	}
	@Override
	public Position selectByPrimaryKey(Long id) {
		
		return PositionMapper.selectByPrimaryKey(id);
	}
	@Override
	public Position selectByPId(String getpId) {
		return PositionMapper.selectByPId(getpId);
	}
	@Override
	public List<Position> pType() {
		return PositionMapper.pType();
	}
}
