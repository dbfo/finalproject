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
	//상황판 최근 한달간 판매현황(1:입금대기중 , 2:입금완료/배송요청,  3: 판매완료/구매확정) 
	public int getOldbookSalestatusCount(int salesStatus) {
		return slqSession.selectOne(NAMESPACE+".getOldbookSalestatusCount", salesStatus);
	}
}
