package com.jhta.finalproject.jh.dao;

import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SellerMainBoardDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NAMESPACE="com.jhta.mybatis.mapper.SellerMainBoardMapper.jh";
	//중고판매자 인증
	public int sellerInsert(int mnum) {
		return sqlSession.insert(NAMESPACE+".sellerInsert", mnum);
	}
	
	
	//상황판(최근 한달간 등록한 상품)
	public int getOldbookCount(int snum) {
		return sqlSession.selectOne(NAMESPACE+".getOldbookCount",snum);
	}
	//상황판 최근 한달간 판매현황(1:입금대기중 , 2:입금완료/배송요청,  3: 판매완료/구매확정) 
	public int getOldbookSalestatusCount(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE+".getOldbookSalestatusCount", map);
	}
	//상황판 최근 한달간 정산현황(0:정산전,1:정산완료) 
	public int getObcompleteCount(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE+".getObcompleteCount", map);
	}
}
