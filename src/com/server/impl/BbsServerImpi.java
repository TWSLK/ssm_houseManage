package com.server.impl;

import java.util.List;


import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.BbsMapper;
import com.entity.BbsWithBLOBs;
import com.server.BbsServer;
@Service
public class BbsServerImpi implements BbsServer {
   @Resource
   private BbsMapper bdao;



	@Override
	public List<BbsWithBLOBs> getAll(Map<String, Object> map) {
		return bdao.getAll(map);
	}

	@Override
	public List<BbsWithBLOBs> getByPage(Map<String, Object> map) {
		return bdao.getByPage(map);
	}

	@Override
	public int getCount(Map<String, Object> map) {
		return bdao.getCount(map);
	}

	@Override
	public List<BbsWithBLOBs> select(Map<String, Object> map) {
		return bdao.select(map);
	}

	@Override
	public int add(BbsWithBLOBs po) {
		return bdao.insertSelective(po);
	}

	@Override
	public int update(BbsWithBLOBs po) {
		return bdao.updateByPrimaryKeySelective(po);
	}

	@Override
	public int delete(int id) {
		return bdao.deleteByPrimaryKey(id);
	}

	@Override
	public BbsWithBLOBs getById(int id) {
		return bdao.selectByPrimaryKey(id);
	}


}
