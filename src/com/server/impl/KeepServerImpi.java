package com.server.impl;

import java.util.List;

import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.dao.KeepMapper;
import com.entity.Keep;
import com.server.KeepServer;
@Service
public class KeepServerImpi implements KeepServer {
   @Resource
   private KeepMapper gdao;
	@Override
	public int add(Keep po) {
		return gdao.insert(po);
	}

	@Override
	public int update(Keep po) {
		return gdao.updateByPrimaryKeySelective(po);
	}

	@Override
	public int delete(int id) {
		return gdao.deleteByPrimaryKey(id);
	}

	@Override
	public List<Keep> getAll(Map<String, Object> map) {
		return gdao.getAll(map);
	}

	@Override
	public Keep checkUname(String account) {
		return null;
	}

	@Override
	public List<Keep> getByPage(Map<String, Object> map) {
		return gdao.getByPage(map);
	}

	@Override
	public int getCount(Map<String, Object> map) {
		return gdao.getCount(map);
	}

	@Override
	public List<Keep> select(Map<String, Object> map) {
		return gdao.select(map);
	}

	@Override
	public Keep getById(int id) {
		return gdao.selectByPrimaryKey(id);
	}

	@Override
	public List<Keep> showTop10(Map<String, Object> map) {
		return gdao.showTop10(map);
	}

}
