package com.jhta.finalproject.yj.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.finalproject.yj.vo.BooksVO;
import com.jhta.finalproject.yj.vo.ImgVO;

@Repository
public class BooksDao {
	@Autowired
	private SqlSessionTemplate sqlsession;
	private final String NAMESPACE = "com.jhta.yj.mybatis.mapper.BooksMapper";

	public int booksInsert(BooksVO vo) {
		return sqlsession.insert(NAMESPACE + ".booksInsert", vo);
	}

	// �̹��� ���̺� ���� å��ȣ ���
	public int getBnum() {
		return sqlsession.selectOne(NAMESPACE + ".getBnum");
	}

	public int imgInsert(ImgVO vo) {
		return sqlsession.insert(NAMESPACE + ".imgInsert", vo);
	}

}
