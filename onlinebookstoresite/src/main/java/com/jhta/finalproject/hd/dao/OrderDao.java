package com.jhta.finalproject.hd.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.finalproject.hd.vo.OrderResultVo;

@Repository
public class OrderDao {
	@Autowired
	private SqlSession sqlsession;
	private final String NAMESPACE="mybatis.mapper.OrderMapper";
	
	//주문리스트 출력
	public List<OrderResultVo> inputorderlist(Map<String, Object>map){
		return sqlsession.selectList(NAMESPACE+".orderlist", map);
	}
	//회원번호로 주소가져옴.
	public String getAddr(int mnum) {
		return sqlsession.selectOne(NAMESPACE+".getAddr",mnum);
	}
	//회원번호로 사용가능한 포인트가져옴.
	public int getPoint(int mnum) {
		return sqlsession.selectOne(NAMESPACE+".usablepoint",mnum);
	}

}
