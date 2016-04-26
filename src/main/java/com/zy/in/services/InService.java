package com.zy.in.services;
import java.util.Map;

import com.zy.car.entities.Car;
import com.zy.in.entities.In;


public interface InService {

	public In selectByPrimaryKey(Long id);

	public Map<String, Object> queryAll(int rows,int page,In in);

	public int insert(Car Car);

	public int update(Car Car);

	public int delete(Long long1);

}
