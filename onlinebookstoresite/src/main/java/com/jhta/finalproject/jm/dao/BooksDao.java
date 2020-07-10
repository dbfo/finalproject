package com.jhta.finalproject.jm.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.finalproject.jm.vo.BigcateVo;
import com.jhta.finalproject.jm.vo.BooksVo;

@Repository
public class BooksDao {
	@Autowired
	private SqlSessionTemplate sqlSession;
	private final String NAMESPACE="com.jhta.mybatis.mapper.BooksMapper";
	
	public int count(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE + ".count",map);
	}
	public int sbooklist1count(HashMap<String, Object> map) {
		return sqlSession.selectOne(NAMESPACE + ".sbooklist1count",map);
	}
	public List<BooksVo> list(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE + ".list",map);
	}
	public List<BooksVo> bestlist(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE + ".bestlist",map);
	}
	public List<BigcateVo> list2(){
		return sqlSession.selectList(NAMESPACE + ".bcatelist");
	}
	public BooksVo detail(int num) {
		return sqlSession.selectOne(NAMESPACE + ".detail",num);
	}
	public int addHit(int num) {
		return sqlSession.update(NAMESPACE + ".hit",num);
	}
	public List<BooksVo> bbooklist(int num) {
		return sqlSession.selectList(NAMESPACE + ".bbooklist",num);
	}
	public List<BooksVo> sbooklist(int num) {
		return sqlSession.selectList(NAMESPACE + ".sbooklist",num);
	}
	public List<BooksVo> sbooklist(HashMap<String,Object> map) {
		return sqlSession.selectList(NAMESPACE + ".sbooklist1",map);
	}
	public List<BooksVo> catenovel(HashMap<String, Object> map){
		return sqlSession.selectList(NAMESPACE + ".catenovel",map);
	}
}
