package com.jhta.finalproject.jh.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SellerMainBoardDao {
	@Autowired
	private SqlSessionTemplate slqSession;
	private final String NAMESPACE="com.jhta.mybatis.mapper.SellerMainBoardMapper.jh";
	
	//상황판(최근 한달간 등록한 상품)
	public int getOldbookCount() {
		return slqSession.selectOne(NAMESPACE+".getOldbookCount");
	}
	
}
