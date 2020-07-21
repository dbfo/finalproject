package com.jhta.finalproject.yj.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.jhta.finalproject.yj.vo.QnaVO;

@Repository
public class QnaDao {
	@Autowired
	private SqlSessionTemplate session;
	private final String NAMESPACE = "com.jhta.yj.mybatis.mapper.QnaMapper";

	public List<QnaVO> unAnswerList() {
		return session.selectList(NAMESPACE + ".unAnswerList");
	}
}
