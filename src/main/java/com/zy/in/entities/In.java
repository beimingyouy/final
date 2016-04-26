package com.zy.in.entities;

import java.util.Date;

public class In {
	private Long id;

	private String inId;

	private String inNote;

	private String wmId;

	private Long wmCount;

	private String pId;

	private Long pCount;

	private Date createTime;

	private Date updateTime;

	private Long state;

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

	public String getInId() {
		return inId;
	}

	public void setInId(String inId) {
		this.inId = inId == null ? null : inId.trim();
	}

	public String getInNote() {
		return inNote;
	}

	public void setInNote(String inNote) {
		this.inNote = inNote == null ? null : inNote.trim();
	}

	public String getWmId() {
		return wmId;
	}

	public void setWmId(String wmId) {
		this.wmId = wmId;
	}

	public Long getWmCount() {
		return wmCount;
	}

	public void setWmCount(Long wmCount) {
		this.wmCount = wmCount;
	}

	public String getpId() {
		return pId;
	}

	public void setpId(String pId) {
		this.pId = pId;
	}

	public Long getpCount() {
		return pCount;
	}

	public void setpCount(Long pCount) {
		this.pCount = pCount;
	}

	public Date getCreateTime() {
		return createTime;
	}

	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}

	public Date getUpdateTime() {
		return updateTime;
	}

	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}
}