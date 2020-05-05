package com.server;

import java.util.List;

import java.util.Map;

import com.entity.Keep;

public interface KeepServer {
//  添加
  public int add(Keep po);
//  修改
  public int update(Keep po);
//  删除
  public int delete(int id);
//  查询
  public List<Keep> getAll(Map<String, Object> map);
//  验证
  public Keep checkUname(String account);
//  获取对象
  public Keep getById( int id);
//  分页显示
  public List<Keep> getByPage(Map<String, Object> map);
//  获取信息的条数
  public int getCount(Map<String, Object> map);
//  模糊查询
  public List<Keep> select(Map<String, Object> map);
  
  public List<Keep> showTop10(Map<String, Object> map);
}
