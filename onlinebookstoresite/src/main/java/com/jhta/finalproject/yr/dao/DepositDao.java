package com.jhta.finalproject.yr.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.finalproject.yr.vo.SettlementJoinVo;

@Repository
public class DepositDao {
	
	@Autowired
	private SqlSessionTemplate session;
	private final String NAMESPACE = "com.jhta.yr.mybatis.mapper.DepositMapper";
	
	public List<SettlementJoinVo> getSettlementList(HashMap<String, Object> map){
		return session.selectList(NAMESPACE+".settlementList",map);
	}
}
