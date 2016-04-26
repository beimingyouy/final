package com.zy.out.services;
import java.util.Map;

import com.zy.out.entities.Out;


public interface OutService {

	public Out selectByPrimaryKey(Long id);

	public Map<String, Object> queryAll(int rows,int page,Out Out);

	public int insert(Out Out);

	public int update(Out Out);

	public int delete(Long long1);

}
