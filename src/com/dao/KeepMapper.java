package com.dao;

import java.util.List;
import java.util.Map;

import com.entity.Keep;

public interface KeepMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(Keep record);

    int insertSelective(Keep record);

    Keep selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(Keep record);

    int updateByPrimaryKey(Keep record);
    
    public Keep checkUname(Map<String, Object> uname);
//  查询所有信息
  public List<Keep> getAll(Map<String, Object> map);
//  获取条数
  public int getCount(Map<String, Object> po); 
//  分页
  public List<Keep> getByPage(Map<String, Object> map);
//  模糊查询并分页
  public List<Keep> select(Map<String, Object> map);
  
  public List<Keep> showTop10(Map<String, Object> map);
}