package com.jhta.finalproject.yj.dao;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.finalproject.yj.vo.QnaAnswerVO;

@Repository
public class QnaAnswerDao {
	@Autowired
	private SqlSessionTemplate session;
	private final String NAMESPACE = "com.jhta.yj.mybatis.mapper.QnaAnswerMapper";

	public int qnaAnswerInsert(QnaAnswerVO vo) {
		return session.insert(NAMESPACE + ".qnaAnswerInsert", vo);
	}
}
