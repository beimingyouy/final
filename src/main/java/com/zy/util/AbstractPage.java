package com.zy.util;

import java.io.Serializable;
import org.apache.ibatis.session.RowBounds;

public abstract class AbstractPage extends RowBounds implements Serializable {

	public AbstractPage() {
		rows = 20;
		page = 1;
		total = 0;
	}

	public int getRows() {
		return rows;
	}

	public void setRows(int rows) {
		this.rows = rows;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	private static final long serialVersionUID = 1L;
	protected int rows;
	protected int page;
	protected int total;
}
