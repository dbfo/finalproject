package com.jhta.finalproject.yj.dao;

import java.util.HashMap;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.finalproject.yj.vo.BigCategoryVO;
import com.jhta.finalproject.yj.vo.BooksVO;
import com.jhta.finalproject.yj.vo.ImgVO;
import com.jhta.finalproject.yj.vo.SmallCategoryVO;

@Repository
public class BooksDao {
	@Autowired
	private SqlSessionTemplate sqlsession;
	private final String NAMESPACE = "com.jhta.yj.mybatis.mapper.BooksMapper";

	public int booksInsert(BooksVO vo) {
		return sqlsession.insert(NAMESPACE + ".booksInsert", vo);
	}

	public int getBnum() {
		return sqlsession.selectOne(NAMESPACE + ".getBnum");
	}

	public int imgInsert(ImgVO vo) {
		return sqlsession.insert(NAMESPACE + ".imgInsert", vo);
	}

	public List<BigCategoryVO> getBigctg() {
		return sqlsession.selectList(NAMESPACE + ".bctg");
	}

	public List<SmallCategoryVO> getSmallctg() {
		return sqlsession.selectList(NAMESPACE + ".smctg");
	}

	public List<BooksVO> list() {
		return sqlsession.selectList(NAMESPACE + ".list");
	}
}
