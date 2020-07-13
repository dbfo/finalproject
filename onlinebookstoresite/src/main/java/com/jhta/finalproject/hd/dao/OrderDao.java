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
	
	public List<OrderResultVo> inputorderlist(Map<String, Object>map){
		return sqlsession.selectList(NAMESPACE+".orderlist", map);
	}

}
