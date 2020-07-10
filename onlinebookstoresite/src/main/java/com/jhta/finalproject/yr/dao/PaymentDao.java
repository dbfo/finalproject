package com.jhta.finalproject.yr.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.finalproject.yr.vo.PaymentVo;

@Repository
public class PaymentDao {
	
	@Autowired
	public SqlSessionTemplate session;
	private final String NAMESPACE = "com.jhta.yr.mybatis.mapper.PaymentMapper";
	
	public List<PaymentVo> allList(HashMap<String, Object> map){
		return session.selectList(NAMESPACE+".allList",map);
	}
}
