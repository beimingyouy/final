package com.zy.in.services;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zy.car.dao.CarMapper;
import com.zy.car.entities.Car;
import com.zy.in.dao.InMapper;
import com.zy.in.entities.In;

@Service
public class InServiceImpl implements InService {

	@Autowired
	private CarMapper CarMapper;
	@Autowired
	private InMapper inMapper;

	public Map<String, Object> queryAll(int rows, int pagenum, In in) {

		Map<String, Object> datemap = new HashMap<String, Object>();
		int start = rows * (pagenum - 1);
		int end = rows * pagenum;
		Integer total = inMapper.getTotal(in.getInId());
		datemap.put("rows", inMapper.queryAll(start, end, in.getInId()));
		datemap.put("total", total);
		return datemap;
	}

	public int insert(Car Car) {

		return 1;
	}

	public int update(Car Car) {

		return CarMapper.updateByPrimaryKeySelective(Car);
	}

	public int delete(Long id) {

		return CarMapper.deleteByPrimaryKey(id);
	}

	@Override
	public Car selectByPrimaryKey(Long id) {

		return CarMapper.selectByPrimaryKey(id);
	}

}
