package com.jhta.finalproject.jh.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.finalproject.jh.vo.SellerSalesJoinVo;

@Repository
public class SellerSalesManagementDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NAMESPACE="com.jhta.mybatis.mapper.SellerSalesManagementMapper.jh";
	
	//중고판매관리(0:주문/입금대기중,1:결제완료, 2:배송중, 3:수령완료(구매확정), 4:환불) 상태별 리스트 가져오기
	public List<SellerSalesJoinVo> getSalesList(HashMap<String, Object> map){
		List<SellerSalesJoinVo> list=sqlSession.selectList(NAMESPACE+".getSalesList", map);
		return list;
	}
	
}
