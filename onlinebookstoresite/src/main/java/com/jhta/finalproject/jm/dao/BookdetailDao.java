package com.jhta.finalproject.jm.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.finalproject.jm.vo.BooksVo;

@Repository
public class BookdetailDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NAMESPACE="com.jhta.mybatis.mapper.BooksMapper";
	
	public BooksVo bookdetail(int bnum){
		return sqlSession.selectOne(NAMESPACE + ".detail",bnum);
	}
	public int addHit(int bnum) {
		return sqlSession.update(NAMESPACE + ".hit",bnum);
	}
	
}
