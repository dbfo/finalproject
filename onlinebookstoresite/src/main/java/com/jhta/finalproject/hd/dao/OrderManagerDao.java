package com.jhta.finalproject.hd.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.finalproject.hd.vo.refundBookVo;

@Repository
public class OrderManagerDao {
	@Autowired
	private SqlSession sqlsession;
	private final String NAMESPACE="mybatis.mapper.OrderManagerMapper";
	
	public int orderCancel(HashMap<String,Object>map) {
		return sqlsession.update(NAMESPACE+".orderCancel", map);
	}
	
	public List<refundBookVo> getpaymentbook(HashMap<String, Object> map) {
		return sqlsession.selectList(NAMESPACE+".getpaymentbook",map);
	}
	
	public int inputrefund(HashMap<String,Object>map) {
		return sqlsession.insert(NAMESPACE+".inputrefund", map);
	}
}
