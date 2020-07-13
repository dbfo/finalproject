package com.jhta.finalproject.yr.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class ShipManageDao {
	
	@Autowired
	private SqlSessionTemplate session;
	private final String NAMESPACE ="com.jhta.yr.mybatis.mapper.ShipMapper";
	
	public List<Integer> getShipCount(){
		return session.selectList(NAMESPACE+".shipCount");
	}
	
	public int updateBeforeToPreparing(List<Integer> list) {
		return session.update(NAMESPACE+".updateBeforeToPreparing",list);
	}
	
}
