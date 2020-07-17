package com.jhta.finalproject.yr.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.finalproject.yr.vo.PaymentAndBookListVo;

@Repository
public class ShipManageDao {
	
	@Autowired
	private SqlSessionTemplate session;
	private final String NAMESPACE ="com.jhta.yr.mybatis.mapper.ShipMapper";
	
	//상단바 배송상태갯수리스트
	public List<HashMap<String, Object>> getShipCount(){
		return session.selectList(NAMESPACE+".shipCount");
	}
	
	//입금중 -> 배송 준비중 으로 상태 업데이트	
	public int updateBeforeToPreparing(List<Integer> list) {
		return session.update(NAMESPACE+".updateBeforeToPreparing",list);
	}
	
	public int updatePrepareToShipping(int bpaynum) {
		return session.update(NAMESPACE+".updatePrepareToShipping",bpaynum);
	}
}
