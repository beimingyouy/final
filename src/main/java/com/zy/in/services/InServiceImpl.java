package com.zy.in.services;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.zy.in.dao.InMapper;
import com.zy.in.entities.In;
import com.zy.out.dao.OutMapper;
import com.zy.out.entities.Out;
import com.zy.position.dao.PositionMapper;
import com.zy.position.entities.Position;
import com.zy.wm.dao.WmMapper;
import com.zy.wm.entities.Wm;

@Transactional
@Service
public class InServiceImpl implements InService {

	@Autowired
	private InMapper inMapper;
	@Autowired
	private WmMapper wmMapper;
	@Autowired
	private PositionMapper pMapper;
	@Autowired
	private OutMapper outMapper;
	public Map<String, Object> queryAll(int rows, int pagenum, In in) {

		Map<String, Object> datemap = new HashMap<String, Object>();
		int start = rows * (pagenum - 1);
		int end = rows * pagenum;
		Integer total = inMapper.getTotal(in.getInId());
		datemap.put("rows", inMapper.queryAll(start, end, in.getInId()));
		datemap.put("total", total);
		return datemap;
	}

	public int insert(In In, Wm wm, Position p) {

		wmMapper.updateByPrimaryKey(wm);
		pMapper.updateByPrimaryKey(p);
		return inMapper.insertSelective(In);
	}

	public int update(In in,String state) {
		
		Out out = new Out();
		
		if(state.equals("1")){
			out.setOutId("Out"+in.getInId());
			out.setState(2L);
			out.setInId(in.getInId());
			outMapper.insertSelective(out);
		}
		Wm wm = wmMapper.selectByWmId(in.getWmId());
		Position p = pMapper.selectByPId(in.getpId());
		wm.setWmCount(wm.getWmCount() + in.getWmCount());
		p.setpCount(p.getpCount() + in.getpCount());

		wmMapper.updateByPrimaryKey(wm);
		pMapper.updateByPrimaryKey(p);

		return inMapper.updateByPrimaryKeySelective(in);
	}

	public int delete(Long id) {
		In in = inMapper.selectByPrimaryKey(id);
		System.out.println(in.getState()+"state:");
		System.out.println(in.getState()+"state:");
		System.out.println(in.getState()+"state:");
		System.out.println(in.getState()+"state:");
		System.out.println(in.getState()+"state:");
			Wm wm = wmMapper.selectByWmId(in.getWmId());
			Position p = pMapper.selectByPId(in.getpId());
			wm.setWmCount(wm.getWmCount() + in.getWmCount());
			p.setpCount(p.getpCount() + in.getpCount());

			wmMapper.updateByPrimaryKey(wm);
			pMapper.updateByPrimaryKey(p);
		
		return inMapper.deleteByPrimaryKey(id);
	}

	@Override
	public In selectByPrimaryKey(Long id) {

		return inMapper.selectByPrimaryKey(id);
	}

}
