package com.jhta.finalproject.hd.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.finalproject.hd.vo.OrderListResultVo;
import com.jhta.finalproject.hd.vo.ShipmentInfoVo;

@Repository
public class OrderDao {
	@Autowired
	private SqlSession sqlsession;
	private final String NAMESPACE="mybatis.mapper.OrderMapper";
	
	//주문리스트 출력
	public List<OrderListResultVo> inputorderlist(Map<String, Object>map){
		return sqlsession.selectList(NAMESPACE+".orderlist", map);
	}
	//구매하기버튼 바로클릭시 ( 장바구니 안들림 )
	public OrderListResultVo directOrder(int bnum){
		return sqlsession.selectOne(NAMESPACE+".directorder",bnum);
	}
	//회원번호로 회원 배송지 정보 가져옴.
	public ShipmentInfoVo getAddr(int mnum) {
		return sqlsession.selectOne(NAMESPACE+".getAddr",mnum);
	}
	//회원번호로 사용가능한 포인트가져옴.
	public int getPoint(int mnum) {
		return sqlsession.selectOne(NAMESPACE+".usablepoint",mnum);
	}

}
