package com.zy.car.services;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.zy.car.dao.CarMapper;
import com.zy.car.entities.Car;
@Service
public class CarServiceImpl implements CarService {

	@Autowired 
	private CarMapper CarMapper;
	
	
	public  Map<String, Object> queryAll(int rows,int pagenum ,Car Car) {
		
		Map<String, Object> datemap = new HashMap<String, Object>();	
		int start = rows*(pagenum-1);
		int end = rows*pagenum;
		Integer tatol = CarMapper.getTotal(Car.getCarId());
		datemap.put("rows", CarMapper.queryAll(start,end,Car.getCarId()));
		datemap.put("total", tatol);
		return datemap;
	}
	public int insert(Car Car) {
		
		return CarMapper.insertSelective(Car);
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
	
	@Override
	public Car selectByPrimaryKey(String carId) {
		return CarMapper.selectByCarId(carId);
	}
	@Override
	public List<Car> carType() {
		return CarMapper.carType();
	}
}
