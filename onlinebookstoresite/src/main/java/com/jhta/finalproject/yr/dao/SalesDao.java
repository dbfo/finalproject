package com.jhta.finalproject.yr.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SalesDao {
	@Autowired
	private SqlSessionTemplate session;
	private final String NAMESPACE = "com.jhta.yr.mybatis.mapper.SalesMapper";
	
	public List<HashMap<String, String>> getList(HashMap<String,Object> map){
		return session.selectList(NAMESPACE+".getList",map);
	}

	public List<HashMap<String, String>> mothList(HashMap<String,Object> map){
		return session.selectList(NAMESPACE+".mothList",map);
	}
	
	public List<HashMap<String, String>> weekList(HashMap<String,Object> map){
		return session.selectList(NAMESPACE+".weekList",map);
	}
}
