package com.zy.util;

import java.util.List;

public class AjaxData {

	public AjaxData() {
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public void setErrorText(String errorText) {
		this.errorText = errorText;
	}

	public String getDataNote() {
		return dataNote;
	}

	public void setDataNote(String dataNote) {
		this.dataNote = dataNote;
	}

	public Object getData() {
		return data;
	}

	public void setData(Object data) {
		this.data = data;
	}

	public Object getOtherData() {
		return otherData;
	}

	public void setOtherData(Object otherData) {
		this.otherData = otherData;
	}

	public Integer getTotal() {
		return total;
	}

	public void setTotal(Integer total) {
		this.total = total;
	}

	public List getRows() {
		return rows;
	}

	public void setRows(List rows) {
		this.rows = rows;
	}

	public Object getErrorText() {
		return errorText;
	}

	public void setErrorText(Object errorText) {
		this.errorText = errorText;
	}

	private String code;
	private Object errorText;
	private String dataNote;
	private Object data;
	private Integer total;
	private List rows;
	private Object otherData;
}

