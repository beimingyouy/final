package com.zy.out.entities;

import java.util.Date;

public class Out {
	private Long id;

	private String outId;

	private String inId;

	private String carId;

	private Long carCount;

	private Date createDate;

	private Date updateDate;

	private Long state;

	public Date getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}

	public Long getState() {
		return state;
	}

	public void setState(Long state) {
		this.state = state;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getOutId() {
		return outId;
	}

	public void setOutId(String outId) {
		this.outId = outId == null ? null : outId.trim();
	}

	public String getInId() {
		return inId;
	}

	public void setInId(String inId) {
		this.inId = inId == null ? null : inId.trim();
	}

	public String getCarId() {
		return carId;
	}

	public void setCarId(String carId) {
		this.carId = carId == null ? null : carId.trim();
	}

	public Long getCarCount() {
		return carCount;
	}

	public void setCarCount(Long carCount) {
		this.carCount = carCount;
	}

	public Date getCreateDate() {
		return createDate;
	}

	public void setCreateDate(Date createDate) {
		this.createDate = createDate;
	}
}