package com.jhta.finalproject.hd.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.finalproject.hd.vo.HistoryListVo;
import com.jhta.finalproject.hd.vo.QnaHistoryVo;

@Repository
public class MyPageDao {
	@Autowired
	private SqlSession sqlsession;
	private final String NAMESPACE="mybatis.mapper.MyPageMapper";
	
	public List<HistoryListVo> orderhistory(HashMap<String, Object> map){
		return sqlsession.selectList(NAMESPACE+".orderhistory",map);
	}
	public HashMap<String, Object> confirmtype(int bpaynum) {
		return sqlsession.selectOne(NAMESPACE+".confirmtype",bpaynum);
	}
	
	public int countPaymentBook(int bpaynum) {
		return sqlsession.selectOne(NAMESPACE+".countPaymentBook",bpaynum);
	}
	public int getbcount(HashMap<String, Object>map) {
		return sqlsession.selectOne(NAMESPACE+".getbcount", map);
	}
	
	public String newBtitle(int bnum) {
		return sqlsession.selectOne(NAMESPACE+".newBtitle", bnum);
	}
	public HashMap<String, Object> usedBtilte(int bnum){
		return sqlsession.selectOne(NAMESPACE+".usedTitle",bnum);
	}
	public int countHistory(HashMap<String, Object> map) {
		return sqlsession.selectOne(NAMESPACE+".countHistory",map);
	}
	//문의내역 행수 
	public int countQnaHistory(HashMap<String, Object>map) {
		return sqlsession.selectOne(NAMESPACE+".countQnaHistory",map);
	}
	//문의내역리스트
	public List<QnaHistoryVo> qnahistory(HashMap<String, Object>map){
		return sqlsession.selectList(NAMESPACE+".qnaHistory",map);
	}
}
