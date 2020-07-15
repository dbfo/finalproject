package com.jhta.finalproject.yr.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CSManageDao {
	
	@Autowired
	public SqlSessionTemplate session;
	
	private final String NAMESPACE = "com.jhta.yr.mybatis.mapper.CSMapper"; 
	
	public List<HashMap<String,Object>> getCSCount(){
		return session.selectList(NAMESPACE+".CSCount");
	}
	
}
