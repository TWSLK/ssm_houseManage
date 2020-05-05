package com.server;

import java.util.List;
import java.util.Map;
import com.entity.BbsWithBLOBs;

public interface BbsServer {
	
	
//  添加
  public int add(BbsWithBLOBs po);
//  修改
  public int update(BbsWithBLOBs po);
//  删除
  public int delete(int id);
//  获取对象
  public BbsWithBLOBs getById( int id);
//  分页显示
  public List<BbsWithBLOBs> getByPage(Map<String, Object> map);
//  获取信息的条数
  public int getCount(Map<String, Object> map);
//  查询所有信息
  public List<BbsWithBLOBs> getAll(Map<String, Object> map);
//  模糊查询并分页
  public List<BbsWithBLOBs> select(Map<String, Object> map);
}
