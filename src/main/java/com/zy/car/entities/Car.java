package com.zy.car.entities;

import java.math.BigDecimal;

public class Car {
    private Long id;

    private String carId;

    private String carName;

    private Long carCount;

    private Long carAll;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getCarId() {
        return carId;
    }

    public void setCarId(String carId) {
        this.carId = carId == null ? null : carId.trim();
    }

    public String getCarName() {
        return carName;
    }

    public void setCarName(String carName) {
        this.carName = carName == null ? null : carName.trim();
    }

    public Long getCarCount() {
        return carCount;
    }

    public void setCarCount(Long carCount) {
        this.carCount = carCount;
    }

    public Long getCarAll() {
        return carAll;
    }

    public void setCarAll(Long carAll) {
        this.carAll = carAll;
    }
}