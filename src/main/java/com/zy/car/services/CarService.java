package com.zy.car.services;
import java.util.List;
import java.util.Map;

import com.zy.car.entities.Car;


public interface CarService {

	public Car selectByPrimaryKey(Long id);
	
	public Car selectByPrimaryKey(String carId);

	public Map<String, Object> queryAll(int rows,int page,Car Car);

	public int insert(Car Car);

	public int update(Car Car);

	public int delete(Long long1);

	public List<Car> carType();

}
