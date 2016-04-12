package com.zy.position.services;
import java.util.Map;

import com.zy.position.entities.Position;


public interface PositionService {

	public Position selectByPrimaryKey(Long id);

	public Map<String, Object> queryAll(int rows,int page,Position Position);

	public int insert(Position Position);

	public int update(Position Position);

	public int delete(Long long1);

}
