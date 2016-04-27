package com.zy.out.services;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zy.car.dao.CarMapper;
import com.zy.car.entities.Car;
import com.zy.out.dao.OutMapper;
import com.zy.out.entities.Out;

@Service
@Transactional
public class OutServiceImpl implements OutService {

	@Autowired
	private OutMapper OutMapper;

	@Autowired
	private CarMapper carMapper;

	public Map<String, Object> queryAll(int rows, int pagenum, Out Out) {

		Map<String, Object> datemap = new HashMap<String, Object>();
		int start = rows * (pagenum - 1);
		int end = rows * pagenum;
		Integer tatol = OutMapper.getTotal(Out.getOutId());
		datemap.put("rows", OutMapper.queryAll(start, end, Out.getOutId()));
		datemap.put("total", tatol);
		return datemap;
	}

	public int insert(Out Out) {

		return OutMapper.insertSelective(Out);
	}

	public int update(Out Out, Car car) {
		if (Out.getState() == 1) {
			car.setCarCount(car.getCarCount() - Out.getCarCount());
			carMapper.updateByPrimaryKeySelective(car);
		}
		return OutMapper.updateByPrimaryKeySelective(Out);
	}

	public int delete(Long id) {

		Out out = OutMapper.selectByPrimaryKey(id);
		Car car = carMapper.selectByCarId(out.getCarId());
		if (out.getCarId() == null) {
			return OutMapper.deleteByPrimaryKey(id);
		}else if(out.getState()==0){
			return OutMapper.deleteByPrimaryKey(id);
		}
		else{
			car.setCarCount(car.getCarCount() + out.getCarCount());
			carMapper.updateByPrimaryKeySelective(car);
			return OutMapper.deleteByPrimaryKey(id);
		}
		
		
		
	}
	@Override
	public int check(long parseLong) {
		return OutMapper.check(parseLong);
	}

	@Override
	public Out selectByPrimaryKey(Long id) {

		return OutMapper.selectByPrimaryKey(id);
	}

}
