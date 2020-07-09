package com.jhta.finalproject.hd.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.finalproject.hd.vo.CartListVo;

@Repository
public class CartDao {
	@Autowired
	private SqlSession sqlsession;
	private final String NAMESPACE="mybatis.mapper.CartMapper";
	
	public List<CartListVo> cartlist(HashMap<String, Object> map){
		return sqlsession.selectList(NAMESPACE+".cartlist", map);
	}
}
