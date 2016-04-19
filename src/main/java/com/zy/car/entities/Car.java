package com.zy.car.entities;

import java.math.BigDecimal;

public class Car {
    private Long id;

    private String carId;

    private String carName;

    private BigDecimal carCount;

    private BigDecimal carAll;

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

    public BigDecimal getCarCount() {
        return carCount;
    }

    public void setCarCount(BigDecimal carCount) {
        this.carCount = carCount;
    }

    public BigDecimal getCarAll() {
        return carAll;
    }

    public void setCarAll(BigDecimal carAll) {
        this.carAll = carAll;
    }
}