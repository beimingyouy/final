package com.zy.car.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.zy.car.entities.Car;

public interface CarMapper {
	int deleteByPrimaryKey(Long id);

	int Carsert(Car record);

	int insertSelective(Car record);

	Car selectByPrimaryKey(Long id);

	int updateByPrimaryKeySelective(Car record);

	int updateByPrimaryKey(Car record);

	List<Car> queryAll(@Param("start") int start, @Param("end") int end, @Param("carId") String carId);

	Integer getTotal(@Param("carId") String CarId);
}