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
	//전체취소 책수량복구를 위해 현재 책수량을 가져옴
	public int commonCount(HashMap<String, Object>map) {
		return sqlsession.selectOne(NAMESPACE+".commonCount", map);
	}
	public int returnBookCount(HashMap<String, Object>map) {
		return sqlsession.update(NAMESPACE+".returnBookCount", map);
	}
	public List<refundBookVo> getpaymentbook(HashMap<String, Object> map) {
		return sqlsession.selectList(NAMESPACE+".getpaymentbook",map);
	}
	
	public int inputrefund(HashMap<String,Object>map) {
		return sqlsession.insert(NAMESPACE+".inputrefund", map);
	}
}
